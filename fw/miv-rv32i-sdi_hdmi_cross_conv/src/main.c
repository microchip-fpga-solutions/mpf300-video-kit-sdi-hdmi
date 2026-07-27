/*-------------------------------------------------------------------------------------------------
--
-- File Name    : main.c
--
-- Description  : SDI/HDMI Bidirectional Converter
--                Implements two video conversion paths:
--                Path 1: SDI RX -> HDMI TX (auto rate detection via SPI)
--                Path 2: HDMI RX -> SDI TX (interrupt-driven)
--
-- Targeted device : Microchip FPGAs
-- Author          : India Solutions Team
--
-- COPYRIGHT 2023 BY MICROCHIP
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS
-- FROM MICROCHIP CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM
-- MICROCHIP FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND
-- NO BACK-UP OF THE FILE SHOULD BE MADE.
--
-------------------------------------------------------------------------------------------------*/

#include <drivers/fpga_ip/sdiXcvrSpeed/sdiTxXcvrSpeed.h>
#include <drivers/fpga_ip/sdiXcvrSpeed/sdiRxXcvrSpeed.h>
#include <drivers/fpga_ip/hdmi_config/hdmiTxXcvrSpeed.h>
#include <drivers/fpga_ip/hdmi_config/hdmiRxXcvrSpeed.h>
#include <stdio.h>
#include "platform/hal/hal.h"
#include "platform/miv_rv32_hal/miv_rv32_hal.h"

#include "platform/drivers/fpga_ip/CoreGPIO/core_gpio.h"
#include "platform/drivers/fpga_ip/hdmi_config/hdmi_tx.h"
#include "platform/drivers/CoreAXI4-Lite/AXI4-Lite.h"
#include "platform/drivers/fpga_ip/CoreI2C/core_i2c.h"
#include "platform/drivers/fpga_ip/CoreUARTapb/core_uart_apb.h"
#include "platform/drivers/fpga_ip/CoreSPI/core_spi.h"
#include "platform/drivers/fpga_ip/sdiHdr/sdiHdr.h"
#include "application/resolution_print.h"
#include "fpga_design_config.h"

/*-----------------------------------------------------------------------------
 * Register Offsets and Bit Masks
 */
#define SDIRX_REG_CONFIG_OFFSET     0x0C    // SDI RX speed configuration register
#define SDIRX_REG_STATUS_OFFSET     0x10    // SDI RX status register
#define SDIRX_STATUS_XCVR_RDY_BIT   0x01    // Transceiver ready bit
#define SDIRX_STATUS_ALIGN_BIT      0x02    // Word alignment achieved bit
#define SDIRX_STATUS_VIDEO_VALID    0x04    // Video valid signal bit

/*-----------------------------------------------------------------------------
 * SPI Commands for Re-clocker IC
 */
#define SPI_CMD_READ_RATE           0x8E00  // Read detected SDI rate
#define SPI_CMD_INIT                0x0602  // Initialization command

/*-----------------------------------------------------------------------------
 * Timeout Constants (in loop iterations)
 */
#define ALIGN_TIMEOUT_12G           15      // Alignment timeout for 12G SDI
#define ALIGN_TIMEOUT_6G            30      // Alignment timeout for 6G SDI
#define ALIGN_TIMEOUT_3G            50      // Alignment timeout for 3G/1.5G/270M SDI
#define VIDEO_CODE_TIMEOUT          3       // Video code detection timeout
#define SPI_READ_TIMEOUT            10      // SPI read operation timeout

/* SDI rate detection and status */
uint8_t sdi_speed = 0;                    /* Current SDI speed index (2=12G, 3=6G, 4=3G, 5=1.5G, 6=270M) */
uint8_t prev_sdi_speed = 0;               /* Previous SDI speed for transition handling */
uint8_t alignment_fail_cnt = 0;

/* Interrupt flags - MUST be volatile (modified by ISRs) */
volatile uint8_t hdmi_rx_irq_flag = 0;    /* HDMI RX interrupt flag (new video detected) */
volatile uint8_t sdi_tx_irq_flag = 0;     /* SDI TX interrupt flag (video code change) */
volatile uint8_t sdi_rx_irq = 0;          /* SDI RX interrupt flag (rate change detected) */
volatile uint8_t hpd_tx_irq = 0;          /* HDMI TX hot plug detect interrupt */

/* Transceiver status (not ISR-modified) */
uint32_t sdi_xcvr_status = 0;             /* SDI transceiver status */

/* Video format information (modified only in main context) */
uint32_t sdi_vic = 0;                     /* SDI TX video information code */
uint32_t sdi_vic_new = 0;                 /* Updated SDI TX VIC for change detection */
uint32_t sdi_rx_vic = 0;                  /* SDI RX video information code */
uint32_t hdmi_datarate = 0;               /* HDMI RX data rate */
uint8_t pixel_repetation = 0x0;

/*-----------------------------------------------------------------------------
 * Hardware Instances
 */
gpio_instance_t g_gpio_out;               // GPIO controller instance
i2c_instance_t g_i2c_instance_hdmitx;     // I2C controller for HDMI TX
UART_instance_t g_uart;                   // UART instance for debug output
spi_instance_t g_flash_core_spi;          // SPI instance for re-clocker IC

#define SPI_INSTANCE            &g_flash_core_spi
#define SPI_SLAVE               2         // SPI slave select line for re-clocker

/*-----------------------------------------------------------------------------
 * Welcome Message
 */
const uint8_t g_greeting_msg[] =
"\r\n*********************************************************************************\r\n\n\
**************************    SDI/HDMI Bi-directional   *************************\r\n\n\
*********************************************************************************\r\n\r\n";

/*-----------------------------------------------------------------------------
 * Function Prototypes
 */
/* Initialization functions */
void GPIO_settings(void);
void init_spi_reclocker(void);
void init_peripherals(void);

/* SDI RX functions */
uint8_t sdi_rx_rate_detection_spi(void);
uint8_t sdi_rx_align_status(void);
uint8_t sdi_rx_video_valid_status(void);
uint8_t sdi_rx_video_code_status(void);
uint8_t read_sdi_rate_from_spi(void);
uint8_t wait_for_sdi_alignment(uint8_t speed);
uint8_t wait_for_video_valid(void);
static uint8_t map_spi_rate_to_speed(uint8_t spi_rate, uint8_t *speed);

