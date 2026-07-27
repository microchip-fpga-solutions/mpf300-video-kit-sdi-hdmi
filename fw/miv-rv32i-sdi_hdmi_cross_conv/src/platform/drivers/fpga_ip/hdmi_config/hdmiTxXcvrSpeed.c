/*-------------------------------------------------------------------------------------------------
-- File Name    : hdmiTxXCVRSpeed.c
-- Description  : HDMI TX Transceiver Speed Configuration
-- Author       : India Solutions Team
-- COPYRIGHT 2025 BY MICROCHIP
-------------------------------------------------------------------------------------------------*/

#include "fpga_design_config.h"
#include "hdmiTxXcvrSpeed.h"
/*-----------------------------------------------------------------------------
 * HDMI TX Lane Base Addresses
 *---------------------------------------------------------------------------*/
static const uint32_t hdmi_tx_lanes[] = {
    HDMI_TX_XCVR_PMA_LN0_BASE,
    HDMI_TX_XCVR_PMA_LN1_BASE,
    HDMI_TX_XCVR_PMA_LN2_BASE,
    HDMI_TX_XCVR_PMA_LN3_BASE
};

#define NUM_HDMI_TX_LANES  4

/*-----------------------------------------------------------------------------
 * Helper Functions
 *---------------------------------------------------------------------------*/

/**
 * set_all_lanes_reset - Set reset state for all HDMI TX lanes
 * @param reset: Reset value (0x3 = assert, 0x1 = release)
 */
static void set_all_lanes_reset(uint8_t reset)
{
    for (int i = 0; i < NUM_HDMI_TX_LANES; i++) {
        *(volatile unsigned int *)(DRI_BASE_ADDR + hdmi_tx_lanes[i] + SER_RSTPD) = reset;
    }
}

/**
 * set_all_lanes_clk_ctrl - Set clock control for all HDMI TX lanes
 * @param clk_ctrl: Clock control value
 */
static void set_all_lanes_clk_ctrl(uint8_t clk_ctrl)
{
    for (int i = 0; i < NUM_HDMI_TX_LANES; i++) {
        *(volatile unsigned int *)(DRI_BASE_ADDR + hdmi_tx_lanes[i] + SER_CLK_CTRL) = clk_ctrl;
    }
}

/**
 * get_clk_ctrl_for_rate - Get clock control value for given rate
 * @param hdmi_tx_rate: Rate index (2=12G, 3=6G, 4=3G, 5=1.5G, 6=270M)
 * @return: Clock control value
 */
static uint8_t get_clk_ctrl_for_rate(uint8_t hdmi_tx_rate)
{
    switch (hdmi_tx_rate) {
        case 2:  return 0x71;  /* 4K60 - 5940 Mbps   1/2 */
        case 3:  return 0x73;  /* 4K30 - 2970 Mbps   1/4 */
        case 4:  return 0x75;  /* FHD60 - 1485 Mbps  1/8 */
        case 5:  return 0x75;  /* FHD30 - 742.5 Mbps 1/8 */
        case 6:  return 0x77;  /* SD - 270 Mbps */
        case 9:  return 0x71;  /* 3712 Mbps 1/2 */
        case 10: return 0x71;  /* 4455 Mbps 1/2 */
        case 17: return 0x75;  /* 928.125 Mbps 1/8 */
        case 18: return 0x75;  /* 1113.75 Mbps 1/8 */
        default: return 0x71;  /*                 */
    }
}

static uint8_t get_data_rate_diff_color_format_depth(uint8_t vic, uint8_t hdmi_tx_rate,uint8_t color_format, uint8_t pix_width)
{
    if(color_format!=0 && hdmi_tx_rate == 2 && (vic != VIC_3840x2160p24 && vic != VIC_4096x2160p24)){
        return hdmi_tx_rate*4+pix_width;
    }
    //else if(color_format!=0 && hdmi_tx_rate == 4){
    //    return hdmi_tx_rate*4+pix_width;
    //}
    else if(color_format != 0 || pix_width == 2)
        return hdmi_tx_rate+1;
    else
        return hdmi_tx_rate;
}

static uint8_t get_pll_config_for_diff_color_format_depth(uint8_t hdmi_tx_rate,uint8_t color_format, uint8_t pix_width)
{
    uint8_t extend_color_format_depth;

    //if((color_format== 0 && pix_width == 2))
    if((color_format != 0 || pix_width == 2))
        return extend_color_format_depth = 1;
    else
        return extend_color_format_depth = 0;
}

/*-----------------------------------------------------------------------------
 * Public Functions
 *---------------------------------------------------------------------------*/

/**
 * update_hdmi_tx_xcvr_speed - Configure HDMI TX transceiver for given rate
 * @param hdmi_tx_rate: Rate index (2=12G, 3=6G, 4=3G, 5=1.5G, 6=270M)
 */
