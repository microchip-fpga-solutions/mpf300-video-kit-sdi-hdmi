/*-------------------------------------------------------------------------------------------------
--
-- File Name    : sdiTxXcvrSpeed.c

-- Description  : This module replicates the sdi XCVR Device Link speed settings.

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

#include "sdiTxXcvrSpeed.h"
#include "hal/hal.h"
#include "../../CoreAXI4-Lite/AXI4-Lite.h"
#include "../hdmi_config/hdmiRxXCVRSpeed.h"
#include "../CoreUARTapb/core_uart_apb.h"
#include "fpga_design_config.h"
#include <stdio.h>

extern UART_instance_t g_uart;

/*-----------------------------------------------------------------------------
 * Module Variables
 * NOTE: calib_status is not volatile - it's a local result, not ISR-modified
 *---------------------------------------------------------------------------*/
uint32_t pll_lock;
uint8_t calib_status;

/*-----------------------------------------------------------------------------
 * SDI Rate Definitions for VIC mapping
 *---------------------------------------------------------------------------*/
#define SDI_RATE_12G    0   /* 4K60, 4K50 */
#define SDI_RATE_6G     1   /* 4K30, 4K25, 4K24 */
#define SDI_RATE_3G     2   /* FHD60, FHD50 */
#define SDI_RATE_1_5G   3   /* FHD30, FHD25, HD60, HD50, HD30 */
#define SDI_RATE_270M   4   /* 625i, 525i */

/* SDI TX color format triple — driven from HDMI RX extraction in main.c
 * process_hdmi_rx_interrupt() via sdi_tx_set_*() calls, then packed into
 * VIDEO_CODE register by sdi_tx_xcvr_config(). Boot defaults are overridden
 * on the first HDMI RX link-up event. */
static uint8_t current_color_format = 0;  /* driven from HDMI RX */
static uint8_t current_color_depth  = 1;  /* driven from HDMI RX */
static uint8_t current_pic_format   = 0;  /* driven from HDMI RX (0=interlace, 1=progressive) */

void sdi_tx_set_color_format(uint8_t cf) { current_color_format = cf & 0x0F; }
void sdi_tx_set_color_depth (uint8_t cd) { current_color_depth  = cd & 0x03; }

/*-----------------------------------------------------------------------------
 * Utility Functions
 *---------------------------------------------------------------------------*/

/**
 * delay - Software delay loop
 * @param tms: Delay multiplier (approximate milliseconds)
 *
 * NOTE on volatile: The inner loop variable is volatile to prevent the
 * compiler from optimizing away the empty delay loop. The parameter
 * 'tms' doesn't need volatile since it's just a passed-in value.
 */
void delay(uint32_t tms)
{
    for (uint32_t i = 0; i < tms; i++) {
        for (volatile uint32_t j = 0; j < 50000; j++) {
            /* Empty loop - volatile prevents optimization */
        }
    }
}

/*-----------------------------------------------------------------------------
 * SDI TX XCVR Configuration
 *---------------------------------------------------------------------------*/
/**
 * sdi_tx_xcvr_config - Configure SDI TX transceiver for given video code
 * @param g_video_code: VIC (Video Information Code)
 */
void sdi_tx_xcvr_config(uint32_t g_video_code)
{
    axi4litewrite(SDI_COREAXI4_LITE_BASE_ADDR + SDI_CTRL_REG_ADDR, 0x00);

    /* SDI TX core is in G_RES_AUTO_DET=1 mode: it auto-detects VIC internally
     * but takes color_format / color_depth / pic_format from the AXI VIDEO_CODE
     * register. Write them here while the IP is disabled. The VIC byte in the
     * write is don't-care (the core ignores it in this mode). */
    uint32_t video_code_pkt = ((uint32_t)(g_video_code         & 0xFF) <<  0)
                            | ((uint32_t)(current_color_format & 0x0F) <<  9)
                            | ((uint32_t)(current_color_depth  & 0x03) << 13)
                            | ((uint32_t)(current_pic_format   & 0x01) << 15);
    axi4litewrite(SDI_COREAXI4_LITE_BASE_ADDR + SDI_VIDEO_CODE_ADDR, video_code_pkt);

    update_sdi_tx_xcvr_speed(g_video_code);
    axi4litewrite(SDI_COREAXI4_LITE_BASE_ADDR + SDI_CTRL_REG_ADDR, 0x03);
}