uint8_t get_hdmitx_colorformat(uint8_t sdirx_color_format);


/* Configuration helper functions */
void configure_pll_for_speed(uint8_t speed);
void configure_ngmux_for_vic(uint32_t vic);
void handle_speed_transition(uint8_t new_speed, uint8_t old_speed);
void configure_frame_rate_gpio(uint8_t vic_code, uint8_t fractional_flag);
void configure_case_gpio(uint8_t vic, uint8_t cs, uint8_t cd);

/* VIC helper functions */
uint8_t is_vic_supported(uint8_t vic_code);
uint8_t is_high_frame_rate_vic(uint8_t vic_code);
uint8_t is_interlaced_vic(uint8_t vic_code);

/* SDI TX and HDMI functions */
void process_sdi_tx_interrupt(void);
void process_hdmi_rx_interrupt(void);
void monitor_hdmi_rx_format(void);
void update_resolution_display(uint8_t *prev_vic, uint8_t *prev_frac, uint8_t *prev_color_format, uint8_t *prev_pix_width,uint8_t *blink);

/* External function declarations */
void bridge_drm_sdirx_hdmitx_monitor(uint8_t color_format, uint8_t vic, uint8_t pixel_repetation);
/*-----------------------------------------------------------------------------
 * Interrupt Handlers
 */

/**
 * Software Interrupt Handler
 * Clears software-triggered interrupts
 */
void Software_IRQHandler(void)
{
    MRV_clear_soft_irq();
}

/**
 * MSYS_EI0_IRQHandler
 * Handles HDMI RX interrupts (video format change detected)
 */
void MSYS_EI0_IRQHandler(void)
{
    hdmi_rx_irq_flag = 1;
}

/**
 * MSYS_EI1_IRQHandler
 * Handles I2C interrupts for HDMI TX communication
 * Returns: EXT_IRQ_KEEP_ENABLED to keep interrupt enabled
 */
uint8_t MSYS_EI1_IRQHandler(void)
{
    I2C_isr(&g_i2c_instance_hdmitx);
    return (EXT_IRQ_KEEP_ENABLED);
}

/**
 * MSYS_EI2_IRQHandler
 * Handles HDMI TX hot plug detect (HPD) interrupts
 */
void MSYS_EI2_IRQHandler(void)
{
    hpd_tx_irq = 1;
}

/**
 * MSYS_EI3_IRQHandler
 * Handles SDI TX interrupts (video code change from HDMI RX)
 */
void MSYS_EI3_IRQHandler(void)
{
    sdi_tx_irq_flag = 1;
}

/**
 * MSYS_EI4_IRQHandler
 * Handles SDI RX interrupts (rate change detected)
 */
void MSYS_EI4_IRQHandler(void)
{
    sdi_rx_irq = 1;
}


/*-------------------------------------------------------------------------
 * Main Function
 * Initializes hardware and runs the main conversion loop
 */
int main(void)
{
    uint16_t res_update_cnt = 0;
    uint8_t print_vic_code = 0, prev_print_vic_code = 0, blink = 0;
    uint8_t prev_fractional_flag = 0;
    uint8_t prev_color_format = 0;
    uint8_t prev_pix_width = 1;
    uint8_t hdmitx_color_format = 1;

    /* Initialize all peripherals */
    init_peripherals();

    delay(10);

    /* Initialize SDI RX XCVR settings */
    sdi_rx_default_settings();

    /* Initialize HDMI RX path */
    process_hdmi_rx_interrupt();

    /* Initialize SDI TX path if valid video detected */
    process_sdi_tx_interrupt();

    /* Enable global interrupts and start processing */
    HAL_enable_interrupts();
    GPIO_set_output(&g_gpio_out, GPIO_5, 0);  // De-assert XCVR calibration
    sdi_rx_irq = 1;  // Trigger initial SDI RX rate detection
    //hdmi_rx_irq_flag = 1;  // Trigger initial SDI RX rate detection

    /*-------------------------------------------------------------------------
     * Main Loop - Interrupt-driven state machine
     * Path 1: HDMI RX -> SDI TX (hdmi_rx_irq_flag, sdi_tx_irq_flag)
     * Path 2: SDI RX -> HDMI TX (sdi_rx_irq)
     */
    while (1) {
        delay(1);

        /* Handle HDMI RX interrupt - video format change */
        if (hdmi_rx_irq_flag) {
            hdmi_rx_irq_flag = 0;
            process_hdmi_rx_interrupt();
        }

        /* HDMI RX -> SDI TX continuous CS/CD bridge (change-gated) */
        monitor_hdmi_rx_format();

#if 1
        /* Handle SDI TX interrupt - video code change from HDMI RX */
        if (sdi_tx_irq_flag) {
            sdi_tx_irq_flag = 0;
            process_sdi_tx_interrupt();
        }

        /* Handle SDI RX interrupt - rate detection */
        delay(1);
        if (sdi_rx_irq) {
            if (sdi_rx_rate_detection_spi() == 1) {
                sdi_rx_irq = 0;
            }
        }

        /* Handle HDMI TX Hot Plug Detect - Configure scrambler */
        if (hpd_tx_irq) {
            hpd_tx_irq = 0;
            hdmi2p0_scambler_disable();
            if (sdi_speed == 2 && prev_color_format != 0 && (prev_print_vic_code != VIC_3840x2160p24 && prev_print_vic_code != VIC_4096x2160p24)) {
                delay(2);
                hdmi2p0_scambler_en();
            }
            else if (sdi_speed == 2 && prev_pix_width == 1 && prev_color_format == 0) {
                delay(2);
                hdmi2p0_scambler_en();
            }

        }

        /* Periodic resolution update and heartbeat */
        if (res_update_cnt >= 5) {
            res_update_cnt = 0;
            //SDI to HDMI
            update_resolution_display(&prev_print_vic_code, &prev_fractional_flag, &prev_color_format, &prev_pix_width,&blink);
            /* Configure pixel repetition for interlaced formats */
            pixel_repetation = is_interlaced_vic(print_vic_code) ? 0x3 : 0x0;
            hdmitx_color_format = get_hdmitx_colorformat(prev_color_format);

            bridge_drm_sdirx_hdmitx_monitor(hdmitx_color_format, print_vic_code, pixel_repetation);
            bridge_gcp_rx_to_tx(print_vic_code,hdmitx_color_format,prev_pix_width,sdi_speed);
            print_vic_code = prev_print_vic_code;
            if(print_vic_code == 0){
                sdi_rx_irq = 1;
                //UART_polled_tx_string(&g_uart, "print_vic_code received Zero. \r\n");
            }
        } else {
            res_update_cnt++;
        }

        //HDMI to SDI HDR
        drm_hdmirx_to_sditx();


#endif
    }

    return 0;
}


