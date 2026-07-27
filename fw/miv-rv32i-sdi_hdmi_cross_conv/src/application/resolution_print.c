/*-------------------------------------------------------------------------------------------------
-- File Name    : resolution_print.c
-- Description  : Resolution printing utilities for SDI/HDMI converter
-- Author       : India Solutions Team
-- COPYRIGHT 2024 BY MICROCHIP
-------------------------------------------------------------------------------------------------*/

#include <stdio.h>
#include "resolution_print.h"
#include "../platform/drivers/fpga_ip/CoreUARTapb/core_uart_apb.h"
#include "../platform/drivers/CoreAXI4-Lite/AXI4-Lite.h"

extern UART_instance_t g_uart;
extern gpio_instance_t g_gpio_out;               // GPIO controller instance

/*-----------------------------------------------------------------------------
 * Lookup Tables (ROM)
 *---------------------------------------------------------------------------*/

static const char* const path_names[] = {
    "\r\n## HDMI_RX to SDI_TX Path ##  ",
    "\r\n## SDI_RX to HDMI_TX Path ##  "
};

static const char* const data_rate_label[] = {
     "HDMI data-rate : ",
     "SDI data-rate  : "
};

/* Data rates for SDI path per resolution index */
static const char* const rates_sdi[] = {
    "12 G", "12 G", "12 G", "6 G", "6 G", "6 G",     /* 4K resolutions - DCI*/
    "12 G", "12 G", "12 G", "6 G", "6 G", "6 G",     /* 4K resolutions */
    "3 G", "3 G", "1.5 G", "1.5 G",                /* 1080p - DCI*/
    "3 G", "3 G", "1.5 G", "1.5 G",                /* 1080p */
    "1.5 G","1.5 G", "1.5 G", "1.5 G",             /* 720p */
    "1.5 G", "1.5 G",                            /* 1080i */
    "1.5 G", "1.5 G",                            /* 1080i - DCI*/
    "270 Mbps", "270 Mbps"                     /* SD */
};

/* Data rates for HDMI path per resolution index — aligned to SDI-shaped 30-entry index */
static const char* const rates_hdmi[] = {
    "5940 Mbps", "5940 Mbps", "5940 Mbps", "2970 Mbps", "2970 Mbps", "2970 Mbps",  /* 4K - DCI */
    "5940 Mbps", "5940 Mbps", "5940 Mbps", "2970 Mbps", "2970 Mbps", "2970 Mbps",  /* 4K UHD */
    "1485 Mbps", "1485 Mbps", "742.5 Mbps", "742.5 Mbps",                          /* 1080p - DCI */
    "1485 Mbps", "1485 Mbps", "742.5 Mbps", "742.5 Mbps",                          /* 1080p */
    "742.5 Mbps", "742.5 Mbps", "742.5 Mbps", "742.5 Mbps",                        /* 720p */
    "742.5 Mbps", "742.5 Mbps",                                                    /* 1080i */
    "742.5 Mbps", "742.5 Mbps",                                                    /* 1080i - DCI */
    "270 Mbps", "270 Mbps"                                                         /* SD */
};

/* Resolution strings for SDI path [index][fractional=0, integer=1] */
static const char* const resolutions_sdi[][2] = {
    {"4096x2160p59.94", "4096x2160p60"},
    {"4096x2160p50", "4096x2160p50"},
    {"4096x2160p47.95", "4096x2160p48"},
    {"4096x2160p29.97", "4096x2160p30"},
    {"4096x2160p25", "4096x2160p25"},
    {"4096x2160p23.98", "4096x2160p24"},
    {"3840x2160p59.94", "3840x2160p60"},
    {"3840x2160p50", "3840x2160p50"},
    {"3840x2160p47.95", "3840x2160p48"},
    {"3840x2160p29.97", "3840x2160p30"},
    {"3840x2160p25", "3840x2160p25"},
    {"3840x2160p23.98", "3840x2160p24"},
    {"2048x1080p59.94", "2048x1080p60"},
    {"2048x1080p50", "2048x1080p50"},
    {"2048x1080p29.97", "2048x1080p30"},
    {"2048x1080p25", "2048x1080p25"},
    {"1920x1080p59.94", "1920x1080p60"},
    {"1920x1080p50", "1920x1080p50"},
    {"1920x1080p29.97", "1920x1080p30"},
    {"1920x1080p25", "1920x1080p25"},
    {"1280x720p60", "1280x720p60"},
    {"1280x720p50", "1280x720p50"},
    {"1280x720p29.97", "1280x720p30"},
    {"1280x720p25", "1280x720p25"},
    {"1920x1080i59.94","1920x1080i60"},
    {"1920x1080i50","1920x1080i50"},
    {"2048x1080i59.94","2048x1080i60"},
    {"2048x1080i50","2048x1080i50"},
    {"invalid", "SD 625i"},
    {"SD 525i", "invalid"}
};

