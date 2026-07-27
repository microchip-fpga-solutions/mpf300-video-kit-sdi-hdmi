/*-------------------------------------------------------------------------------------------------
--
-- File Name    : sdiTxXcvrSpeed.h

-- Description  : This module replicates the SDI XCVR Device Speed settings.

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

#ifndef SDIXCVRSPEED_H_
#define SDIXCVRSPEED_H_

#include <stdint.h>

#define SDI_TX_XCVR_PMA_LN0_BASE      0x01081000 //XCVR_SERDES_1_PMA_LN0_BASE
#define SDI_TX_XCVR_PMA_CMN_BASE      0x01090000 //XCVR_SERDES_1_PMA_CMN_BASE

// XVCR Register Offsets
#define SER_CLK_CTRL        0x074
#define SER_RSTPD           0x078

#define TXPLL_DIV_1         0x10
#define TXPLL_DIV_2         0x14
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

void delay(uint32_t tms);
void sdi_tx_xcvr_config(uint32_t g_video_code);
void update_sdi_tx_xcvr_speed(uint32_t g_video_code);

/* Setters for the SDI TX format triple (file-local in sdiTxXcvrSpeed.c).
 * color_format / color_depth are driven from HDMI RX AVI/GCP by main.c.
 * pic_format is set manually in sdiTxXcvrSpeed.c (0=interlaced, 1=progressive). */
void sdi_tx_set_color_format(uint8_t cf);
void sdi_tx_set_color_depth (uint8_t cd);

#endif /* SDIXCVRSPEED_H_ */