/*-----------------------------------------------------------------------------
 * sdi_rx_rate_detection_spi
 *
 * Performs SDI RX rate detection using SPI communication with re-clocker IC.
 * Configures both SDI RX and HDMI TX transceivers based on detected rate.
 *
 * Return: 1 if alignment achieved and video detected, 0 otherwise
 */
uint8_t sdi_rx_rate_detection_spi(void)
{
    uint8_t spi_rate;
    uint8_t vic_code;
    uint8_t fractional_flag;
    uint8_t color_format;
    uint8_t pix_width;
    uint8_t rate_detected;
    static const char* const sdi_rate_names[] = {
            "", "", "12 G", "6 G", "3 G", "1.5 G", "270 M"
    };
    /* Read SDI rate from re-clocker IC */
    spi_rate = read_sdi_rate_from_spi();
    rate_detected = map_spi_rate_to_speed(spi_rate, &sdi_speed);

    /* Set clock select GPIO based on rate */
    GPIO_set_output(&g_gpio_out, GPIO_4, (sdi_speed != 6) ? 1 : 0);

    if (rate_detected == 1) {

        /* Configure SDI RX IP */
        *(volatile unsigned int *)(SDIRX_COREAXI4_LITE_BASE_ADDR + SDIRX_REG_CONFIG_OFFSET) = sdi_speed;


        /* Configure PLL based on speed */
        configure_pll_for_speed(sdi_speed);

        /* Assert resets */
        GPIO_set_output(&g_gpio_out, GPIO_8, 0);  // SDI RX reset
        GPIO_set_output(&g_gpio_out, GPIO_6, 0);  // HDMI TX reset

        /* Handle speed transitions */
        handle_speed_transition(sdi_speed, prev_sdi_speed);

        /* Configure transceivers */
        update_sdi_rx_xcvr_speed(sdi_speed);
        prev_sdi_speed = sdi_speed;

        /* Release SDI RX reset and wait for alignment */
        GPIO_set_output(&g_gpio_out, GPIO_8, 1);
        axi4litewrite(SDI_COREAXI4_LITE_BASE_ADDR + SDI_CTRL_REG_ADDR, 0x01);


        if (!wait_for_sdi_alignment(sdi_speed)) {
            delay(1);
            return 0;
        }

        if(sdi_speed == 2){
            delay(2);
        }

        sdi_rx_vic = axi4literead((SDIRX_COREAXI4_LITE_BASE_ADDR + SDIRX_VIDEO_CODE_ADDR));

        /* Wait for valid video */
        if (!wait_for_video_valid()) {
            return 0;
        }

        /* Extract VIC and fractional flag */
        sdi_rx_vic = axi4literead((SDIRX_COREAXI4_LITE_BASE_ADDR + SDIRX_VIDEO_CODE_ADDR));
        vic_code = (uint8_t)(sdi_rx_vic & 0xFF);
        fractional_flag = (uint8_t)((sdi_rx_vic & 0xFF00) >> 8);
        color_format = (uint8_t)((sdi_rx_vic & 0x1E00) >> 9);
        pix_width = (uint8_t)((sdi_rx_vic & 0x6000) >> 13);

        /* Configure GPIOs based on video format */
        configure_frame_rate_gpio(vic_code, fractional_flag);

        update_hdmi_tx_xcvr_speed(vic_code,sdi_speed,color_format,pix_width);

        /* Configure HDMI TX and release reset */
        if (sdi_rx_video_code_status()) {
            GPIO_set_output(&g_gpio_out, GPIO_6, 1);  // Release HDMI TX reset

            hdmi2p0_scambler_disable();

            if (sdi_speed == 2 && color_format != 0) {
                delay(2);
                hdmi2p0_scambler_en();
            }
            else if (sdi_speed == 2 && pix_width == 1 && color_format == 0) {
                delay(2);
                hdmi2p0_scambler_en();
            }

            //delay(20);
            //axi4litewrite((SDIRX_COREAXI4_LITE_BASE_ADDR + SDI_CTRL_REG_ADDR),0x05);

            return 1;
        }
    }//if rate detected
    return 0;
}

/*-----------------------------------------------------------------------------
 * SDI RX Status Register Functions
 *-----------------------------------------------------------------------------*/

/**
 * read_sdi_rx_status - Read SDI RX status register (single HW access)
 */
static uint32_t read_sdi_rx_status(void)
{
    return *(volatile unsigned int *)(SDIRX_COREAXI4_LITE_BASE_ADDR + SDIRX_REG_STATUS_OFFSET);
}

/**
 * sdi_rx_align_status - Check word alignment status
 * @return: 1 if aligned, 0 otherwise
 */
uint8_t sdi_rx_align_status(void)
{
    return (read_sdi_rx_status() & SDIRX_STATUS_ALIGN_BIT) >> 1;
}

/**
 * sdi_rx_video_valid_status - Check video valid status
 * @return: 1 if video valid, 0 otherwise
 */
uint8_t sdi_rx_video_valid_status(void)
{
    return (read_sdi_rx_status() & SDIRX_STATUS_VIDEO_VALID) >> 2;
}

/*-----------------------------------------------------------------------------
 * sdi_rx_video_code_status
 *
 * Reads and validates SDI RX video information code
 *
 * Return: 1 if valid VIC detected, 0 otherwise
 */
uint8_t sdi_rx_video_code_status(void)
{
    sdi_rx_vic = axi4literead((SDIRX_COREAXI4_LITE_BASE_ADDR + SDIRX_VIDEO_CODE_ADDR));
    uint8_t vic_code = (uint8_t)(sdi_rx_vic & 0xFF);

    return is_vic_supported(vic_code);
}