/* Resolution strings for HDMI path [index][fractional=0, integer=1]
 * Aligned to the same 30-entry SDI-shaped index returned by vic_to_index(). */
static const char* const resolutions_hdmi[][2] = {
    {"4096x2160p59.94", "4096x2160p60"},
    {"4096x2160p50",    "4096x2160p50"},
    {"4096x2160p47.95", "4096x2160p48"},
    {"4096x2160p29.97", "4096x2160p30"},
    {"4096x2160p25",    "4096x2160p25"},
    {"4096x2160p23.98", "4096x2160p24"},
    {"3840x2160p59.94", "3840x2160p60"},
    {"3840x2160p50",    "3840x2160p50"},
    {"3840x2160p47.95", "3840x2160p48"},
    {"3840x2160p29.97", "3840x2160p30"},
    {"3840x2160p25",    "3840x2160p25"},
    {"3840x2160p23.98", "3840x2160p24"},
    {"2048x1080p59.94", "2048x1080p60"},
    {"2048x1080p50",    "2048x1080p50"},
    {"2048x1080p29.97", "2048x1080p30"},
    {"2048x1080p25",    "2048x1080p25"},
    {"1920x1080p59.94", "1920x1080p60"},
    {"1920x1080p50",    "1920x1080p50"},
    {"1920x1080p29.97", "1920x1080p30"},
    {"1920x1080p25",    "1920x1080p25"},
    {"1280x720p60",     "1280x720p60"},
    {"1280x720p50",     "1280x720p50"},
    {"1280x720p29.97",  "1280x720p30"},
    {"1280x720p25",     "1280x720p25"},
    {"1920x1080i59.94", "1920x1080i60"},
    {"1920x1080i50",    "1920x1080i50"},
    {"2048x1080i59.94", "2048x1080i60"},
    {"2048x1080i50",    "2048x1080i50"},
    {"invalid",         "SD 625i"},
    {"SD 525i",         "invalid"}
};

static const char* const colorformat_sdi[] = {
    "YCBCR 4:2:2",
    "YCBCR 4:4:4",
    "RGB 4:4:4",
    "invalid : 4:2:0",
    "YCBCRA 4:2:2:4",
    "YCBCRA 4:4:4:4",
    "RGBA 4:4:4:4",
    "invalid : SMPTE ST 2048-2 FS",
    "invalid : YCBCRD 4:2:2:4",
    "invalid : YCBCRD 4:4:4:4",
    "invalid : RGBD 4:4:4:4",
    "invalid",
    "invalid",
    "invalid",
    "invalid : X'Y'Z' 4:4:4",
    "invalid"
};

static const char* const pix_width_sdi[] = {
    "10-Bit FR",
    "10-Bit",
    "12-Bit",
    "12-Bit FR"
};
/*-----------------------------------------------------------------------------
 * Helper Functions
 *---------------------------------------------------------------------------*/

/**
 * vic_to_index - Map VIC code to lookup table index
 * @param vic_code: Video Information Code
 * @return: Index (0-13) or 255 if unsupported
 */
static uint8_t vic_to_index(uint8_t vic_code,uint8_t color_format,uint8_t pix_width)
{
    if(pix_width == 1 && color_format == 0){
        switch (vic_code) {
            case VIC_4096x2160p60: return 0;
            case VIC_4096x2160p50: return 1;
            case VIC_4096x2160p48: return 2;
            case VIC_4096x2160p30: return 3;
            case VIC_4096x2160p25: return 4;
            case VIC_4096x2160p24: return 5;

            case VIC_3840x2160p60: return 6;
            case VIC_3840x2160p50: return 7;
            case VIC_3840x2160p48: return 8;
            case VIC_3840x2160p30: return 9;
            case VIC_3840x2160p25: return 10;
            case VIC_3840x2160p24: return 11;

            case VIC_2048x1080p60: return 12;
            case VIC_2048x1080p50: return 13;
            case VIC_2048x1080p30: return 14;
            case VIC_2048x1080p25: return 15;

            case VIC_1920x1080p60: return 16;
            case VIC_1920x1080p50: return 17;
            case VIC_1920x1080p30: return 18;
            case VIC_1920x1080p25: return 19;

            case VIC_1280x720p60:  return 20;
            case VIC_1280x720p50:  return 21;
            case VIC_1280x720p30:  return 22;
            case VIC_1280x720p25:  return 23;

            case VIC_1920x1080i60: return 24;
            case VIC_1920x1080i50: return 25;

            case VIC_2048x1080i60: return 26;
            case VIC_2048x1080i50: return 27;

            case VIC_270M_625I:    return 28;
            case VIC_270M_525I:    return 29;


            default:               return 255;
        }
    }
    else
    {
            switch (vic_code) {
            case VIC_4096x2160p60: return 0;
            case VIC_4096x2160p50: return 1;
            case VIC_4096x2160p48: return 2;
            case VIC_4096x2160p30: return 3;
            case VIC_4096x2160p25: return 4;
            case VIC_4096x2160p24: return 5;

            case VIC_3840x2160p60: return 6;
            case VIC_3840x2160p50: return 7;
            case VIC_3840x2160p48: return 8;
            case VIC_3840x2160p30: return 9;
            case VIC_3840x2160p25: return 10;
            case VIC_3840x2160p24: return 11;

            case VIC_2048x1080p30: return 14;
            case VIC_2048x1080p25: return 15;

            case VIC_1920x1080p30: return 18;
            case VIC_1920x1080p25: return 19;

            case VIC_1920x1080i60: return 24;
            case VIC_1920x1080i50: return 25;

            case VIC_2048x1080i60: return 26;
            case VIC_2048x1080i50: return 27;

            case VIC_1280x720p60:  return 20;
            case VIC_1280x720p50:  return 21;
            case VIC_1280x720p30:  return 22;
            case VIC_1280x720p25:  return 23;

            default:               return 255;
        }
    }
}

