/*-------------------------------------------------------------------------------------------------
--
-- File Name    : hdmiTxXCVRSpeed.h

-- Description  : This module configures the HDMI Tx Speed settings.

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
#include "../../../../application/resolution_print.h"


#define HDMI_TX_XCVR_PMA_LN0_BASE      0x1101000 //XCVR_SERDES_2_PMA_LN0_BASE
#define HDMI_TX_XCVR_PMA_LN1_BASE      0x1102000 //XCVR_SERDES_2_PMA_LN1_BASE
#define HDMI_TX_XCVR_PMA_LN2_BASE      0x1104000 //XCVR_SERDES_2_PMA_LN2_BASE
#define HDMI_TX_XCVR_PMA_LN3_BASE      0x1108000 //XCVR_SERDES_2_PMA_LN3_BASE
#define HDMI_TX_XCVR_PMA_CMN_BASE      0x1110000 //XCVR_SERDES_2_PMA_CMN_BASE

// XVCR Register Offsets
#define SER_CLK_CTRL        0x074
#define SER_RSTPD           0x078

#define TXPLL_DIV_1         0x10
#define TXPLL_JA_1          0x18
#define TXPLL_JA_2          0x1C
#define TXPLL_JA_3          0x20
#define TXPLL_JA_4          0x24
#define TXPLL_JA_5          0x28
#define TXPLL_JA_6          0x2C
#define TXPLL_JA_7          0x30
#define TXPLL_JA_8          0x34
#define TXPLL_JA_9          0x38
#define TXPLL_JA_10         0x3C
#define TXPLL_JA_RST        0x40

void update_hdmi_tx_xcvr_speed(uint8_t vic,uint8_t hdmi_tx_rate,uint8_t color_format, uint8_t pix_width);
void hdmi_tx_pll_config(uint8_t hdmi_tx_rate,uint8_t extend_color_format_depth);