/*-----------------------------------------------------------------------------
 * GPIO_settings
 *
 * Initializes GPIO controller and configures pin directions
 *
 * GPIO Pin Assignments:
 * GPIO_0-2:  Output (function TBD)
 * GPIO_3:    Output - SDO1_DISABLE (re-clocker control)
 * GPIO_4:    Output - CLK_SEL (clock selection: 1=HD+, 0=SD)
 * GPIO_5:    Output - XCVR calibration request
 * GPIO_6:    Output - HDMI TX IP reset (active low)
 * GPIO_7:    Output - Fractional frame rate indicator (59.94/29.97 vs 60/30)
 * GPIO_8:    Output - SDI RX IP reset (active low)
 * GPIO_9:    Output - Frame rate indicator (1=60/50Hz, 0=30/25/24Hz)
 * GPIO_10:   Input  - Status/feedback signal
 */
void GPIO_settings(void)
{
    GPIO_init(&g_gpio_out, COREGPIO_OUT_BASE_ADDR, GPIO_APB_32_BITS_BUS);
    GPIO_config(&g_gpio_out, GPIO_0, GPIO_OUTPUT_MODE);
    GPIO_config(&g_gpio_out, GPIO_1, GPIO_OUTPUT_MODE);
    GPIO_config(&g_gpio_out, GPIO_2, GPIO_OUTPUT_MODE);
    GPIO_config(&g_gpio_out, GPIO_3, GPIO_OUTPUT_MODE);  // SDO1_DISABLE
    GPIO_config(&g_gpio_out, GPIO_4, GPIO_OUTPUT_MODE);  // CLK_SEL
    GPIO_config(&g_gpio_out, GPIO_5, GPIO_OUTPUT_MODE);  // XCVR calib request
    GPIO_config(&g_gpio_out, GPIO_6, GPIO_OUTPUT_MODE);  // HDMI TX reset
    GPIO_config(&g_gpio_out, GPIO_7, GPIO_OUTPUT_MODE);  // Fractional frame rate
    GPIO_config(&g_gpio_out, GPIO_8, GPIO_OUTPUT_MODE);  // SDI RX reset
    GPIO_config(&g_gpio_out, GPIO_9, GPIO_OUTPUT_MODE);  // Frame rate 60/50 indicator
    GPIO_config(&g_gpio_out, GPIO_10, GPIO_OUTPUT_MODE);

    GPIO_set_output(&g_gpio_out, GPIO_3, 0);  // Enable SDO1
}

/*-----------------------------------------------------------------------------
 * VIC Helper Functions
 *-----------------------------------------------------------------------------*/

/**
 * is_vic_supported
 * Checks if the VIC code corresponds to a supported video format
 *
 * @param vic_code: Video Information Code to check
 * @return: 1 if supported, 0 otherwise
 */
uint8_t is_vic_supported(uint8_t vic_code)
{
    switch (vic_code) {
    case VIC_4096x2160p60:
    case VIC_4096x2160p50:
    case VIC_4096x2160p48:
    case VIC_4096x2160p30:
    case VIC_4096x2160p25:
    case VIC_4096x2160p24:
    case VIC_2048x1080p60:
    case VIC_2048x1080p50:
    case VIC_2048x1080p30:
    case VIC_2048x1080p25:

    case VIC_3840x2160p60:
    case VIC_3840x2160p50:
    case VIC_3840x2160p48:
    case VIC_3840x2160p30:
    case VIC_3840x2160p25:
    case VIC_3840x2160p24:
    case VIC_1920x1080p60:
    case VIC_1920x1080p50:
    case VIC_1920x1080p30:
    case VIC_1920x1080p25:
    case VIC_1920x1080i60:
    case VIC_1920x1080i50:
    case VIC_1280x720p60:
    case VIC_1280x720p50:
    case VIC_1280x720p30:
    case VIC_1280x720p25:
    case VIC_2048x1080i60:
    case VIC_2048x1080i50:
    case VIC_270M_525I:
    case VIC_270M_625I:
        return 1;
    default:
        return 0;
    }
}

/**
 * is_high_frame_rate_vic
 * Checks if VIC is a high frame rate format (50/60Hz)
 *
 * @param vic_code: Video Information Code to check
 * @return: 1 if high frame rate, 0 otherwise
 */
uint8_t is_high_frame_rate_vic(uint8_t vic_code)
{
    switch (vic_code) {
    case VIC_4096x2160p60:
    case VIC_4096x2160p50:
    case VIC_4096x2160p48:
    case VIC_3840x2160p60:
    case VIC_3840x2160p50:
    case VIC_3840x2160p48:
    case VIC_1920x1080p60:
    case VIC_1920x1080p50:
    case VIC_1280x720p60:
    case VIC_1280x720p50:
    case VIC_270M_625I:
    case VIC_270M_525I:
        return 1;
    default:
        return 0;
    }
}

/**
 * is_interlaced_vic
 * Checks if VIC is an interlaced format requiring pixel repetition
 *
 * @param vic_code: Video Information Code to check
 * @return: 1 if interlaced SD format, 0 otherwise
 */
uint8_t is_interlaced_vic(uint8_t vic_code)
{
    return (vic_code == VIC_270M_625I || vic_code == VIC_270M_525I);
}

/*-----------------------------------------------------------------------------
 * Configuration Helper Functions
 *-----------------------------------------------------------------------------*/

/**
 * configure_ngmux_for_vic
 * Sets NGMUX GPIO based on VIC code requirements
 *
 * @param vic: Video Information Code
 */
void configure_ngmux_for_vic(uint32_t vic)
{
    if (vic == 10 || vic == 25) {
        GPIO_set_output(&g_gpio_out, GPIO_10, 1);
    } else {
        GPIO_set_output(&g_gpio_out, GPIO_10, 0);
    }
}

/**
 * configure_pll_for_speed
 * Configures PLL registers based on SDI speed
 *
 * @param speed: SDI speed index (2=12G, 3=6G, 4=3G, 5=1.5G, 6=270M)
 */
