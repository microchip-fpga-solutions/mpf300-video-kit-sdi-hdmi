/*-------------------------------------------------------------------------------------------------
--
-- File Name    : hdmiRxXCVRSpeed.h

-- Description  : This module configures the HDMI Rx Speed settings.

-- Targeted device : Microchip FPGAs
-- Author          : India Solutions Team

--
-- COPYRIGHT 2025 BY MICROCHIP
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS
-- FROM MICROCHIP CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM
-- MICROCHIP FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND
-- NO BACK-UP OF THE FILE SHOULD BE MADE.
--
-------------------------------------------------------------------------------------------------*/
#include <stdint.h>

#define HDMI_RX_XCVR_PMA_LN0_BASE      0x1101000 //XCVR_SERDES_2_PMA_LN0_BASE
#define HDMI_RX_XCVR_PMA_LN1_BASE      0x1102000 //XCVR_SERDES_2_PMA_LN1_BASE
#define HDMI_RX_XCVR_PMA_LN2_BASE      0x1104000 //XCVR_SERDES_2_PMA_LN2_BASE
#define HDMI_RX_XCVR_PMA_LN3_BASE      0x1108000 //XCVR_SERDES_2_PMA_LN3_BASE
#define HDMI_RX_XCVR_PMA_CMN_BASE      0x1110000 //XCVR_SERDES_2_PMA_CMN_BASE

// XVCR Register Offsets
#define DES_RSTPD           0x04C
#define DES_CDR_CTRL_2      0x008
#define DES_CDR_CTRL_3      0x00C
#define DES_DFEEM_CTRL_1    0x010
#define DES_DFE_CTRL_2      0x024
#define DES_EM_CTRL_2       0x02C
#define DES_RXPLL_DIV       0x040
#define SER_CLK_CTRL        0x074
#define DES_DFE_CAL_CTRL_1  0x0D4

//PLL_NE_1
#define PLL_NE_1_BASE      0x8080000

#define HDMI_RX_HDR_REG1                    0x72000038
#define HDMI_RX_HDR_REG2                    0x7200003C
#define HDMI_RX_HDR_REG3                    0x72000040
#define HDMI_RX_HDR_REG4                    0x72000044
#define HDMI_RX_HDR_REG5                    0x72000048
#define HDMI_RX_HDR_REG6                    0x7200004C
#define HDMI_RX_HDR_REG7                    0x72000050

#define HDMI_RX_AVI_REG1                    0x72000024
#define HDMI_RX_AVI_REG2                    0x72000028
#define HDMI_RX_AVI_REG3                    0x7200002C
#define HDMI_RX_AVI_REG4                    0x72000030
#define HDMI_RX_GCP_REG1                    0x72000034

/*******************************************************************************
 * Color Space Definitions
 ******************************************************************************/
#define HDMI_COLOR_SPACE_RGB        0
#define HDMI_COLOR_SPACE_YUV422     1
#define HDMI_COLOR_SPACE_YUV444     2
#define HDMI_COLOR_SPACE_YUV420     3

/*******************************************************************************
 * Color Depth Definitions (from GCP ColorDepth field)
 ******************************************************************************/
#define HDMI_COLOR_DEPTH_8BIT       0
#define HDMI_COLOR_DEPTH_10BIT      5
#define HDMI_COLOR_DEPTH_12BIT      6
#define HDMI_COLOR_DEPTH_16BIT      7

void hdmi_rx_xcvr_speed(uint32_t lane_addr, uint32_t hdmi_rx_rate);
void update_hdmi_rx_xcvr_speed(uint32_t hdmi_rx_rate);
void update_hdmi_rx_sys_clk_ccc(uint8_t color_depth) ;
//double hdmi_rx_rate_detect();
uint32_t hdmi_rx_rate_detect();
uint8_t bridge_drm_rx_to_tx(void);
void hdmirx_drm_read_payload(uint32_t payload_drm[7]);

uint8_t hdmi_rx_extract_color_space(void);
uint8_t hdmi_rx_extract_color_depth(void);
uint8_t hdmi_rx_extract_vic(void);

void    hdmi_rx_print_status(uint32_t rate_mbps);