/*-----------------------------------------------------------------------------
 * Public Functions
 *---------------------------------------------------------------------------*/

void resolution_print(uint8_t vic_code, uint8_t fractional_frame_rate, uint8_t color_format,uint8_t pix_width,uint8_t is_sdi_to_hdmi)
{
    uint8_t idx = vic_to_index(vic_code,color_format,pix_width);

    if (idx == 255) {
        UART_polled_tx_string(&g_uart, path_names[is_sdi_to_hdmi]);
        UART_polled_tx_string(&g_uart, "\r\nSupported Resolution Not detected\r\n");
        return;
    }

    if(is_sdi_to_hdmi == 1)
    {
    /* Assert resets  - SDI_RX */
    axi4litewrite((SDIRX_COREAXI4_LITE_BASE_ADDR + SDI_CTRL_REG_ADDR),0x04);
    }


    if (is_sdi_to_hdmi && idx == 20)
    {
        UART_polled_tx_string(&g_uart, path_names[is_sdi_to_hdmi]);
        UART_polled_tx_string(&g_uart, "\r\nSupported Resolution Not detected : 720p60\r\n");
        return;
    }

    // Special validation cases for SDI path only
    if (is_sdi_to_hdmi) {
        if (idx == 28 && fractional_frame_rate == 1) {
            UART_polled_tx_string(&g_uart, "Not Valid for 625i \r\n");
            return;
        }

        if (idx == 29 && fractional_frame_rate == 0) {
            UART_polled_tx_string(&g_uart, "Not Valid for SD 525i");
            return;
        }
    }

    // Select appropriate tables
    // Note: fractional_frame_rate=1 means use fractional (array index 0), =0 means integer (array index 1)
    uint8_t res_idx = fractional_frame_rate ? 0 : 1;
    const char* rate = is_sdi_to_hdmi ? rates_sdi[idx] : rates_hdmi[idx];
    const char* resolution = is_sdi_to_hdmi ? resolutions_sdi[idx][res_idx]
                                            : resolutions_hdmi[idx][res_idx];
    const char* color_format_print = is_sdi_to_hdmi ? colorformat_sdi[color_format]
                                             : colorformat_sdi[color_format];
    const char* pix_width_print = is_sdi_to_hdmi ? pix_width_sdi[pix_width]
                                                 : pix_width_sdi[pix_width];

    // Print message
    UART_polled_tx_string(&g_uart, path_names[is_sdi_to_hdmi]);

    char sdi_vic_buf[24];
    snprintf(sdi_vic_buf, sizeof(sdi_vic_buf), "\r\nSDI VIC      : %u", (unsigned)vic_code);
    UART_polled_tx_string(&g_uart, (const uint8_t *)sdi_vic_buf);

    if (is_sdi_to_hdmi == 0){
    UART_polled_tx_string(&g_uart, "\r\n");
    UART_polled_tx_string(&g_uart, data_rate_label[is_sdi_to_hdmi]);
    UART_polled_tx_string(&g_uart, rate);
    }
    UART_polled_tx_string(&g_uart, "\r\nResolution   : ");
    UART_polled_tx_string(&g_uart, resolution);
    UART_polled_tx_string(&g_uart, "\r\nColor format : ");
    UART_polled_tx_string(&g_uart, color_format_print);
    UART_polled_tx_string(&g_uart, "\r\nPixel width  : ");
    UART_polled_tx_string(&g_uart, pix_width_print);
    UART_polled_tx_string(&g_uart, "\r\n\r\n");

   // if(vic_code == VIC_270M_625I || vic_code == VIC_270M_525I){
   //    axi4litewrite((SDIRX_COREAXI4_LITE_BASE_ADDR + SDI_CTRL_REG_ADDR),0x04);
   // }
}