void configure_pll_for_speed(uint8_t speed)
{
    if (speed == 6) {
        /* Divide by 10 for 270M SDI */
        *(volatile unsigned int *)(DRI_BASE_ADDR + 0x8100008) = 0x00000500;  // PLL_REF_FB
        *(volatile unsigned int *)(DRI_BASE_ADDR + 0x8100010) = 0x01007F00;  // PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + 0x8100018) = 0x00001014;  // PLL_CTRL2
        *(volatile unsigned int *)(DRI_BASE_ADDR + 0x810002C) = 0x000000FE;  // SSCG_REG_2
    } else {
        /* 1:1 ratio for HD/3G/6G/12G */
        *(volatile unsigned int *)(DRI_BASE_ADDR + 0x8100008) = 0x00000100;  // PLL_REF_FB
        *(volatile unsigned int *)(DRI_BASE_ADDR + 0x8100010) = 0x01000800;  // PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + 0x8100018) = 0x0000101C;  // PLL_CTRL2
        *(volatile unsigned int *)(DRI_BASE_ADDR + 0x810002C) = 0x00000020;  // SSCG_REG_2
    }
}

/**
 * handle_speed_transition
 * Handles special cases for large SDI speed transitions
 * Steps through intermediate rates to prevent PLL lock issues
 *
 * @param new_speed: Target SDI speed
 * @param old_speed: Previous SDI speed
 */
void handle_speed_transition(uint8_t new_speed, uint8_t old_speed)
{
    /* 270M to 12G transition - step through intermediate rates */
    //if (new_speed == 2 && old_speed == 6) {
    /*
    if (new_speed == 2) {
        delay(1);
        update_sdi_rx_xcvr_speed(4);  // Step through 3G
        delay(1);
        update_sdi_rx_xcvr_speed(3);  // Step through 6G
        delay(1);
    }
    // 270M to 270M - step through higher rate first
    else */
        if (new_speed == 6 && old_speed == 6) {
        delay(1);
        update_sdi_rx_xcvr_speed(2);  // Step through 12G
        delay(1);
    }
}

/**
 * configure_frame_rate_gpio
 * Configures GPIO pins based on frame rate characteristics
 *
 * @param vic_code: Video Information Code
 * @param fractional_flag: 1 for fractional rates (59.94/29.97), 0 for integer
 */
void configure_frame_rate_gpio(uint8_t vic_code, uint8_t fractional_flag)
{
    /* Set fractional frame rate indicator */
    GPIO_set_output(&g_gpio_out, GPIO_7, fractional_flag ? 1 : 0);

    /* Set frame rate indicator for audio configuration */
    GPIO_set_output(&g_gpio_out, GPIO_9, is_high_frame_rate_vic(vic_code) ? 1 : 0);
}

/*-----------------------------------------------------------------------------
 * Initialization Functions
 *-----------------------------------------------------------------------------*/

/**
 * init_spi_reclocker
 * Initializes SPI interface and sends init command to re-clocker IC
 */
void init_spi_reclocker(void)
{
    uint32_t spi_cmd;

    SPI_init(SPI_INSTANCE, CORESPI_BASE_ADDR, 32);
    SPI_configure_master_mode(SPI_INSTANCE);
    SPI_set_slave_select(SPI_INSTANCE, SPI_SLAVE);

    spi_cmd = SPI_CMD_INIT;
    SPI_transfer_block(SPI_INSTANCE, &spi_cmd, 1, 0, 0);
    delay(1);
    SPI_clear_slave_select(SPI_INSTANCE, SPI_SLAVE);
    delay(1);
}

/**
 * init_peripherals
 * Initializes all peripheral hardware
 */
void init_peripherals(void)
{
    GPIO_settings();
    HDMI_I2C_INIT();
    UART_init(&g_uart, COREUARTAPB0_BASE_ADDR, BAUD_VALUE_115200, (DATA_8_BITS | NO_PARITY));

    UART_polled_tx_string(&g_uart, g_greeting_msg);

    /* Enable external interrupt lines */
    MRV_enable_local_irq(MRV32_MSYS_EIE0_IRQn);  // HDMI RX IRQ
    MRV_enable_local_irq(MRV32_MSYS_EIE1_IRQn);  // I2C IRQ
    MRV_enable_local_irq(MRV32_MSYS_EIE2_IRQn);  // HDMI TX HPD IRQ
    MRV_enable_local_irq(MRV32_MSYS_EIE3_IRQn);  // SDI TX IRQ
    MRV_enable_local_irq(MRV32_MSYS_EIE4_IRQn);  // SDI RX IRQ

    init_spi_reclocker();
}

/*-----------------------------------------------------------------------------
 * SDI Rate Detection Functions
 *-----------------------------------------------------------------------------*/

/**
 * read_sdi_rate_from_spi
 * Reads SDI rate from re-clocker IC via SPI
 *
 * @return: Raw rate value from re-clocker (10=12G, 8=6G, 6=3G, 4=1.5G, 2=270M, 0=none)
 */
uint8_t read_sdi_rate_from_spi(void)
{
    uint32_t read_cmd = SPI_CMD_READ_RATE;
    uint8_t read_buffer[3] = {0};
    uint8_t retry_count = 0;

    SPI_init(SPI_INSTANCE, CORESPI_BASE_ADDR, 32);
    SPI_configure_master_mode(SPI_INSTANCE);
    SPI_set_slave_select(SPI_INSTANCE, SPI_SLAVE);

    while (read_buffer[0] == 0 && retry_count < SPI_READ_TIMEOUT) {
        delay(5);
        SPI_transfer_block(SPI_INSTANCE, &read_cmd, 1, read_buffer, sizeof(read_buffer));
        retry_count++;
    }

    SPI_clear_slave_select(SPI_INSTANCE, SPI_SLAVE);
    return read_buffer[0];
}

/**
 * map_spi_rate_to_speed
 * Maps re-clocker rate value to SDI speed index
 *
 * @param spi_rate: Raw rate from re-clocker
 * @param speed: Pointer to store mapped speed
 * @return: 1 if valid rate detected, 0 otherwise
 */
static uint8_t map_spi_rate_to_speed(uint8_t spi_rate, uint8_t *speed)
{
    switch (spi_rate) {
    case 10: *speed = 2; return 1;  // 12G SDI
    case 8:  *speed = 3; return 1;  // 6G SDI
    case 6:  *speed = 4; return 1;  // 3G SDI
    case 4:  *speed = 5; return 1;  // 1.5G SDI
    case 2:  *speed = 6; return 1;  // 270M SDI
    default: *speed = 0; return 0;
    }
}

