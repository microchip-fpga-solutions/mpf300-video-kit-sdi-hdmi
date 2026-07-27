# Create generated clocks at output
create_generated_clock -name {ng_clk0} -divide_by 10 -source [ get_pins { SDI_HDMI_top_0/SDI_Top_0/SDI_Clocks_Resets_1/PF_CCC_divide10_0/PF_CCC_divide10_0/pll_inst_0/OUT0 } ] [ get_pins { SDI_HDMI_top_0/SDI_Top_0/SDI_Clocks_Resets_1/PF_NGMUX_C0_0/SDI_Clocks_Resets_1_SDI_TX_CLK } ]
#P&R using this constraint for timing - 148.5MHz 
create_generated_clock -name {ng_clk1} -divide_by 1 -source [ get_pins { SDI_HDMI_top_0/SDI_Top_0/PF_XCVR_ERM_C0_0/I_XCVR/LANE0_RX_IcbClkDiv/Y_DIV } ] [ get_pins { SDI_HDMI_top_0/SDI_Top_0/SDI_Clocks_Resets_1/PF_NGMUX_C0_0/SDI_Clocks_Resets_1_SDI_TX_CLK } ]
# Set exclusive relationship
set_clock_groups  -physically_exclusive -group { ng_clk0 } -group { ng_clk1 }
set_clock_groups -name {clk_grp_ng} -asynchronous -group [ get_clocks { ng_clk0 } ]
