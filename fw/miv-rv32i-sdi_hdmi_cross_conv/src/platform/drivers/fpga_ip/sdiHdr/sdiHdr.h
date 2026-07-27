/*-------------------------------------------------------------------------------------------------
-- File Name    : sdiHdr.h
-- Description  : HDR Metadata driver for SDI TX via AXI4-Lite
-- Author       : India Solutions Team
-- COPYRIGHT 2024 BY MICROCHIP
-------------------------------------------------------------------------------------------------*/

#ifndef SDIHDR_H_
#define SDIHDR_H_

#include <stdint.h>
#include "../../CoreAXI4-Lite/AXI4-Lite.h"
#include "fpga_design_config/fpga_design_config.h"

/* HDR Metadata Register Addresses (SMPTE ST.2086 / CTA-861.3) */
#define SDI_HDR_REG0_ADDR               0x10    /* EOTF Type Selection [1:0] */
#define SDI_HDR_REG1_ADDR               0x14    /* Red Primaries: X[15:0], Y[31:16] */
#define SDI_HDR_REG2_ADDR               0x18    /* Green Primaries: X[15:0], Y[31:16] */
#define SDI_HDR_REG3_ADDR               0x1C    /* Blue Primaries: X[15:0], Y[31:16] */
#define SDI_HDR_REG4_ADDR               0x20    /* White Point: X[15:0], Y[31:16] */
#define SDI_HDR_REG5_ADDR               0x24    /* Max Luminance [32-bit] */
#define SDI_HDR_REG6_ADDR               0x28    /* Min Luminance [32-bit] */
#define SDI_HDR_REG7_ADDR               0x2C    /* MaxCLL[15:0], MaxFALL[31:16] */

/*-----------------------------------------------------------------------------
 * SMPTE ST.2086 Mastering Display Color Volume Structure
 * Values are raw 16-bit or 32-bit register values
 *---------------------------------------------------------------------------*/
typedef struct {
    /* EOTF Type (HDR_REG0) */
    uint8_t eotf;

    /* Display Primaries (CIE 1931 x,y coordinates) */
    uint16_t red_primary_x;
    uint16_t red_primary_y;
    uint16_t green_primary_x;
    uint16_t green_primary_y;
    uint16_t blue_primary_x;
    uint16_t blue_primary_y;

    /* White Point (CIE 1931 x,y coordinates) */
    uint16_t white_point_x;
    uint16_t white_point_y;

    /* Luminance */
    uint32_t max_luminance;
    uint32_t min_luminance;

    /* CTA-861.3 Content Light Level */
    uint16_t max_cll;
    uint16_t max_fall;
} sdi_hdr_metadata_t;

/*-----------------------------------------------------------------------------
 * Function Prototypes
 *---------------------------------------------------------------------------*/

void drm_hdmirx_to_sditx();
static inline uint32_t swap_byte_pairs(uint32_t value);

#endif /* SDIHDR_H_ */
