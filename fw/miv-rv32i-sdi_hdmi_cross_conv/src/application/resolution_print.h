/*-------------------------------------------------------------------------------------------------
-- File Name    : resolution_print.h
-- Description  : Resolution printing utilities for SDI/HDMI converter
-- Author       : India Solutions Team
-- COPYRIGHT 2024 BY MICROCHIP
-------------------------------------------------------------------------------------------------*/

#ifndef RESOLUTION_PRINT_H_
#define RESOLUTION_PRINT_H_

#include "../platform/hal/hal.h"
#include "../platform/miv_rv32_hal/miv_rv32_hal.h"
#include "../platform/drivers/fpga_ip/CoreGPIO/core_gpio.h"
#include "../platform/drivers/fpga_ip/sdiXcvrSpeed/sdiTxXcvrSpeed.h"
/*-----------------------------------------------------------------------------
 * Video Information Code (VIC) Definitions
 * Standard CEA-861 VIC codes for supported video formats
 *---------------------------------------------------------------------------*/
#define VIC_4096x2160p60    102    /* 4K UHD - DCI @ 60Hz */
#define VIC_4096x2160p50    101    /* 4K UHD - DCI  @ 50Hz */
#define VIC_4096x2160p48    115    /* 4K UHD - DCI @ 50Hz */
#define VIC_4096x2160p30    100    /* 4K UHD - DCI @ 30Hz */
#define VIC_4096x2160p25    99     /* 4K UHD - DCI @ 25Hz */
#define VIC_4096x2160p24    98     /* 4K UHD - DCI @ 24Hz */

#define VIC_3840x2160p60    97    /* 4K UHD @ 60Hz */
#define VIC_3840x2160p50    96    /* 4K UHD @ 50Hz */
#define VIC_3840x2160p48    114   /* 4K UHD @ 50Hz */
#define VIC_3840x2160p30    95    /* 4K UHD @ 30Hz */
#define VIC_3840x2160p25    94    /* 4K UHD @ 25Hz */
#define VIC_3840x2160p24    93    /* 4K UHD @ 24Hz */
#define VIC_1920x1080p60    16    /* Full HD @ 60Hz progressive */
#define VIC_1920x1080p50    31    /* Full HD @ 50Hz progressive */
#define VIC_1920x1080p30    34    /* Full HD @ 30Hz progressive */
#define VIC_1920x1080p25    33    /* Full HD @ 25Hz progressive */
#define VIC_1920x1080i60    5     /* Full HD @ 60Hz interlaced */
#define VIC_1920x1080i50    20    /* Full HD @ 50Hz interlaced */
#define VIC_1280x720p60     4     /* HD @ 60Hz */
#define VIC_1280x720p50     19    /* HD @ 50Hz */
#define VIC_1280x720p30     62    /* HD @ 30Hz */
#define VIC_1280x720p25     61    /* HD @ 25Hz */
#define VIC_270M_625I       25    /* SD 625i (PAL) @ 270Mbps */
#define VIC_270M_525I       10    /* SD 525i (NTSC) @ 270Mbps */

// Custom VIC codes for internal
#define VIC_2048x1080p60    128  /* Full HD -DCI @ 60Hz progressive */
#define VIC_2048x1080p50    129  /* Full HD -DCI @ 50Hz progressive */
#define VIC_2048x1080p48    130  /* Full HD -DCI @ 48Hz progressive */
#define VIC_2048x1080p30    131  /* Full HD -DCI @ 30Hz progressive */
#define VIC_2048x1080p25    132  /* Full HD -DCI @ 25Hz progressive */

#define VIC_2048x1080i60    134     /* Full HD - DCI @ 60Hz interlaced */
#define VIC_2048x1080i50    135     /* Full HD - DIC @ 50Hz interlaced */

/*-----------------------------------------------------------------------------
 * Public Function Prototypes
 *---------------------------------------------------------------------------*/

/**
 * resolution_print - Print resolution and data rate to UART
 * @param vic_code: Video Information Code
 * @param fractional_frame_rate: 1 for fractional (29.97/59.94), 0 for integer
 * @param is_sdi_to_hdmi: 1 for SDI->HDMI path, 0 for HDMI->SDI path
 */
void resolution_print(uint8_t vic_code, uint8_t fractional_frame_rate, uint8_t color_format,uint8_t pix_width,uint8_t is_sdi_to_hdmi);

#endif /* RESOLUTION_PRINT_H_ */