/**
 * wait_for_sdi_alignment
 * Waits for SDI RX word alignment with retry and recalibration
 *
 * @param speed: Current SDI speed
 * @return: 1 if alignment achieved, 0 on timeout
 */
uint8_t wait_for_sdi_alignment(uint8_t speed)
{
    uint8_t alignment = 0;

    delay(speed == 2 ? 50 : 10);  // 12G needs extra time
    alignment = sdi_rx_align_status();

    /* 12G may need XCVR re-calibration if alignment fails */
    if (alignment == 0 && (speed == 2 || alignment_fail_cnt >= 3)) {
        sdi_rx_xcvr_calibrate(speed);
        GPIO_set_output(&g_gpio_out, GPIO_8, 0);
        GPIO_set_output(&g_gpio_out, GPIO_8, 1);
        delay(100);
        alignment = sdi_rx_align_status();
    }
    if (alignment)
        alignment_fail_cnt = 0;
    else
        alignment_fail_cnt++;

    return alignment;
}

/**
 * wait_for_video_valid
 * Waits for valid video code and video valid signals
 *
 * @return: 1 if both signals valid, 0 on timeout
 */
uint8_t wait_for_video_valid(void)
{
    uint8_t retry_count = 0;

    while (retry_count < VIDEO_CODE_TIMEOUT) {
        if (sdi_rx_video_code_status() && sdi_rx_video_valid_status()) {
            return 1;
        }
        delay(10);
        retry_count++;
    }

    return 0;
}

/*-----------------------------------------------------------------------------
 * Interrupt Processing Functions
 *-----------------------------------------------------------------------------*/

uint32_t timer_call_function(void)
{
    static uint32_t tick_timer_counter = 0;

    if (++tick_timer_counter >= 200000)
    {
        tick_timer_counter = 0;
        return 1;
    }
    return 0;
}
uint8_t wait_for_rx_pll_lock(void)
{
    while (1)
    {
        uint32_t lane0 = *(volatile unsigned int *)(DRI_BASE_ADDR + 0x110103C);
        uint32_t lane1 = *(volatile unsigned int *)(DRI_BASE_ADDR + 0x110203C);
        uint32_t lane2 = *(volatile unsigned int *)(DRI_BASE_ADDR + 0x110403C);

        if (((lane0 >> 22) & 0x1) && ((lane1 >> 22) & 0x1) && ((lane2 >> 22) & 0x1))
        {
            return 1;
        }

        if (timer_call_function())
        {
            UART_polled_tx_string(&g_uart, (const uint8_t *)"[HDMI_RX] PLL lock timeout\r\n");
            hdmi_rx_irq_flag = 1; // 1 gkk
            return 0;
        }
        if (hdmi_rx_irq_flag == 1)
        {
            return 0;
        }
    }
}
/*******************************************************************************
 * HDMI RX Debug Status Structure
 * Contains status bits for debugging HDMI receiver
 ******************************************************************************/
typedef struct {
    uint8_t hpd_i;                    /* Hot Plug Detect input */
    uint8_t r_rx_valid;               /* Red channel RX valid */
    uint8_t g_rx_valid;               /* Green channel RX valid */
    uint8_t b_rx_valid;               /* Blue channel RX valid */
    uint8_t hdmi_dvi_switch;          /* HDMI/DVI mode indicator */
    uint8_t lock_r;                   /* Red channel PLL lock */
    uint8_t lock_g;                   /* Green channel PLL lock */
    uint8_t lock_b;                   /* Blue channel PLL lock */
    uint8_t lock_rgb;                 /* Combined RGB lock status */
    uint8_t fifo_rd_en;               /* FIFO read enable */
    uint8_t fifo_afull_d2;            /* FIFO almost full flag */
    uint8_t resetn_fifo;              /* FIFO reset status */
    uint8_t hdmi_rx_aux_ready;        /* RX auxiliary channel ready */
    uint8_t hdmi_rx_ready;            /* RX video ready */
    uint8_t hdmi_rx_error;            /* RX error flag */
} HDMI_RX_Debug;
typedef HDMI_RX_Debug               hdmi_rx_debug_t;
void hdmi_rx_debug_decode(uint32_t dbg, hdmi_rx_debug_t *d)
{
    d->hpd_i           = (dbg >> 0)  & 0x1;
    d->r_rx_valid      = (dbg >> 1)  & 0x1;
    d->g_rx_valid      = (dbg >> 2)  & 0x1;
    d->b_rx_valid      = (dbg >> 3)  & 0x1;
    d->hdmi_dvi_switch = (dbg >> 4)  & 0x1;

    d->lock_r          = (dbg >> 5)  & 0x1;
    d->lock_g          = (dbg >> 6)  & 0x1;
    d->lock_b          = (dbg >> 7)  & 0x1;
    d->lock_rgb        = (dbg >> 8)  & 0x1;

    d->fifo_rd_en      = (dbg >> 9)  & 0x1;
    d->fifo_afull_d2   = (dbg >> 10) & 0x1;
    d->resetn_fifo     = (dbg >> 11) & 0x1;
    d->hdmi_rx_aux_ready   = (dbg >> 12) & 0x1;
    d->hdmi_rx_ready   = (dbg >> 13) & 0x1;
    d->hdmi_rx_error   = (dbg >> 14) & 0x1;
}