/**
 * get_sdi_rate_from_vic - Map VIC to SDI rate category
 * @param vic: Video Information Code
 * @return: SDI rate category
 */
static uint8_t get_sdi_rate_from_vic(uint32_t vic)
{
    switch (vic) {
        /* 4K @ 60/50/48 -> SDI 12G */
        case 97:  case 96:  case 114:    /* 3840x2160 p60/p50/p48 */
        case 102: case 101: case 115:    /* 4096x2160 p60/p50/p48 */
            return SDI_RATE_12G;

        /* 4K @ 30/25/24 -> SDI 6G */
        case 95:  case 94:  case 93:     /* 3840x2160 p30/p25/p24 */
        case 100: case 99:  case 98:     /* 4096x2160 p30/p25/p24 */
            return SDI_RATE_6G;

        /* 1080p / 2K @ 60/50/48 -> SDI 3G */
        case 16:  case 31:  case 111:    /* 1920x1080 p60/p50/p48 */
        case 128: case 129: case 130:    /* 2048x1080 p60/p50/p48 */
            return SDI_RATE_3G;

        /* 1080p/i, 2K p30/p25, 720p -> SDI 1.5G */
        case 34:  case 33:  case 32:     /* 1920x1080 p30/p25/p24 */
        case 5:   case 20:               /* 1920x1080 i60/i50 */
        case 131: case 132:              /* 2048x1080 p30/p25 */
        case 4:   case 19:               /* 1280x720  p60/p50 */
        case 62:  case 61:               /* 1280x720  p30/p25 */
            return SDI_RATE_1_5G;

        /* SD interlaced -> 270M */
        case 10:  case 25:               /* 525i / 625i */
            return SDI_RATE_270M;

        default:
            return SDI_RATE_1_5G;        /* safe fallback */
    }
}

/**
 * configure_sdi_tx_pll - Configure TX PLL for given rate
 * @param rate: SDI rate category
 */
