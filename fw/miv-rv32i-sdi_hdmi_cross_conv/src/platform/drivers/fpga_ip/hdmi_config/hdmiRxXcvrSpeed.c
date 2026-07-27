/*-------------------------------------------------------------------------------------------------
--
-- File Name    : hdmiRxXCVRSpeed.c

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
#include <stdio.h>
#include "fpga_design_config.h"
#include "hdmiRxXCVRSpeed.h"
#include "../../CoreAXI4-Lite/AXI4-Lite.h"
#include <drivers/fpga_ip/sdiXcvrSpeed/sdiTxXcvrSpeed.h>
#include "../sdiHdr/sdiHdr.h"
#include "../CoreUARTapb/core_uart_apb.h"

extern UART_instance_t g_uart;
uint32_t hdmi_rx_rate_detect()
{
    uint32_t data_rate=0;
    uint32_t data_rate_r=0;

    uint32_t scram_status=0;
    uint32_t final_data_rate;
    uint32_t final_rate_print;

    data_rate = (uint32_t)axi4literead((HDMI_COREAXI4_LITE_BASE_ADDR + HDMI_DATARATE_ADDR));//data rate read from the hardware double data_rate_r;
        //double data_rate_r = (double)data_rate / 10000.0; // keeps decimals with this create a function
    data_rate_r = data_rate;
        if(data_rate_r <=10000 )// False data rate on power cycle changed 0 to 1000
        {
           return 0;
        }
        scram_status    = (uint32_t)axi4literead((HDMI_COREAXI4_LITE_BASE_ADDR + SCRAM_STATUS));//data rate read from the hardware


        if (scram_status == 1U)
        {
            //final_data_rate = data_rate_r * 40.0;
            final_data_rate = data_rate_r / 250;
           // final_rate_print = (uint32_t)(data_rate_r * 40);

//            char msg_buf[64];
//            snprintf(msg_buf, sizeof(msg_buf),
//                     "HDMI Rx Datarate: %u, Scrambler Enabled by source\r\n",
//                     final_rate_print);
//            UART_polled_tx_string(&g_uart, (const uint8_t *)msg_buf);
        }
        else
        {
            //final_data_rate = data_rate_r * 10.0;
            final_data_rate = data_rate_r / 1000;
            //final_rate_print = (uint32_t)(data_rate_r * 10);

//            char msg_buf[64];
//            snprintf(msg_buf, sizeof(msg_buf),
//                     "HDMI Rx Datarate: %u, Scrambler Disabled by source\r\n",
//                     final_rate_print);
//            UART_polled_tx_string(&g_uart, (const uint8_t *)msg_buf);
        }
        return final_data_rate;
}
void update_hdmi_rx_xcvr_speed(uint32_t hdmi_rx_rate)
{

    *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_RX_XCVR_PMA_LN0_BASE + DES_RSTPD)=0x33;//DES_RSTPD
    *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_RX_XCVR_PMA_LN1_BASE + DES_RSTPD)=0x33;//DES_RSTPD
    *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_RX_XCVR_PMA_LN2_BASE + DES_RSTPD)=0x33;//DES_RSTPD
    *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_RX_XCVR_PMA_LN3_BASE + DES_RSTPD)=0x33;//DES_RSTPD

    hdmi_rx_xcvr_speed(HDMI_RX_XCVR_PMA_LN0_BASE, hdmi_rx_rate);
    hdmi_rx_xcvr_speed(HDMI_RX_XCVR_PMA_LN1_BASE, hdmi_rx_rate);
    hdmi_rx_xcvr_speed(HDMI_RX_XCVR_PMA_LN2_BASE, hdmi_rx_rate);

    *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_RX_XCVR_PMA_LN0_BASE + DES_RSTPD)=0x30;//DES_RSTPD
    *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_RX_XCVR_PMA_LN1_BASE + DES_RSTPD)=0x30;//DES_RSTPD
    *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_RX_XCVR_PMA_LN2_BASE + DES_RSTPD)=0x30;//DES_RSTPD
    *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_RX_XCVR_PMA_LN3_BASE + DES_RSTPD)=0x30;//DES_RSTPD

    axi4litewrite((HDMI_COREAXI4_LITE_BASE_ADDR+HDMI_RESET_ADDR),0x01);

}

void hdmi_rx_xcvr_speed(uint32_t lane_addr, uint32_t hdmi_rx_rate)
{
    uint32_t buffer = 20.0; // changed double to uint32_t
   if (hdmi_rx_rate >= (5940 - buffer) && hdmi_rx_rate <= (5940 + buffer)) //4k60
        {

        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x08 ) = 0x00000100;//PLL_REF_FB
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x0C ) = 0x00000000;//PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x10 ) = 0x01000800;//PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x24 ) = 0x00000001;//SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x2C ) = 0x00000020;//SSCG_REG_2

       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_2 )     = 0x2a;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_3 )     = 0x4024f;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFEEM_CTRL_1 )   = 0x2a;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CTRL_2 )     = 0x4000002;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_EM_CTRL_2 )      = 0x02;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_RXPLL_DIV )      = 0x228;
       //*(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + SER_CLK_CTRL  )      = 0x70;  // COMMENTED: TX-owned register; belongs to HDMI TX driver
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CAL_CTRL_1 ) = 0x101491D;
        }
    else if (hdmi_rx_rate >= (4455 - buffer) && hdmi_rx_rate <= (4455 + buffer)) //4k30,12Bit
        {

        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x08 ) = 0x00000100;//PLL_REF_FB
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x0C ) = 0x00000000;//PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x10 ) = 0x01000800;//PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x24 ) = 0x00000001;//SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x2C ) = 0x00000020;//SSCG_REG_2


       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_2 )     = 0x15;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_3 )     = 0x4014f;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFEEM_CTRL_1 )   = 0x15;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CTRL_2 )     = 0x4000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_EM_CTRL_2 )      = 0x01;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_RXPLL_DIV )      = 0x021e;
       //*(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + SER_CLK_CTRL  )      = 0x70;  // COMMENTED: TX-owned register; belongs to HDMI TX driver
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CAL_CTRL_1 ) = 0x101491D;
        }
    else if (hdmi_rx_rate >= (3712 - buffer) && hdmi_rx_rate <= (3712 + buffer))
            {

            *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x08 ) = 0x00000100;//PLL_REF_FB
            *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x0C ) = 0x00000000;//PLL_FRACN
            *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x10 ) = 0x01000800;//PLL_DIV_0_1
            *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x24 ) = 0x00000001;//SSCG_REG_0
            *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x2C ) = 0x00000020;//SSCG_REG_2

           *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_2 )     = 0x00000015;
           *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_3 )     = 0x0004014F;
           *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFEEM_CTRL_1 )   = 0x00000015;
           *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CTRL_2 )     = 0x04000001;
           *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_EM_CTRL_2 )      = 0x00000001;
           *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_RXPLL_DIV )      = 0x00000219;
           //*(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + SER_CLK_CTRL  )      = 0x00000070;  // COMMENTED: TX-owned register; belongs to HDMI TX driver
           *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CAL_CTRL_1 ) = 0x0101491D;
            }
    else if(hdmi_rx_rate >= (2970 - buffer) && hdmi_rx_rate <= (2970 + buffer))//4k30
        {

        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x08 ) = 0x00000100;//PLL_REF_FB
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x0C ) = 0x00000000;//PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x10 ) = 0x01000800;//PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x24 ) = 0x00000001;//SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x2C ) = 0x00000020;//SSCG_REG_2


       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_2 )     = 0x15;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_3 )     = 0x4014f;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFEEM_CTRL_1 )   = 0x15;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CTRL_2 )     = 0x4000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_EM_CTRL_2 )      = 0x01;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_RXPLL_DIV )      = 0x2214;
       //*(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + SER_CLK_CTRL  )      = 0x71;  // COMMENTED: TX-owned register; belongs to HDMI TX driver
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CAL_CTRL_1 ) = 0x101491D;
       }
    else if(hdmi_rx_rate >= (2227 - buffer) && hdmi_rx_rate <= (2227 + buffer))//4k30
        {

        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x08 ) = 0x00000100;//PLL_REF_FB
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x0C ) = 0x00000000;//PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x10 ) = 0x01000800;//PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x24 ) = 0x00000001;//SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x2C ) = 0x00000020;//SSCG_REG_2

       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_2 )     = 0x00000015;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_3 )     = 0x0004014F;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFEEM_CTRL_1 )   = 0x00000015;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CTRL_2 )     = 0x04000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_EM_CTRL_2 )      = 0x00000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_RXPLL_DIV )      = 0x0000241E;
       //*(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + SER_CLK_CTRL  )      = 0x00000071;  // COMMENTED: TX-owned register; belongs to HDMI TX driver
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CAL_CTRL_1 ) = 0x0101491D;
       }
    else if(hdmi_rx_rate >= (1856 - buffer) && hdmi_rx_rate <= (1856 + buffer))//4k30
        {

        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x08 ) = 0x00000100;//PLL_REF_FB
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x0C ) = 0x00000000;//PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x10 ) = 0x01001000;//PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x24 ) = 0x00000001;//SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x2C ) = 0x00000020;//SSCG_REG_2

       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_2 )     = 0x00000015;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_3 )     = 0x0004014F;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFEEM_CTRL_1 )   = 0x00000015;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CTRL_2 )     = 0x04000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_EM_CTRL_2 )      = 0x00000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_RXPLL_DIV )      = 0x00002219;
       //*(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + SER_CLK_CTRL  )      = 0x00000071;  // COMMENTED: TX-owned register; belongs to HDMI TX driver
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CAL_CTRL_1 ) = 0x0101491D;
       }
    else if(hdmi_rx_rate >= (1485 - buffer) && hdmi_rx_rate <= (1485 + buffer))//fhd60
       {

        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x08 ) = 0x00000100;//PLL_REF_FB
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x0C ) = 0x00000000;//PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x10 ) = 0x01000800;//PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x24 ) = 0x00000001;//SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x2C ) = 0x00000020;//SSCG_REG_2


       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_2 )     = 0x15;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_3 )     = 0x4014f;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFEEM_CTRL_1 )   = 0x15;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CTRL_2 )     = 0x4000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_EM_CTRL_2 )      = 0x01;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_RXPLL_DIV )      = 0x4414;
       //*(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + SER_CLK_CTRL  )      = 0x00000073;  // COMMENTED: TX-owned register; belongs to HDMI TX driver
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CAL_CTRL_1 ) = 0x101481d;
       }
    else if(hdmi_rx_rate >= (1113 - buffer) && hdmi_rx_rate <= (1113 + buffer))//fhd60
       {

        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x08 ) = 0x00000100;//PLL_REF_FB
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x0C ) = 0x00000000;//PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x10 ) = 0x01001000;//PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x24 ) = 0x00000001;//SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x2C ) = 0x00000020;//SSCG_REG_2

       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_2 )     = 0x00000015;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_3 )     = 0x0004014F;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFEEM_CTRL_1 )   = 0x00000015;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CTRL_2 )     = 0x04000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_EM_CTRL_2 )      = 0x00000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_RXPLL_DIV )      = 0x0000441E;
       //*(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + SER_CLK_CTRL  )      = 0x00000073;  // COMMENTED: TX-owned register; belongs to HDMI TX driver
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CAL_CTRL_1 ) = 0x0101481D;
       }
    else if(hdmi_rx_rate >= (928 - buffer) && hdmi_rx_rate <= (928 + buffer))//fhd60
       {

        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x08 ) = 0x00000100;//PLL_REF_FB
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x0C ) = 0x00000003;//PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x10 ) = 0x01001000;//PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x24 ) = 0x1B955701;//SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x2C ) = 0x00000020;//SSCG_REG_2

       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_2 )     = 0x00000015;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_3 )     = 0x0004014F;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFEEM_CTRL_1 )   = 0x00000015;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CTRL_2 )     = 0x04000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_EM_CTRL_2 )      = 0x00000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_RXPLL_DIV )      = 0x0000451F;
       //*(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + SER_CLK_CTRL  )      = 0x00000073;  // COMMENTED: TX-owned register; belongs to HDMI TX driver
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CAL_CTRL_1 ) = 0x0101481D;
       }
    else if(hdmi_rx_rate >= (742 - buffer) && hdmi_rx_rate <= (742 + buffer))//fhd30
       {

        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x08 ) = 0x00000100;//PLL_REF_FB
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x0C ) = 0x00000000;//PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x10 ) = 0x01000800;//PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x24 ) = 0x00000001;//SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x2C ) = 0x00000020;//SSCG_REG_2

       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_2 )     = 0x15;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_3 )     = 0x4014f;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFEEM_CTRL_1 )   = 0x15;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CTRL_2 )     = 0x4000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_EM_CTRL_2 )      = 0x01;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_RXPLL_DIV )      = 0x6814;
       //*(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + SER_CLK_CTRL  )      = 0x00000075;  // COMMENTED: TX-owned register; belongs to HDMI TX driver
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CAL_CTRL_1 ) = 0x101481D;
       }
    else if(hdmi_rx_rate >= (540 - buffer) && hdmi_rx_rate <= (540 + buffer))//fhd30
       {

        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x08 ) = 0x00000100;//PLL_REF_FB
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x0C ) = 0x00000000;//PLL_FRACN
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x10 ) = 0x01000800;//PLL_DIV_0_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x24 ) = 0x00000001;//SSCG_REG_0
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_CDR_REF_CCC_LOC_ADDR + 0x2C ) = 0x00000020;//SSCG_REG_2

       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_2 )     = 0x15;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_CDR_CTRL_3 )     = 0x4014f;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFEEM_CTRL_1 )   = 0x15;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CTRL_2 )     = 0x4000001;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_EM_CTRL_2 )      = 0x01;
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_RXPLL_DIV )      = 0x0000EB14;
       //*(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + SER_CLK_CTRL  )      = 0x00000075;  // COMMENTED: TX-owned register; belongs to HDMI TX driver
       *(volatile unsigned int *)(DRI_BASE_ADDR + lane_addr + DES_DFE_CAL_CTRL_1 ) = 0x101481D;
       }
}

void update_hdmi_rx_sys_clk_ccc(uint8_t color_depth)
{
    if (color_depth == HDMI_COLOR_DEPTH_10BIT)
    {
        /* 10-bit color depth */
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_RX_SYS_CLK_CCC_LOC_ADDR + 0x10) = 0x01000A00; /* CCC RX PLL_DIV_0_1 */
    }
    else if (color_depth == HDMI_COLOR_DEPTH_12BIT)
    {
        /* 12-bit color depth */
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_RX_SYS_CLK_CCC_LOC_ADDR + 0x10 ) = 0x01000C00; /* CCC RX PLL_DIV_0_1 */
    }
    else if (color_depth == HDMI_COLOR_DEPTH_16BIT)
    {
        /* 16-bit color depth */
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_RX_SYS_CLK_CCC_LOC_ADDR + 0x10 ) = 0x01001000; /* CCC RX PLL_DIV_0_1 */
    }
    else
    {
        /* 8-bit color depth (default) */
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_RX_SYS_CLK_CCC_LOC_ADDR + 0x10 ) = 0x01000800; /* CCC RX PLL_DIV_0_1 */
    }

}

