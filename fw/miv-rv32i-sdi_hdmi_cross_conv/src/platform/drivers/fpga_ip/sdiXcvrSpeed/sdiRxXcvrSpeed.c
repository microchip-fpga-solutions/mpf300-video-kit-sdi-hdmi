/*-------------------------------------------------------------------------------------------------
--
-- File Name    : sdiRxXcvrSpeed.c

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
#include "fpga_design_config.h"
#include "sdiRxXcvrSpeed.h"
#include "sdiTxXcvrSpeed.h"
#include "../CoreGPIO/core_gpio.h"

void sdi_rx_default_settings()
{
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RSTPD)        = 0x2F;         //DES_RSTPD - Reset


    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_GPSSMAIN + SPARE)                = 0x00000000;   // SPARE
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + LRST_R0)          = 0x00000404;   // LRST_R0
   // *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + PMA_CTRL_R0)      = 0x03030347;   // PMA_CTRL_R0
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + PMA_CTRL_R0)      = 0x03130347;   // PMA_CTRL_R0


    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_1)   = 0x01151322;   // DES_CDR_CTRL_1
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_2)   = 0x00000F2A;   // DES_CDR_CTRL_2
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_3)   = 0x000C024F;   // DES_CDR_CTRL_3

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_1) = 0x0000002A;   // DES_DFEEM_CTRL_1
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_2) = 0x00000000;   // DES_DFEEM_CTRL_2
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_3) = 0x00004F00;   // DES_DFEEM_CTRL_3

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CTRL_1)   = 0x00000000;   // DES_DFE_CTRL_2
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CTRL_2)   = 0x0C000006;   // DES_DFE_CTRL_2

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_EM_CTRL_1)    = 0x00000000;   // DES_EM_CTRL_1
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_EM_CTRL_2)    = 0x00000006;   // DES_EM_CTRL_2

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_IN_TERM)      = 0x000000B7;   // DES_IN_TERM
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_PKDET)        = 0x00007F41;   // DES_PKDET
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RTL_EM)       = 0x000023E8;   // DES_RTL_EM
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RTL_LOCK_CTRL)= 0x00E1000C;   // DES_RTL_LOCK_CTRL


    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RXPLL_DIV)    = 0x0000C428;   // DES_RXPLL_DIV ****
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CLK_CTRL)     = 0x0000003C;   // DES_CLK_CTRL

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RTL_ERR_CHK)  = 0x00000012;   // DES_RTL_ERR_CHK

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_CTRL_0)  = 0xFF3F0715;   // DES_DFE_CAL_CTRL_0
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_CTRL_1)  = 0x0101491d;   // DES_DFE_CAL_CTRL_1
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_CTRL_2)  = 0x00400010;   // DES_DFE_CAL_CTRL_1
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_CMD)     = 0x00000000;   // DES_DFE_CAL_CMD


    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + SERDES_RTL_CTRL)      = 0x00000000;   // SERDES_RTL_CTRL
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_BYPASS)   = 0x00000000;   // DES_DFE_CAL_BYPASS


    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RSTPD)        = 0x3C;         //DES_RSTPD - Reset release


}
extern gpio_instance_t g_gpio_out;

uint8_t update_sdi_rx_xcvr_speed(uint8_t sdi_speed_rate)
{
    uint8_t calib_status = 0;

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RSTPD) = 0x2F; //DES_RSTPD - Reset

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_BYPASS)   = 0x00000000;   // DES_DFE_CAL_BYPASS



    if (sdi_speed_rate == 2) // 12G
    {
    //ccc
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_FRACN)   = 0x00000000; // PLL_FRACN
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_DIV_0_1) = 0x01000800; // PLL_DIV_0_1
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_0)  = 0x00000001; // SSCG_REG_0
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_2)  = 0x00000020; // SSCG_REG_2

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RXPLL_DIV)   = 0x00008250; // DES_RXPLL_DIV

    }
    else if(sdi_speed_rate == 3) //6G
    {
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_FRACN)   = 0x00000000; // PLL_FRACN
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_DIV_0_1) = 0x01001000; // PLL_DIV_0_1
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_0)  = 0x00000001; // SSCG_REG_0
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_2)  = 0x00000020; // SSCG_REG_2

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RXPLL_DIV)    = 0x00000228; // DES_RXPLL_DIV
    }
    else if(sdi_speed_rate == 4) //3G
    {
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_FRACN)   = 0x00000000; // PLL_FRACN
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_DIV_0_1) = 0x01002100; // PLL_DIV_0_1
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_0)  = 0x00000001; // SSCG_REG_0
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_2)  = 0x00000021; // SSCG_REG_2

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RXPLL_DIV)    = 0x0000C214; // DES_RXPLL_DIV

    }
    else if(sdi_speed_rate == 5) //1.5G
    {
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_FRACN)   = 0x00000003; // PLL_FRACN
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_DIV_0_1) = 0x01004300; // PLL_DIV_0_1
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_0)  = 0x1FF16B01; // SSCG_REG_0
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_2)  = 0x00000021; // SSCG_REG_2

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RXPLL_DIV)    = 0x0000E414; // DES_RXPLL_DIV
    }
    else if(sdi_speed_rate == 6) //SD 270 Mbps -- 2700 mbps  xcvr speed over sampling by 10
    {

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_BYPASS)   = 0x00200000;   // DES_DFE_CAL_BYPASS


    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_FRACN)   = 0x00000000; // PLL_FRACN
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_DIV_0_1) = 0x01002500; // PLL_DIV_0_1
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_0)  = 0x00000001; // SSCG_REG_0
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_2)  = 0x00000025; // SSCG_REG_2

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RXPLL_DIV)    = 0x00002214; // DES_RXPLL_DIV

    }

    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RSTPD) = 0x3C; //DES_RSTPD - Reset Release

    if (sdi_speed_rate == 2)
    {
        delay(2);
        calib_status = sdi_rx_xcvr_calibrate(sdi_speed_rate);
    }
    return calib_status;
}

/*
uint8_t update_sdi_rx_xcvr_speed(uint8_t sdi_speed_rate)
{
    uint8_t calib_status = 0;
    *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RSTPD) = 0x2F; //DES_RSTPD - Reset

    if (sdi_speed_rate == 2) // 12G
    {
        //ccc
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_FRACN)   = 0x00000000; // PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_DIV_0_1) = 0x01000800; // PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_0)  = 0x00000001; // SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_2)  = 0x00000020; // SSCG_REG_2

        //xcvr
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_GPSSMAIN + SPARE) = 0x00000000; // SPARE
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + PMA_CTRL_R0) = 0x03030347; // PMA_CTRL_R0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + LRST_R0) = 0x00000405; // LRST_R0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_2) = 0x0000003F;
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_3) = 0x0000037F;
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RXPLL_DIV)   = 0x00008250; // DES_RXPLL_DIV
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CLK_CTRL)    = 0x0000003C; // DES_CLK_CTRL
        // *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CLK_CTRL)    = 0x00000039; // DES_CLK_CTRL
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RTL_LOCK_CTRL)    = 0x0000000C; // DES_RTL_LOCK_CTRL
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + SERDES_RTL_CTRL)      = 0x00010000; // SERDES_RTL_CTRL
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_BYPASS)    = 0x00000000; // DES_DFE_CAL_BYPASS
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_CTRL_1)    = 0x0105431C; // DES_DFE_CAL_CTRL_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_CTRL_0)    = 0xFF3F071D; // DES_DFE_CAL_CTRL_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_CTRL_2)    = 0x00400000; // DES_DFE_CAL_CTRL_2



        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RSTPD) = 0x30; //DES_RSTPD - Reset Release
    }
    else if(sdi_speed_rate == 3) //6G
    {

        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_FRACN)   = 0x00000000; // PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_DIV_0_1) = 0x01001000; // PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_0)  = 0x00000001; // SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_2)  = 0x00000020; // SSCG_REG_2

        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_GPSSMAIN + SPARE) = 0x00000000; // SPARE
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + LRST_R0) = 0x00000404; // LRST_R0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + PMA_CTRL_R0) = 0x03030347; // PMA_CTRL_R0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_2)   = 0x0000002A; // DES_CDR_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_3)   = 0x0000024F; // DES_CDR_CTRL_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_1) = 0x0000002A; // DES_DFEEM_CTRL_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_2) = 0x00000000; // DES_DFEEM_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_3) = 0x00004F00; // DES_DFEEM_CTRL_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CTRL_2)   = 0x00000002; // DES_DFE_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_EM_CTRL_2)    = 0x00000002; // DES_EM_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RXPLL_DIV)    = 0x00000228; // DES_RXPLL_DIV
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CLK_CTRL)     = 0x0000003C; // DES_CLK_CTRL
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RTL_LOCK_CTRL)    = 0x00000008; // DES_RTL_LOCK_CTRL
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + SERDES_RTL_CTRL)  = 0x00000000; // SERDES_RTL_CTRL

        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RSTPD) = 0x3C; //DES_RSTPD - Reset Release
    }
    else if(sdi_speed_rate == 4) //3G
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_FRACN)   = 0x00000000; // PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_DIV_0_1) = 0x01002100; // PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_0)  = 0x00000001; // SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_2)  = 0x00000021; // SSCG_REG_2

        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_GPSSMAIN + SPARE) = 0x00000000; // SPARE
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + LRST_R0) = 0x00000404; // LRST_R0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + PMA_CTRL_R0) = 0x03030347; // PMA_CTRL_R0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_2)   = 0x00000015; // DES_CDR_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_3)   = 0x0000014F; // DES_CDR_CTRL_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_1) = 0x00000015; // DES_DFEEM_CTRL_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_2) = 0x00000000; // DES_DFEEM_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_3) = 0x00000000; // DES_DFEEM_CTRL_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CTRL_2)   = 0x00000001; // DES_DFE_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_EM_CTRL_2)    = 0x00000001; // DES_EM_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RXPLL_DIV)    = 0x0000C214; // DES_RXPLL_DIV
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CLK_CTRL)     = 0x0000003C; // DES_CLK_CTRL
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RTL_LOCK_CTRL)    = 0x00000008; // DES_RTL_LOCK_CTRL
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + SERDES_RTL_CTRL)  = 0x00000000; // SERDES_RTL_CTRL

        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RSTPD) = 0x3C; //DES_RSTPD - Reset Release
    }
    else if(sdi_speed_rate == 5) //1.5G
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_FRACN)   = 0x00000003; // PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_DIV_0_1) = 0x01004300; // PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_0)  = 0x1FF16B01; // SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_2)  = 0x00000021; // SSCG_REG_2

        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_GPSSMAIN + SPARE) = 0x00000000; // SPARE
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + LRST_R0) = 0x00000404; // LRST_R0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + PMA_CTRL_R0) = 0x03030347; // PMA_CTRL_R0

        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_2)   = 0x00000015; // DES_CDR_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_3)   = 0x0000014F; // DES_CDR_CTRL_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_1) = 0x00000015; // DES_DFEEM_CTRL_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_2) = 0x00000000; // DES_DFEEM_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_3) = 0x00000000; // DES_DFEEM_CTRL_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CTRL_2)   = 0x00000001; // DES_DFE_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_EM_CTRL_2)    = 0x00000001; // DES_EM_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RXPLL_DIV)    = 0x0000E414; // DES_RXPLL_DIV
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CLK_CTRL)     = 0x0000003C; // DES_CLK_CTRL
        //*(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RTL_LOCK_CTRL)    = 0x00000008; // DES_RTL_LOCK_CTRL
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RTL_LOCK_CTRL)    = 0x00E10008; // DES_RTL_LOCK_CTRL
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + SERDES_RTL_CTRL)  = 0x00000000; // SERDES_RTL_CTRL

        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RSTPD) = 0x3C; //DES_RSTPD - Reset Release

    }

    else if(sdi_speed_rate == 6) //SD 270 Mbps -- 2700 mbps  xcvr speed over sampling by 10
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_FRACN)   = 0x00000000; // PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + PLL_DIV_0_1) = 0x01002500; // PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_0)  = 0x00000001; // SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_CCC_BASE + SSCG_REG_2)  = 0x00000025; // SSCG_REG_2

        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_GPSSMAIN + SPARE) = 0x00100000; // SPARE
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + LRST_R0) = 0x00000404; // LRST_R0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PCS_LN0_BASE + PMA_CTRL_R0) = 0x03130347; // PMA_CTRL_R0

        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_2)   = 0x00000015; // DES_CDR_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CDR_CTRL_3)   = 0x0000014F; // DES_CDR_CTRL_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_1) = 0x00000015; // DES_DFEEM_CTRL_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_2) = 0x00000000; // DES_DFEEM_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFEEM_CTRL_3) = 0x00004F00; // DES_DFEEM_CTRL_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CTRL_2)   = 0x00000001; // DES_DFE_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_EM_CTRL_2)    = 0x00000001; // DES_EM_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RXPLL_DIV)    = 0x00002214; // DES_RXPLL_DIV
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_CLK_CTRL)     = 0x0000003C; // DES_CLK_CTRL

        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RTL_LOCK_CTRL)     = 0x0000000C; // DES_RTL_LOCK_CTRL
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_BYPASS)    = 0x00213201; // DES_DFE_CAL_BYPASS
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_CTRL_1)    = 0x0101491D; // DES_DFE_CAL_CTRL_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_CTRL_0)    = 0xFF3F0716; // DES_DFE_CAL_CTRL_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_CTRL_2)    = 0x00400010; // DES_DFE_CAL_CTRL_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + SERDES_RTL_CTRL)       = 0x00000000; // SERDES_RTL_CTRL


        *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_RSTPD) = 0x3C; //DES_RSTPD - Reset Release

    }


    if (sdi_speed_rate == 2)
    {
        delay(2);
        calib_status = sdi_rx_xcvr_calibrate(sdi_speed_rate);
    }
    return calib_status;

}

*/

/**
 * sdi_rx_xcvr_calibrate - Perform XCVR calibration for SDI RX
 * @param sdi_speed_rate: Speed index (2=12G, 6=270M)
 * @return: Calibration status (non-zero if successful)
 */
uint8_t sdi_rx_xcvr_calibrate(uint8_t sdi_speed_rate)
{
    uint8_t loop_count = 0;
    uint32_t calib_flag;
    uint32_t expected_mask = (sdi_speed_rate == 2) ? 0x40000 : 0x100000;

    /* Pulse calibration request */
    GPIO_set_output(&g_gpio_out, GPIO_5, 1);
    delay(1);
    GPIO_set_output(&g_gpio_out, GPIO_5, 0);

    /* Wait for calibration complete */
    do {
        delay(2);
        calib_flag = *(volatile unsigned int *)(DRI_BASE_ADDR + SDI_RX_XCVR_PMA_LN0_BASE + DES_DFE_CAL_FLAG);

        if ((calib_flag & expected_mask) != 0) {
            return 1;  /* Calibration successful */
        }

        loop_count++;
    } while (loop_count < 20);

    return 0;  /* Timeout */
}