uint8_t wait_for_hdmi_rx_aux_ready(void)
{
    hdmi_rx_debug_t dbg;
    while (1)
    {
        uint32_t dbg_raw = axi4literead(HDMI_COREAXI4_LITE_BASE_ADDR+0X54);
        hdmi_rx_debug_decode(dbg_raw, &dbg);

        if (dbg.hdmi_rx_aux_ready == 1)
        {
            return 1;
        }

        if (timer_call_function())
        {
            UART_polled_tx_string(&g_uart, (const uint8_t *)"[HDMI_RX] Aux not ready (timeout)\r\n");
            hdmi_rx_irq_flag = 1; // 1 gkk
            return 0;
        }
        if(hdmi_rx_irq_flag==1)
        {
            return 0;
        }
    }
}
void lock_detection(void)
{
       hdmi_rx_debug_t dbg;
       uint32_t dbg_raw = axi4literead(HDMI_COREAXI4_LITE_BASE_ADDR+0X54);
       hdmi_rx_debug_decode(dbg_raw, &dbg);

       if(dbg.lock_rgb == 0 )
       {
           hdmi_rx_irq_flag=1; // 1 gkk
           return;
       }

}
uint8_t wait_for_hdmi_rx_video_ready(void)
{
    hdmi_rx_debug_t dbg;

    while (1)
    {
        uint32_t dbg_raw = axi4literead(HDMI_COREAXI4_LITE_BASE_ADDR+0X54);
        hdmi_rx_debug_decode(dbg_raw, &dbg);
        if (timer_call_function())
        {
            UART_polled_tx_string(&g_uart, (const uint8_t *)"[HDMI_RX] Video not ready (timeout)\r\n");
            hdmi_rx_irq_flag = 1; //1 gkk
            return 0;
        }
        if (dbg.hdmi_rx_ready == 1)
        {
            return 1;
        }
        if(hdmi_rx_irq_flag==1)
        {
            return 0;
        }
    }
}
/*-----------------------------------------------------------------------------
 * HDMI RX -> SDI TX continuous CS/CD bridge
 *
 * Polls AVI/GCP every main-loop iteration, gates updates on actual value
 * change so the CCC PLL and SDI TX core only reconfigure on real transitions.
 * Skips when hdmi_datarate==0. Prints a single status line per real change.
 *---------------------------------------------------------------------------*/
static uint8_t map_hdmi_cs_to_sdi_cf(uint8_t hdmi_cs)
{
    switch (hdmi_cs) {
        case HDMI_COLOR_SPACE_RGB:    return 2;
        case HDMI_COLOR_SPACE_YUV422: return 0;
        case HDMI_COLOR_SPACE_YUV444: return 1;
        case HDMI_COLOR_SPACE_YUV420: return 0;
        default:                       return 0;
    }
}

static uint8_t map_hdmi_cd_to_sdi_cd(uint8_t hdmi_cd)
{
    switch (hdmi_cd) {
        case HDMI_COLOR_DEPTH_12BIT: return 2;
        case HDMI_COLOR_DEPTH_16BIT: return 2;
        case HDMI_COLOR_DEPTH_10BIT: return 1;
        case HDMI_COLOR_DEPTH_8BIT:  return 0;
        default:                       return 0;
    }
}

void monitor_hdmi_rx_format(void)
{
    static uint32_t prev_rate = 0xFFFFFFFFu;
    static uint8_t  prev_vic  = 0xFF;
    static uint8_t  prev_cs   = 0xFF;
    static uint8_t  prev_cd   = 0xFF;

    if (hdmi_datarate == 0) return;

    lock_detection();

    /* HDMI stability gate: skip while a bring-up / lost-lock is in flight.
     * lock_detection() sets this flag on lock_rgb==0; wait_for_* helpers set
     * it on PLL/Aux/Video timeout. Pushing to SDI TX during those windows is
     * what caused the repeated mid-transient reprogramming. */
    if (hdmi_rx_irq_flag) return;

    uint8_t cd  = hdmi_rx_extract_color_depth();
    uint8_t cs  = hdmi_rx_extract_color_space();
    uint8_t vic = hdmi_rx_extract_vic();
    uint8_t any_change = 0;

    if (hdmi_datarate != prev_rate || vic != prev_vic) {
        prev_rate = hdmi_datarate;
        prev_vic  = vic;
        prev_cs   = 0xFF;
        prev_cd   = 0xFF;
        any_change = 1;
    }

    if (cd != prev_cd) {
        prev_cd = cd;
        update_hdmi_rx_sys_clk_ccc(cd);
        sdi_tx_set_color_depth(map_hdmi_cd_to_sdi_cd(cd));
        any_change = 1;
    }

    if (cs != prev_cs) {
        prev_cs = cs;
        sdi_tx_set_color_format(map_hdmi_cs_to_sdi_cf(cs));
        any_change = 1;
    }

    if (any_change) {
        uint32_t sdi_vic = axi4literead(SDI_COREAXI4_LITE_BASE_ADDR + SDI_VIDEO_CODE_ADDR) & 0xFFu;
        configure_case_gpio((uint8_t)sdi_vic, cs, cd);
        if (sdi_vic != 0u) {
            sdi_tx_xcvr_config(sdi_vic);
        }
    }
}


void configure_case_gpio(uint8_t vic, uint8_t cs, uint8_t cd)
{
    uint8_t case_code = 2;  /* Default case_code */

    switch (vic) {
        case 16:   /* 1080p60 */
        case 31:   /* 1080p50 */
        case 96:   /* 2160p50 */
        case 97:   /* 2160p60 */
        case 114:  /* 2160p48 */
        case 102:
        case 101:
        case 115:
        case 62:
        case 61:
        case 4:
        case 10:
        case 25:
            if (cd == HDMI_COLOR_DEPTH_8BIT || cd == 4) {
                if (cs == HDMI_COLOR_SPACE_RGB) {
                    case_code = 1;   /* 01: listed VICs + RGB    + 8-bit */
                } else if (cs == HDMI_COLOR_SPACE_YUV444) {  /* YUV444 = 2 */
                    case_code = 0;   /* 00: listed VICs + YUV444 + 8-bit */
                }
                /* YUV422 and others default to case_code = 2 */
            }
            break;
        default:
            break;
    }

    /* Overwrite SDI TX color format to YUV422 when case_code is 0 or 1 */
    if (case_code == 0 || case_code == 1) {
        sdi_tx_set_color_format(0);  /* Force YUV422 for SDI TX */
    }
    if (cs == 0 && cd == 2) {
        sdi_tx_set_color_depth (1);
    }

    GPIO_set_output(&g_gpio_out, GPIO_1, case_code & 0x1);         // Bit 0 (LSB)
    GPIO_set_output(&g_gpio_out, GPIO_2, (case_code >> 1) & 0x1);  // Bit 1 (MSB)
}


/**
 * process_hdmi_rx_interrupt
 * Handles HDMI RX interrupt - reconfigures HDMI RX XCVR for new data rate,
 * then proactively configures the SDI TX side using a VIC derived from the
 * HDMI rate (so we don't depend on the SDI TX core's internal auto-detect,
 * which doesn't fire for some rates).
 */
