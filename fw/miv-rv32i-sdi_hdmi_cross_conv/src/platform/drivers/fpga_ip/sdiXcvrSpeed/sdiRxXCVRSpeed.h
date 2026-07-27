/*-------------------------------------------------------------------------------------------------
--
-- File Name    : sdiRxXCVRSpeed.h

-- Description  : This module configures the SDI Rx Speed settings.

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

#define SDI_RX_CCC_BASE               0x08020000 //CCC PLL_SE_1
#define SDI_RX_XCVR_PMA_LN0_BASE      0x01081000 //XCVR_SERDES_1_PMA_LN0_BASE
#define SDI_RX_XCVR_PCS_LN0_BASE      0x00081000 //XCVR_SERDES_1_PCS_LN0_BASE


#define SDI_RX_XCVR_GPSSMAIN      0x02090000 //XCVR_SERDES_1_GPSSMAIN

//CCC Register offsets
#define PLL_FRACN           0x0C
#define PLL_DIV_0_1         0x10
#define SSCG_REG_0          0x24
#define SSCG_REG_2          0x2C

// XVCR Register Offsets
#define DES_RSTPD           0x04C
#define DES_CDR_CTRL_1      0x004
#define DES_CDR_CTRL_2      0x008
#define DES_CDR_CTRL_3      0x00C
#define DES_DFEEM_CTRL_1    0x010
#define DES_DFEEM_CTRL_2    0x014
#define DES_DFEEM_CTRL_3    0x018
#define DES_DFE_CTRL_1      0x020
#define DES_DFE_CTRL_2      0x024
#define DES_EM_CTRL_1       0x028
#define DES_EM_CTRL_2       0x02C

#define DES_IN_TERM         0x030
#define DES_PKDET           0x034
#define DES_RTL_EM          0x038

#define DES_RXPLL_DIV       0x040
#define DES_CLK_CTRL        0x048
#define SERDES_RTL_CTRL     0x0C0
#define DES_DFE_CAL_FLAG    0x100

#define DES_DFE_CAL_CTRL_0  0x0D0
#define DES_DFE_CAL_CTRL_1  0x0D4
#define DES_DFE_CAL_CTRL_2  0x0D8
#define DES_DFE_CAL_CMD     0x0DC
#define DES_DFE_CAL_BYPASS  0x0E0

#define DES_RTL_ERR_CHK     0x050



#define DES_RTL_LOCK_CTRL   0x03C
#define SPARE               0x190
#define PMA_CTRL_R0         0x088
#define LRST_R0             0x68

void sdi_rx_default_settings();
uint8_t update_sdi_rx_xcvr_speed(uint8_t sdi_speed_rate);
uint8_t sdi_rx_xcvr_calibrate(uint8_t sdi_speed_rate);