typedef struct {
    uint8_t EOTF;
    uint8_t Static_Metadata_Descriptor_ID;

    struct { uint16_t x,y; } disp_primaries[3];

    struct { uint16_t x,y; } white_point;

    uint16_t Max_Disp_Mastering_Luminance;
    uint16_t Min_Disp_Mastering_Luminance;
    uint16_t Max_Content_Light_Level;
    uint16_t Max_Frame_Average_Light_Level;

} HDMIRX_DRMInfoFrame;

void drm_decode_payload(const uint32_t p[7], HDMIRX_DRMInfoFrame *drm)
{
        drm->EOTF  =  p[0]        & 0x3;
        drm->Static_Metadata_Descriptor_ID = (p[0] >> 4) & 0x3;

        for (int i = 0; i < 3; i++) {
            drm->disp_primaries[i].x =  p[1 + i]        & 0xFFFF;
            drm->disp_primaries[i].y = (p[1 + i] >> 16) & 0xFFFF;
        }

        drm->white_point.x =  p[4]        & 0xFFFF;
        drm->white_point.y = (p[4] >> 16) & 0xFFFF;

        drm->Max_Disp_Mastering_Luminance =  p[5]        & 0xFFFF;
        drm->Min_Disp_Mastering_Luminance = (p[5] >> 16) & 0xFFFF;

        drm->Max_Content_Light_Level       =  p[6]        & 0xFFFF;
        drm->Max_Frame_Average_Light_Level = (p[6] >> 16) & 0xFFFF;
}