void process_hdmi_rx_interrupt(void)
{
    hdmi_datarate = (uint32_t)hdmi_rx_rate_detect();

    if(hdmi_datarate == 0) return;

    update_hdmi_rx_xcvr_speed(hdmi_datarate);

    if (!wait_for_rx_pll_lock())            return;
    if (!wait_for_hdmi_rx_aux_ready())      return;
    if (!wait_for_hdmi_rx_video_ready())    return;

    update_hdmi_rx_sys_clk_ccc(hdmi_rx_extract_color_depth());
}

/**
 * process_sdi_tx_interrupt
 * Handles SDI TX interrupt - configures SDI TX for new video from HDMI RX
 */
void process_sdi_tx_interrupt(void)
{
    /* SDI TX VIDEO_CODE register layout (new RTL):
     *   [7:0]=VIC, [12:9]=cf, [14:13]=cd, [15]=pf
     * In G_RES_AUTO_DET=1 mode, the SDI TX core auto-detects VIC internally
     * (works for 4K30 and below; doesn't lock for 4K60). The fallback in
     * process_hdmi_rx_interrupt() programs the SDI TX from the HDMI rate, so
     * an early return here is safe — the link is already configured. */
    sdi_vic = axi4literead(SDI_COREAXI4_LITE_BASE_ADDR + SDI_VIDEO_CODE_ADDR) & 0xFFu;

    if (sdi_vic == 0) {
        return;
    }

    configure_ngmux_for_vic(sdi_vic);
    sdi_tx_xcvr_config(sdi_vic);

    /* Re-read in case the SDI core's auto-detect updated VIC mid-config. */
    sdi_vic_new = axi4literead(SDI_COREAXI4_LITE_BASE_ADDR + SDI_VIDEO_CODE_ADDR) & 0xFFu;
    if (sdi_vic_new != sdi_vic && sdi_vic_new != 0) {
        sdi_tx_xcvr_config(sdi_vic_new);
    }

    /* One status line per settled SDI TX video-code change.
     * Read the full 16-bit VIDEO_CODE (VIC[7:0] | cf[12:9] | cd[14:13] | pf[15])
     * and the fractional flag from VIDEO_FORMAT register. */
    uint32_t vc     = axi4literead(SDI_COREAXI4_LITE_BASE_ADDR + SDI_VIDEO_CODE_ADDR);
    uint8_t  vic_p  = (uint8_t)(vc & 0xFFu);
    uint8_t  cf_p   = (uint8_t)((vc >> 9)  & 0x0Fu);
    uint8_t  cd_p   = (uint8_t)((vc >> 13) & 0x03u);
    uint8_t  frac_p = (uint8_t)(axi4literead(SDI_COREAXI4_LITE_BASE_ADDR + SDITX_VIDEO_FORMAT_ADDR) & 0x01u);
    resolution_print(vic_p, frac_p, cf_p, cd_p, 0);
}

/**
 * update_resolution_display
 * Periodic resolution update and heartbeat LED
 *
 * @param prev_vic: Pointer to previous VIC code for change detection
 * @param prev_frac: Pointer to previous fractional flag
 * @param blink: Pointer to LED blink state
 */
void update_resolution_display(uint8_t *prev_vic, uint8_t *prev_frac, uint8_t *prev_color_format, uint8_t *prev_pix_width, uint8_t *blink)
{
    uint8_t vic_code, fractional_flag, color_format, pix_width;

    sdi_rx_vic = axi4literead((SDIRX_COREAXI4_LITE_BASE_ADDR + SDIRX_VIDEO_CODE_ADDR));

    vic_code        = (uint8_t)(sdi_rx_vic & 0xFF);
    fractional_flag = (uint8_t)((sdi_rx_vic & 0x100) >> 8);
    color_format    = (uint8_t)((sdi_rx_vic & 0x1E00) >> 9);
    pix_width       = (uint8_t)((sdi_rx_vic & 0x6000) >> 13);

    if (*prev_vic != vic_code ||
        *prev_frac != fractional_flag ||
        *prev_color_format != color_format ||
        *prev_pix_width != pix_width)
    {
        GPIO_set_output(&g_gpio_out, GPIO_6, 0);  // Release HDMI TX reset

        configure_frame_rate_gpio(vic_code, fractional_flag);

        update_hdmi_tx_xcvr_speed(vic_code,sdi_speed,color_format,pix_width);

        GPIO_set_output(&g_gpio_out, GPIO_6, 1);  // Release HDMI TX reset

        hdmi2p0_scambler_disable();

        if (sdi_speed == 2 && color_format != 0 && ((vic_code!=VIC_3840x2160p24 && vic_code != VIC_4096x2160p24))) {
            delay(2);
            hdmi2p0_scambler_en();
        }
        else if (sdi_speed == 2 && pix_width == 1 && color_format == 0) {
            delay(2);
            hdmi2p0_scambler_en();
        }

        resolution_print(vic_code, fractional_flag, color_format, pix_width, 1);
    }

    /*
    if(*prev_vic == 0 && (vic_code == VIC_270M_625I || vic_code == VIC_270M_525I)){
       axi4litewrite((SDIRX_COREAXI4_LITE_BASE_ADDR + SDI_CTRL_REG_ADDR),0x04);
     }
    */

    *prev_frac = fractional_flag;
    *prev_vic = vic_code;
    *prev_color_format = color_format;
    *prev_pix_width = pix_width;

    *blink = ~(*blink);
    GPIO_set_output(&g_gpio_out, GPIO_0, *blink);
}

/**
 * update_resolution_display
 * Periodic resolution update and heartbeat LED
 *
 * @param prev_vic: Pointer to previous VIC code for change detection
 * @param prev_frac: Pointer to previous fractional flag
 * @param blink: Pointer to LED blink state
 */
uint8_t get_hdmitx_colorformat(uint8_t sdirx_color_format)
{
    switch (sdirx_color_format)
    {
        case 0: return 1;  // YCBCR422
        case 1: return 2;  // YCBCR444
        case 2: return 0;  // RGB444
        case 4: return 1;  // YCBCRA4224
        case 5: return 2;  // YCBCRA4444
        case 6: return 0;  // RGBA4444
        default: return 0; // safe fallback
    }
}