void update_hdmi_tx_xcvr_speed(uint8_t vic, uint8_t hdmi_tx_rate,uint8_t color_format, uint8_t pix_width)
{
    uint8_t hdmi_tx_rate_new;
    uint8_t extend_color_format_depth;

    /* Assert reset on all lanes */
    set_all_lanes_reset(0x3);

    hdmi_tx_rate_new = get_data_rate_diff_color_format_depth(vic, hdmi_tx_rate,color_format,pix_width);
    extend_color_format_depth = get_pll_config_for_diff_color_format_depth(hdmi_tx_rate,color_format,pix_width);

    /* Configure PLL for target rate */
    hdmi_tx_pll_config(hdmi_tx_rate_new,extend_color_format_depth);

    /* Set clock control on all lanes */
    set_all_lanes_clk_ctrl(get_clk_ctrl_for_rate(hdmi_tx_rate_new));

    /* Release reset on all lanes */
    set_all_lanes_reset(0x1);
}

void hdmi_tx_pll_config(uint8_t hdmi_tx_rate,uint8_t extend_color_format_depth)
{
    *(volatile unsigned int *)(DRI_BASE_ADDR + 0x8080010 ) = 0x01000800;      // HDMITX CCC 1:1
    if (hdmi_tx_rate == 6) // hdmi_tx_rate = 6 -> 270 Mbps
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x1;      // TXPLL_JA_RST
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_DIV_1)  = 0x00140008;// TXPLL_DIV_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_1)   = 0x00FD0017; // TXPLL_JA_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_2)   = 0x00001130; // TXPLL_JA_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_3)   = 0x00020190; // TXPLL_JA_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_4)   = 0x08CF0019; // TXPLL_JA_4
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_5)   = 0x0719E69D; // TXPLL_JA_5
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_6)   = 0x01030408; // TXPLL_JA_6
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_7)   = 0x07114114; // TXPLL_JA_7
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_9)   = 0x00180014; // TXPLL_JA_9
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x0;        // TXPLL_JA_RST
    }
    else if (hdmi_tx_rate == 5 && extend_color_format_depth == 1) // hdmi_tx_rate = 4 -> 1485 Mbps
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x1;      // TXPLL_JA_RST
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_DIV_1)  = 0x00140008;// TXPLL_DIV_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_1)   = 0x00FA0019; // TXPLL_JA_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_2)   = 0x00000FA0; // TXPLL_JA_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_3)   = 0x00020190; // TXPLL_JA_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_4)   = 0x08CF0019; // TXPLL_JA_4
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_5)   = 0x07CAE69E; // TXPLL_JA_5
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_6)   = 0x01000408; // TXPLL_JA_6
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_7)   = 0x07111B85; // TXPLL_JA_7
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_9)   = 0x00180014; // TXPLL_JA_9
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x0;        // TXPLL_JA_RST
    }
    else if (hdmi_tx_rate == 5) // hdmi_tx_rate = 5 -> 742.5 Mbps
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x1;      // TXPLL_JA_RST
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_DIV_1)  = 0x00140008;// TXPLL_DIV_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_1)   = 0x0104000D; // TXPLL_JA_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_2)   = 0x00001F40; // TXPLL_JA_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_3)   = 0x00020190; // TXPLL_JA_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_4)   = 0x08CF0019; // TXPLL_JA_4
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_5)   = 0x0763E69B; // TXPLL_JA_5
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_6)   = 0x01010408; // TXPLL_JA_6
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_7)   = 0x0711BDC6; // TXPLL_JA_7
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_9)   = 0x00180014; // TXPLL_JA_9
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x0;        // TXPLL_JA_RST
    }
    else if (hdmi_tx_rate == 4 && extend_color_format_depth == 0) // hdmi_tx_rate = 4 -> 1485 Mbps
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x1;        // TXPLL_JA_RST
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_DIV_1)  = 0x0028000F; // TXPLL_DIV_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_1)   = 0x01000018; // TXPLL_JA_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_2)   = 0x000010AB; // TXPLL_JA_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_3)   = 0x00020190; // TXPLL_JA_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_4)   = 0x09AD0019; // TXPLL_JA_4
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_5)   = 0x07ABE690; // TXPLL_JA_5
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_6)   = 0x01010409; // TXPLL_JA_6
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_7)   = 0x07129673; // TXPLL_JA_7
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_9)   = 0x00180028; // TXPLL_JA_9
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x0;        // TXPLL_JA_RST
    }
    else if (hdmi_tx_rate == 2 || (hdmi_tx_rate == 3 && extend_color_format_depth == 1)) // hdmi_tx_rate = 2 -> 5940 Mbps
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x1;        // TXPLL_JA_RST
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_DIV_1)  = 0x0028000F; // TXPLL_DIV_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_1)   = 0x00F8005D; // TXPLL_JA_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_2)   = 0x000007D0; // TXPLL_JA_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_3)   = 0x000402EE; // TXPLL_JA_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_4)   = 0x09B40019; // TXPLL_JA_4
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_5)   = 0x07A7E690; // TXPLL_JA_5
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_6)   = 0x01010409; // TXPLL_JA_6
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_7)   = 0x07126697; // TXPLL_JA_7
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_9)   = 0x00180028; // TXPLL_JA_9
       // *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_10)  = 0x000023BE; // TXPLL_JA_10
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x0;
    }
    else if (hdmi_tx_rate == 3) // hdmi_tx_rate = 3 -> 2970 Mbps
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x1;        // TXPLL_JA_RST
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_DIV_1)  = 0x0028000F; // TXPLL_DIV_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_1)   = 0x01000030; // TXPLL_JA_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_2)   = 0x00000855; // TXPLL_JA_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_3)   = 0x00020190; // TXPLL_JA_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_4)   = 0x09AD0019; // TXPLL_JA_4
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_5)   = 0x07ABE690; // TXPLL_JA_5
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_6)   = 0x01010409; // TXPLL_JA_6
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_7)   = 0x07129673; // TXPLL_JA_7
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_9)   = 0x00180028; // TXPLL_JA_9
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x0;        // TXPLL_JA_RST
    }
    else if (hdmi_tx_rate == 10) // hdmi_tx_rate = 10 -> 4455 Mbps
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x1;        // TXPLL_JA_RST
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_DIV_1)  = 0x001E000C; // TXPLL_DIV_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_1)   = 0x00FA0064; // TXPLL_JA_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_2)   = 0x000007D0; // TXPLL_JA_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_3)   = 0x00040320; // TXPLL_JA_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_4)   = 0x099B0019; // TXPLL_JA_4
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_5)   = 0x0797E63B; // TXPLL_JA_5
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_6)   = 0x0101040A; // TXPLL_JA_6
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_7)   = 0x07111101; // TXPLL_JA_7
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_9)   = 0x0018001E; // TXPLL_JA_9
       // *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_10)  = 0x000023BE; // TXPLL_JA_10
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x0;

        *(volatile unsigned int *)(DRI_BASE_ADDR + 0x8080010 ) = 0x01000C00;      // HDMITX CCC 1/1.5
    }
    else if (hdmi_tx_rate == 18) // hdmi_tx_rate = 18 -> 1113.75 Mbps
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x1;        // TXPLL_JA_RST
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_DIV_1)  = 0x001E000C; // TXPLL_DIV_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_1)   = 0x00FA0019; // TXPLL_JA_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_2)   = 0x00000FA0; // TXPLL_JA_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_3)   = 0x00020190; // TXPLL_JA_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_4)   = 0x099B0019; // TXPLL_JA_4
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_5)   = 0x0797E63B; // TXPLL_JA_5
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_6)   = 0x0101040A; // TXPLL_JA_6
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_7)   = 0x07111101; // TXPLL_JA_7
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_9)   = 0x0018001E; // TXPLL_JA_9
       // *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_10)  = 0x000023BE; // TXPLL_JA_10
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x0;

        *(volatile unsigned int *)(DRI_BASE_ADDR + 0x8080010 ) = 0x01000C00;      // HDMITX CCC 1/1.5
    }
    else if (hdmi_tx_rate == 9) // hdmi_tx_rate = 9 -> 3712.5 Mbps
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x1;        // TXPLL_JA_RST
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_DIV_1)  = 0x0019000A; // TXPLL_DIV_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_1)   = 0x00FA0064; // TXPLL_JA_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_2)   = 0x000007D0; // TXPLL_JA_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_3)   = 0x00040320; // TXPLL_JA_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_4)   = 0x09820019; // TXPLL_JA_4
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_5)   = 0x07FDE6C5; // TXPLL_JA_5
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_6)   = 0x01000408; // TXPLL_JA_6
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_7)   = 0x07110C93; // TXPLL_JA_7
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_9)   = 0x00180019; // TXPLL_JA_9
       // *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_10)  = 0x000023BE; // TXPLL_JA_10
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x0;

        *(volatile unsigned int *)(DRI_BASE_ADDR + 0x8080010 ) = 0x01000A00;      // HDMITX CCC 1/1.25
    }
    else if (hdmi_tx_rate == 17) // hdmi_tx_rate = 17 -> 828.125 Mbps
    {
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x1;        // TXPLL_JA_RST
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_DIV_1)  = 0x0019000A; // TXPLL_DIV_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_1)   = 0x00FA0019; // TXPLL_JA_1
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_2)   = 0x00000FA0; // TXPLL_JA_2
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_3)   = 0x00020190; // TXPLL_JA_3
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_4)   = 0x09820019; // TXPLL_JA_4
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_5)   = 0x07FDE6C5; // TXPLL_JA_5
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_6)   = 0x01000408; // TXPLL_JA_6
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_7)   = 0x07110C93; // TXPLL_JA_7
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_9)   = 0x00180019; // TXPLL_JA_9
       // *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_10)  = 0x000023BE; // TXPLL_JA_10
        *(volatile unsigned int *)(DRI_BASE_ADDR + HDMI_TX_XCVR_PMA_CMN_BASE + TXPLL_JA_RST) = 0x0;

        *(volatile unsigned int *)(DRI_BASE_ADDR + 0x8080010 ) = 0x01000A00;      // HDMITX CCC 1/1.25
    }


}