void hdmirx_drm_read_payload(uint32_t payload_drm[7])
{
    uint32_t addr = HDMI_RX_HDR_REG1;

    for (int i = 0; i < 7; i++) {
        payload_drm[i] = axi4literead(addr);
        addr += 4;
    }
}

/* AVI byte 0, bits[6:5] -> ColorSpace */
uint8_t hdmi_rx_extract_color_space(void)
{
    return (uint8_t)((axi4literead(HDMI_RX_AVI_REG1) >> 5) & 0x03);
}

/* GCP byte 1, bits[3:0] -> ColorDepth */
uint8_t hdmi_rx_extract_color_depth(void)
{
    return (uint8_t)((axi4literead(HDMI_RX_GCP_REG1) >> 8) & 0x0F);
}

/* AVI byte 3 -> VIC */
uint8_t hdmi_rx_extract_vic(void)
{
    return (uint8_t)((axi4literead(HDMI_RX_AVI_REG1) >> 24) & 0xFF);
}

static const char *color_depth_str(uint8_t cd)
{
    switch (cd) {
        case HDMI_COLOR_DEPTH_8BIT :  return "8-bit";
        case 4:                       return "8-bit";  /* per HDMI spec */
        case HDMI_COLOR_DEPTH_10BIT:  return "10-bit";
        case HDMI_COLOR_DEPTH_12BIT:  return "12-bit";
        case HDMI_COLOR_DEPTH_16BIT:  return "16-bit";
        default:                      return "?";
    }
}

static const char *color_space_str(uint8_t cs)
{
    switch (cs) {
        case HDMI_COLOR_SPACE_RGB:    return "RGB";
        case HDMI_COLOR_SPACE_YUV422: return "YUV422";
        case HDMI_COLOR_SPACE_YUV444: return "YUV444";
        case HDMI_COLOR_SPACE_YUV420: return "YUV420";
        default:                      return "?";
    }
}

void hdmi_rx_print_status(uint32_t rate_mbps)
{
    char msg[96];
    snprintf(msg, sizeof(msg),
             "[HDMI_RX] rate=%lu Mbps  VIC=%u  CS=%s  CD=%s\r\n",
             (unsigned long)rate_mbps,
             hdmi_rx_extract_vic(),
             color_space_str(hdmi_rx_extract_color_space()),
             color_depth_str(hdmi_rx_extract_color_depth()));
    UART_polled_tx_string(&g_uart, (const uint8_t *)msg);
}