static void configure_sdi_tx_pll(uint8_t rate)
{
    volatile uint32_t *pll_div_1  = (volatile uint32_t *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_CMN_BASE + TXPLL_DIV_1);
    volatile uint32_t *pll_div_2  = (volatile uint32_t *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_CMN_BASE + TXPLL_DIV_2);
    volatile uint32_t *pll_ja_1   = (volatile uint32_t *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_1);
    volatile uint32_t *pll_ja_2   = (volatile uint32_t *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_2);
    volatile uint32_t *pll_ja_3   = (volatile uint32_t *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_3);
    volatile uint32_t *pll_ja_4   = (volatile uint32_t *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_4);
    volatile uint32_t *pll_ja_5   = (volatile uint32_t *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_5);
    volatile uint32_t *pll_ja_6   = (volatile uint32_t *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_6);
    volatile uint32_t *pll_ja_7   = (volatile uint32_t *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_7);
    volatile uint32_t *pll_ja_9   = (volatile uint32_t *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_9);

    switch (rate) {
        case SDI_RATE_12G:  /* 11.88 Gbps */
            *pll_div_1 = 0x0028000F;
            *pll_div_2 = 0x025D1746;
            *pll_ja_1  = 0x00F8005D;
            *pll_ja_2  = 0x000007D0;
            *pll_ja_3  = 0x000402EE;
            *pll_ja_4  = 0x09B40019;
            *pll_ja_5  = 0x07A7E690;
            *pll_ja_6  = 0x01010409;
            *pll_ja_7  = 0x07126697;
            *pll_ja_9  = 0x00180028;
            break;

        case SDI_RATE_6G:   /* 5.94 Gbps */
            *pll_div_1 = 0x0028000F;
            *pll_div_2 = 0x025D1746;
            *pll_ja_1  = 0x01000030;
            *pll_ja_2  = 0x00000855;
            *pll_ja_3  = 0x00020190;
            *pll_ja_4  = 0x09AD0019;
            *pll_ja_5  = 0x07ABE690;
            *pll_ja_6  = 0x01010409;
            *pll_ja_7  = 0x07129673;
            *pll_ja_9  = 0x00180028;
            break;

        case SDI_RATE_3G:   /* 2.97 Gbps */
            *pll_div_1 = 0x0028000F;
            *pll_div_2 = 0x025D1746;
            *pll_ja_1  = 0x01000018;
            *pll_ja_2  = 0x000010AB;
            *pll_ja_3  = 0x00020190;
            *pll_ja_4  = 0x09AD0019;
            *pll_ja_5  = 0x07ABE690;
            *pll_ja_6  = 0x01010409;
            *pll_ja_7  = 0x07129673;
            *pll_ja_9  = 0x00180028;
            break;

        case SDI_RATE_1_5G: /* 1.485 Gbps */
            *pll_div_1 = 0x0028000F;
            *pll_div_2 = 0x025D1746;
            *pll_ja_1  = 0x0100000C;
            *pll_ja_2  = 0x00002155;
            *pll_ja_3  = 0x00020190;
            *pll_ja_4  = 0x09AD0019;
            *pll_ja_5  = 0x07ABE690;
            *pll_ja_6  = 0x01010409;
            *pll_ja_7  = 0x07129673;
            *pll_ja_9  = 0x00180028;
            break;

        case SDI_RATE_270M: /* 270 Mbps */
            *pll_div_1 = 0x0024000F;
            *pll_div_2 = 0x015D1746;
            *pll_ja_1  = 0x0140000C;
            *pll_ja_2  = 0x000029AB;
            *pll_ja_3  = 0x00020190;
            *pll_ja_4  = 0x09AD0019;
            *pll_ja_5  = 0x07B1E68C;
            *pll_ja_6  = 0x01010409;
            *pll_ja_7  = 0x07160531;
            *pll_ja_9  = 0x00180024;
            break;
    }
}

/**
 * update_sdi_tx_xcvr_speed - Update SDI TX XCVR speed for given VIC
 * @param g_video_code: Video Information Code
 */
void update_sdi_tx_xcvr_speed(uint32_t g_video_code)
{
    uint8_t rate = get_sdi_rate_from_vic(g_video_code);
    uint8_t clk_ctrl;

    /* Assert reset */
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_LN0_BASE + SER_RSTPD) = 0x3;

    uint8_t is_high_bw = (current_color_format == 2 /* RGB */ ||
                          current_color_format == 1 /* YUV444 */);
    if (is_high_bw) {
        /* RGB / YUV444 deep-color path */
        switch (rate) {
            case SDI_RATE_6G:   clk_ctrl = 0x70; break;
            case SDI_RATE_3G:   clk_ctrl = 0x71; break;
            case SDI_RATE_1_5G: clk_ctrl = 0x73; break;
            default:            clk_ctrl = 0x75; break;
        }
    } else {
        /* 8/10-bit YUV422 path (default) */
        switch (rate) {
            case SDI_RATE_12G:  clk_ctrl = 0x70; break;
            case SDI_RATE_6G:   clk_ctrl = 0x71; break;
            case SDI_RATE_3G:   clk_ctrl = 0x73; break;
            case SDI_RATE_1_5G: clk_ctrl = 0x75; break;
            case SDI_RATE_270M: clk_ctrl = 0x73; break;
            default:            clk_ctrl = 0x75; break;
        }
    }

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_LN0_BASE + SER_CLK_CTRL) = clk_ctrl;

    /* Configure PLL */
    configure_sdi_tx_pll(rate);

    /* Release reset */
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_TX_XCVR_PMA_LN0_BASE + SER_RSTPD) = 0x1;
}
