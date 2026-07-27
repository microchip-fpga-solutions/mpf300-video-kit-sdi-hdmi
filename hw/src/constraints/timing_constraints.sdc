#TCK
create_clock -name TCK -period 33.33 [ get_ports { TCK } ]
#HDMI XCVR Tx CLKs
set_clock_groups -name {clk_grp_xcvr_l} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/HDMI_Top_0/PF_XCVR_ERM_C1_0/I_XCVR/LANE0/TX_CLK_R} ]
set_clock_groups -name {clk_grp_xcvr_2} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/HDMI_Top_0/PF_XCVR_ERM_C1_0/I_XCVR/LANE1/TX_CLK_R} ]
set_clock_groups -name {clk_grp_xcvr_3} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/HDMI_Top_0/PF_XCVR_ERM_C1_0/I_XCVR/LANE2/TX_CLK_R} ]
set_clock_groups -name {clk_grp_xcvr_4} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/HDMI_Top_0/PF_XCVR_ERM_C1_0/I_XCVR/LANE3/TX_CLK_R} ]
#SDI XCVR Tx CLK
set_clock_groups -name {clk_grp_xcvr_5} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/SDI_Top_0/PF_XCVR_ERM_C0_0/I_XCVR/LANE0_RX_IcbClkDiv/Y_DIV} ]
#50MHz and 150MHz
set_clock_groups -name {proc_clk_grp1} -asynchronous -group [ get_clocks {clocks_and_reset_1/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/OUT0 } ]
set_clock_groups -name {proc_clk_grp2} -asynchronous -group [ get_clocks {clocks_and_reset_1/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/OUT1 } ]
set_clock_groups -name {proc_clk_grp3} -asynchronous -group [ get_clocks {TCK } ]

#SDI Tx CLKs
set_clock_groups -name {sdi_tx_clk_grp1} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/SDI_Top_0/SDI_Clocks_Resets_1/PF_CCC_divide10_0/PF_CCC_divide10_0/pll_inst_0/OUT0} ]
#ERM 
set_clock_groups -name {erm_clk_grp1} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/SDI_Top_0/SDI_Clocks_Resets_1/PF_CLK_DIV_C0_0/PF_CLK_DIV_C0_0/I_CD/Y_DIV } ]

#HDMI XCVR Rx CLKs
set_clock_groups -name {clk_grp_xcvr_6} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/HDMI_Top_0/PF_XCVR_ERM_C1_0/I_XCVR/LANE0/RX_CLK_R } ]
set_clock_groups -name {clk_grp_xcvr_7} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/HDMI_Top_0/PF_XCVR_ERM_C1_0/I_XCVR/LANE1/RX_CLK_R } ]
set_clock_groups -name {clk_grp_xcvr_8} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/HDMI_Top_0/PF_XCVR_ERM_C1_0/I_XCVR/LANE2/RX_CLK_R } ]
set_clock_groups -name {clk_grp_xcvr_9} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/HDMI_Top_0/PF_XCVR_ERM_C1_0/I_XCVR/LANE3/RX_CLK_R } ]
#SDI XCVR Rx CLKs
set_clock_groups -name {clk_grp_xcvr_10} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/SDI_Top_0/PF_XCVR_ERM_C0_0/I_XCVR/LANE0/TX_CLK_R } ]

#HDMI Rx CLKs
set_clock_groups -name {hdmi_rx_clk_grp1} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/HDMI_Top_0/HDMI_Clocks_Resets_1/PF_CCC_HDMIRX_SYS_CLK_0/PF_CCC_HDMIRX_SYS_CLK_0/pll_inst_0/OUT0 } ]

#SDI Rx CLKs
set_clock_groups -name {sdi_rx_clk_grp1} -asynchronous -group [ get_clocks {SDI_HDMI_top_0/SDI_Top_0/SDI_Clocks_Resets_1/PF_CCC_divide_1or10_0/PF_CCC_divide_1or10_0/pll_inst_0/OUT0} ]