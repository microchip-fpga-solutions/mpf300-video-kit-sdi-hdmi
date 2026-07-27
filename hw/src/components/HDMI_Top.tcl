# Creating SmartDesign "HDMI_Top"
set sd_name {HDMI_Top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACR_VALID_IN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARESETN_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Stream_Target_IF_AUDIO_AUDIO_TVALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_POR_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI_DRI_ARST_N_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI_DRI_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CABLE_REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CABLE_REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI_DRI_ARST_N_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI_DRI_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI_DRI_ARST_N_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI_DRI_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_Resetn} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_TxPLL_DRI_TxPLL_DRI_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_TxPLL_DRI_TxPLL_DRI_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_Tx_AUD_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HPD_Rx_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HPD_Tx_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {H_SYNC_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {JA_FAB_REF_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE_LANE0_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE_LANE0_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE_LANE1_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE_LANE1_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE_LANE2_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE_LANE2_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE_LANE3_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE_LANE3_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_150M_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_150M_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SCL_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VIDEO_DATA_VALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {V_SYNC_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {XCVR_INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {XCVR_REF_CLK_FAB} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AUDIO_DATA_VALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Stream_Target_IF_AUDIO_AUDIO_TREADY_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_RATE_INT_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMIRx_RESET_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMIRx_SYS_CLK_CCC} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI_DRI_INTERRUPT_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI_DRI_INTERRUPT_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_RX_CLK_B} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI_DRI_INTERRUPT_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_TX_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_TxPLL_DRI_TxPLL_DRI_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_TxPLL_LOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HPD_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {H_SYNC_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE_LANE0_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE_LANE1_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE_LANE2_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE_LANE3_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VIDEO_DATA_VALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {V_SYNC_O} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {SDA} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {ACR_CTS} -port_direction {IN} -port_range {[19:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {ACR_N} -port_direction {IN} -port_range {[19:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Stream_Target_IF_AUDIO_AUDIO_TDATA_I} -port_direction {IN} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Stream_Target_IF_AUDIO_AUDIO_TID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI_DRI_CTRL_0} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI_DRI_WDATA_0} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI_DRI_CTRL_0} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI_DRI_WDATA_0} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI_DRI_CTRL_0} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI_DRI_WDATA_0} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_TxPLL_DRI_TxPLL_DRI_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_TxPLL_DRI_TxPLL_DRI_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE_LANE0_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE_LANE0_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE_LANE1_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE_LANE1_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE_LANE2_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE_LANE2_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE_LANE3_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE_LANE3_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PIXEL_DATA_I} -port_direction {IN} -port_range {[143:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {VIC_I} -port_direction {IN} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AUDIO_SAMPLE_CH1_O} -port_direction {OUT} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AUDIO_SAMPLE_CH2_O} -port_direction {OUT} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {B_O} -port_direction {OUT} -port_range {[47:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {G_O} -port_direction {OUT} -port_range {[47:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI_DRI_RDATA_0} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI_DRI_RDATA_0} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI_DRI_RDATA_0} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_TxPLL_DRI_TxPLL_DRI_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE_LANE0_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE_LANE1_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE_LANE2_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE_LANE3_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {R_O} -port_direction {OUT} -port_range {[47:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:LANE0_DRI_SLAVE_LANE0_DRI_CLK" \
"DRI_ARST_N:LANE0_DRI_SLAVE_LANE0_DRI_ARST_N" \
"DRI_CTRL:LANE0_DRI_SLAVE_LANE0_DRI_CTRL" \
"DRI_RDATA:LANE0_DRI_SLAVE_LANE0_DRI_RDATA" \
"DRI_WDATA:LANE0_DRI_SLAVE_LANE0_DRI_WDATA" \
"DRI_INTERRUPT:LANE0_DRI_SLAVE_LANE0_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:LANE1_DRI_SLAVE_LANE1_DRI_CLK" \
"DRI_ARST_N:LANE1_DRI_SLAVE_LANE1_DRI_ARST_N" \
"DRI_CTRL:LANE1_DRI_SLAVE_LANE1_DRI_CTRL" \
"DRI_RDATA:LANE1_DRI_SLAVE_LANE1_DRI_RDATA" \
"DRI_WDATA:LANE1_DRI_SLAVE_LANE1_DRI_WDATA" \
"DRI_INTERRUPT:LANE1_DRI_SLAVE_LANE1_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:LANE2_DRI_SLAVE_LANE2_DRI_CLK" \
"DRI_ARST_N:LANE2_DRI_SLAVE_LANE2_DRI_ARST_N" \
"DRI_CTRL:LANE2_DRI_SLAVE_LANE2_DRI_CTRL" \
"DRI_RDATA:LANE2_DRI_SLAVE_LANE2_DRI_RDATA" \
"DRI_WDATA:LANE2_DRI_SLAVE_LANE2_DRI_WDATA" \
"DRI_INTERRUPT:LANE2_DRI_SLAVE_LANE2_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:LANE3_DRI_SLAVE_LANE3_DRI_CLK" \
"DRI_ARST_N:LANE3_DRI_SLAVE_LANE3_DRI_ARST_N" \
"DRI_CTRL:LANE3_DRI_SLAVE_LANE3_DRI_CTRL" \
"DRI_RDATA:LANE3_DRI_SLAVE_LANE3_DRI_RDATA" \
"DRI_WDATA:LANE3_DRI_SLAVE_LANE3_DRI_WDATA" \
"DRI_INTERRUPT:LANE3_DRI_SLAVE_LANE3_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4Stream_Target_IF_AUDIO} -port_bif_vlnv {AMBA:AMBA4:AXI4Stream:r0p0_1} -port_bif_role {slave} -port_bif_mapping {\
"TVALID:AXI4Stream_Target_IF_AUDIO_AUDIO_TVALID_I" \
"TREADY:AXI4Stream_Target_IF_AUDIO_AUDIO_TREADY_O" \
"TDATA:AXI4Stream_Target_IF_AUDIO_AUDIO_TDATA_I" \
"TID:AXI4Stream_Target_IF_AUDIO_AUDIO_TID" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4Lite_Target_IF_HDMI_TX_awaddr" \
"AWVALID:AXI4Lite_Target_IF_HDMI_TX_awvalid" \
"AWREADY:AXI4Lite_Target_IF_HDMI_TX_awready" \
"WDATA:AXI4Lite_Target_IF_HDMI_TX_wdata" \
"WVALID:AXI4Lite_Target_IF_HDMI_TX_wvalid" \
"WREADY:AXI4Lite_Target_IF_HDMI_TX_wready" \
"BRESP:AXI4Lite_Target_IF_HDMI_TX_bresp" \
"BVALID:AXI4Lite_Target_IF_HDMI_TX_bvalid" \
"BREADY:AXI4Lite_Target_IF_HDMI_TX_bready" \
"ARADDR:AXI4Lite_Target_IF_HDMI_TX_araddr" \
"ARVALID:AXI4Lite_Target_IF_HDMI_TX_arvalid" \
"ARREADY:AXI4Lite_Target_IF_HDMI_TX_arready" \
"RDATA:AXI4Lite_Target_IF_HDMI_TX_rdata" \
"RRESP:AXI4Lite_Target_IF_HDMI_TX_rresp" \
"RVALID:AXI4Lite_Target_IF_HDMI_TX_rvalid" \
"RREADY:AXI4Lite_Target_IF_HDMI_TX_rready" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4Lite_Target_IF_HDMI_RX_awaddr" \
"AWVALID:AXI4Lite_Target_IF_HDMI_RX_awvalid" \
"AWREADY:AXI4Lite_Target_IF_HDMI_RX_awready" \
"WDATA:AXI4Lite_Target_IF_HDMI_RX_wdata" \
"WVALID:AXI4Lite_Target_IF_HDMI_RX_wvalid" \
"WREADY:AXI4Lite_Target_IF_HDMI_RX_wready" \
"BRESP:AXI4Lite_Target_IF_HDMI_RX_bresp" \
"BVALID:AXI4Lite_Target_IF_HDMI_RX_bvalid" \
"BREADY:AXI4Lite_Target_IF_HDMI_RX_bready" \
"ARADDR:AXI4Lite_Target_IF_HDMI_RX_araddr" \
"ARVALID:AXI4Lite_Target_IF_HDMI_RX_arvalid" \
"ARREADY:AXI4Lite_Target_IF_HDMI_RX_arready" \
"RDATA:AXI4Lite_Target_IF_HDMI_RX_rdata" \
"RRESP:AXI4Lite_Target_IF_HDMI_RX_rresp" \
"RVALID:AXI4Lite_Target_IF_HDMI_RX_rvalid" \
"RREADY:AXI4Lite_Target_IF_HDMI_RX_rready" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {HDMI_TxPLL_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:HDMI_TxPLL_DRI_TxPLL_DRI_DRI_CLK" \
"DRI_ARST_N:HDMI_TxPLL_DRI_TxPLL_DRI_DRI_ARST_N" \
"DRI_CTRL:HDMI_TxPLL_DRI_TxPLL_DRI_DRI_CTRL" \
"DRI_RDATA:HDMI_TxPLL_DRI_TxPLL_DRI_DRI_RDATA" \
"DRI_WDATA:HDMI_TxPLL_DRI_TxPLL_DRI_DRI_WDATA" \
"DRI_INTERRUPT:HDMI_TxPLL_DRI_TxPLL_DRI_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:HDMITX_DEEP_COLOR_PLL_DRI_DRI_CLK_0" \
"DRI_ARST_N:HDMITX_DEEP_COLOR_PLL_DRI_DRI_ARST_N_0" \
"DRI_CTRL:HDMITX_DEEP_COLOR_PLL_DRI_DRI_CTRL_0" \
"DRI_RDATA:HDMITX_DEEP_COLOR_PLL_DRI_DRI_RDATA_0" \
"DRI_WDATA:HDMITX_DEEP_COLOR_PLL_DRI_DRI_WDATA_0" \
"DRI_INTERRUPT:HDMITX_DEEP_COLOR_PLL_DRI_DRI_INTERRUPT_0" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:HDMI_CDR_PLL0_DRI_DRI_CLK_0" \
"DRI_ARST_N:HDMI_CDR_PLL0_DRI_DRI_ARST_N_0" \
"DRI_CTRL:HDMI_CDR_PLL0_DRI_DRI_CTRL_0" \
"DRI_RDATA:HDMI_CDR_PLL0_DRI_DRI_RDATA_0" \
"DRI_WDATA:HDMI_CDR_PLL0_DRI_DRI_WDATA_0" \
"DRI_INTERRUPT:HDMI_CDR_PLL0_DRI_DRI_INTERRUPT_0" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:HDMI_RX_SYS_CLK_PLL_DRI_DRI_CLK_0" \
"DRI_ARST_N:HDMI_RX_SYS_CLK_PLL_DRI_DRI_ARST_N_0" \
"DRI_CTRL:HDMI_RX_SYS_CLK_PLL_DRI_DRI_CTRL_0" \
"DRI_RDATA:HDMI_RX_SYS_CLK_PLL_DRI_DRI_RDATA_0" \
"DRI_WDATA:HDMI_RX_SYS_CLK_PLL_DRI_DRI_WDATA_0" \
"DRI_INTERRUPT:HDMI_RX_SYS_CLK_PLL_DRI_DRI_INTERRUPT_0" } 

# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add AND2_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_1}



# Add AND2_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_2}



# Add AND2_3 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_3}



# Add BIBUF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_0:D} -value {GND}



# Add HDMI_Clocks_Resets_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {HDMI_Clocks_Resets} -instance_name {HDMI_Clocks_Resets_1}



# Add HDMI_RX_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {HDMI_RX_C0} -instance_name {HDMI_RX_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {HDMI_RX_C0_0:PIXEL_DATA_O} -pin_slices {[143:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {HDMI_RX_C0_0:PIXEL_DATA_O} -pin_slices {[47:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {HDMI_RX_C0_0:PIXEL_DATA_O} -pin_slices {[95:48]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:ACR_VALID_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:HDMI_RX_READY_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:HDMI_RESET_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:ITC_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:SET_AV_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:CLEAR_AV_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:DEFAULT_PH_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:V_SYNC_STROBE_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:H_SYNC_STROBE_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:VIDEO_VALID_STROBE_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:ACR_CTS_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:ACR_N_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:DATA_RATE_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:DEBUG_BUS_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:VIC_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:COLOR_FORMAT_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:CD_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:PP_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:E2E1E0_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_0:C1C0_O}



# Add HDMI_TX_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {HDMI_TX_C0} -instance_name {HDMI_TX_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_TX_C0_0:HDMI_TX_RESET_O}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_TX_C0_0:AUDIO_RATE} -value {001}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_TX_C0_0:COLOR_FORMAT_I} -value {01}



# Add INV_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0}



# Add INV_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_1}



# Add PF_XCVR_ERM_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_ERM_C1} -instance_name {PF_XCVR_ERM_C1_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE0_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE0_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE1_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE1_RX_READY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE1_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE2_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE2_RX_READY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE2_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE3_TX_CLK_R}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE3_RX_CLK_R}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE3_RX_SLIP} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE3_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE3_RX_READY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE3_RX_VAL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE3_TX_CLK_STABLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE3_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE3_RX_DATA}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACLK_I" "HDMI_RX_C0_0:ACLK_I" "HDMI_TX_C0_0:ACLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACR_VALID_IN" "HDMI_TX_C0_0:ACR_VALID_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "HDMI_Clocks_Resets_1:Tx_CLK_Stable" "PF_XCVR_ERM_C1_0:LANE0_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "AND2_1:B" "AND2_2:B" "HDMI_Clocks_Resets_1:HDMI_Tx_Reset_n" "HDMI_Resetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "HDMI_TX_C0_0:B_CLK_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:A" "PF_XCVR_ERM_C1_0:LANE1_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:Y" "HDMI_TX_C0_0:G_CLK_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_2:A" "PF_XCVR_ERM_C1_0:LANE2_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_2:Y" "HDMI_TX_C0_0:R_CLK_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_3:A" "PF_XCVR_ERM_C1_0:LANE0_RX_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_3:B" "HDMI_RX_C0_0:B_RX_VALID_I" "PF_XCVR_ERM_C1_0:LANE0_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_3:Y" "HDMI_Clocks_Resets_1:HDMI_Rx_Valid" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARESETN_I" "HDMI_RX_C0_0:ARESETN_I" "HDMI_TX_C0_0:ARESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AUDIO_DATA_VALID_O" "HDMI_RX_C0_0:AUDIO_DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:E" "HDMI_RX_C0_0:SDA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:PAD" "SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:Y" "HDMI_RX_C0_0:SDA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_RATE_INT_O" "HDMI_RX_C0_0:DATA_RATE_INT_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FPGA_POR_N" "HDMI_Clocks_Resets_1:FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMIRx_RESET_N" "HDMI_Clocks_Resets_1:CCC_SYSCLK_HDMIRx_RESET_N" "HDMI_RX_C0_0:RESET_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMIRx_SYS_CLK_CCC" "HDMI_Clocks_Resets_1:HDMIRx_SYS_CLK_CCC" "HDMI_RX_C0_0:VIDEO_SYS_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_CABLE_REF_CLK_PAD_N" "HDMI_Clocks_Resets_1:HDMI_CABLE_REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_CABLE_REF_CLK_PAD_P" "HDMI_Clocks_Resets_1:HDMI_CABLE_REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:CDR_REF_CLK" "PF_XCVR_ERM_C1_0:LANE0_CDR_REF_CLK_FAB" "PF_XCVR_ERM_C1_0:LANE1_CDR_REF_CLK_FAB" "PF_XCVR_ERM_C1_0:LANE2_CDR_REF_CLK_FAB" "PF_XCVR_ERM_C1_0:LANE3_CDR_REF_CLK_FAB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:HDMIRx_SYS_CLK" "HDMI_RX_C0_0:B_RX_CLK_I" "HDMI_RX_CLK_B" "PF_XCVR_ERM_C1_0:LANE0_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:HDMI_CABLE_CLK" "HDMI_RX_C0_0:HDMI_CABLE_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:HDMI_TX_SYS_CLK" "HDMI_TX_C0_0:SYS_CLK_I" "HDMI_TX_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:HDMI_TxPLL_LOCK" "HDMI_TxPLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:HDMI_Tx_CLK" "HDMI_TX_C0_0:B_CLK_I" "PF_XCVR_ERM_C1_0:LANE0_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:HDMI_Tx_Tx_CLK_RESET_n" "HDMI_TX_C0_0:RESET_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:INIT_DONE" "INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:JA_FAB_REF_CLK" "JA_FAB_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:TX_PLL_REF_CLK" "REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:XCVR_REF_CLK_FAB" "XCVR_REF_CLK_FAB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:BIT_SLIP_B_O" "PF_XCVR_ERM_C1_0:LANE0_RX_SLIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:BIT_SLIP_G_O" "PF_XCVR_ERM_C1_0:LANE1_RX_SLIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:BIT_SLIP_R_O" "PF_XCVR_ERM_C1_0:LANE2_RX_SLIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:G_RX_CLK_I" "PF_XCVR_ERM_C1_0:LANE1_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:G_RX_VALID_I" "PF_XCVR_ERM_C1_0:LANE1_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:HPD_I" "INV_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:HPD_O" "INV_1:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:H_SYNC_O" "H_SYNC_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:REF_150M_CLK_I" "REF_150M_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:RESETN_150M_I" "RESETN_150M_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:R_RX_CLK_I" "PF_XCVR_ERM_C1_0:LANE2_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:R_RX_VALID_I" "PF_XCVR_ERM_C1_0:LANE2_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:SCL_I" "SCL_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:VIDEO_DATA_VALID_O" "VIDEO_DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:V_SYNC_O" "V_SYNC_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:AUD_CLK_I" "HDMI_Tx_AUD_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:G_CLK_I" "PF_XCVR_ERM_C1_0:LANE1_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:HPD_I" "HPD_Tx_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:H_SYNC_I" "H_SYNC_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:R_CLK_I" "PF_XCVR_ERM_C1_0:LANE2_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:VIDEO_DATA_VALID_I" "VIDEO_DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:V_SYNC_I" "V_SYNC_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HPD_O" "INV_1:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HPD_Rx_I" "INV_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "PF_XCVR_ERM_C1_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "PF_XCVR_ERM_C1_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "PF_XCVR_ERM_C1_0:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "PF_XCVR_ERM_C1_0:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_N" "PF_XCVR_ERM_C1_0:LANE1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_P" "PF_XCVR_ERM_C1_0:LANE1_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_N" "PF_XCVR_ERM_C1_0:LANE1_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_P" "PF_XCVR_ERM_C1_0:LANE1_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RXD_N" "PF_XCVR_ERM_C1_0:LANE2_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RXD_P" "PF_XCVR_ERM_C1_0:LANE2_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_TXD_N" "PF_XCVR_ERM_C1_0:LANE2_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_TXD_P" "PF_XCVR_ERM_C1_0:LANE2_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RXD_N" "PF_XCVR_ERM_C1_0:LANE3_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RXD_P" "PF_XCVR_ERM_C1_0:LANE3_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_TXD_N" "PF_XCVR_ERM_C1_0:LANE3_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_TXD_P" "PF_XCVR_ERM_C1_0:LANE3_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_ERM_C1_0:LANE0_PCS_ARST_N" "PF_XCVR_ERM_C1_0:LANE0_PMA_ARST_N" "PF_XCVR_ERM_C1_0:LANE1_PCS_ARST_N" "PF_XCVR_ERM_C1_0:LANE1_PMA_ARST_N" "PF_XCVR_ERM_C1_0:LANE2_PCS_ARST_N" "PF_XCVR_ERM_C1_0:LANE2_PMA_ARST_N" "PF_XCVR_ERM_C1_0:LANE3_PCS_ARST_N" "PF_XCVR_ERM_C1_0:LANE3_PMA_ARST_N" "XCVR_INIT_DONE" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACR_CTS" "HDMI_TX_C0_0:ACR_CTS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACR_N" "HDMI_TX_C0_0:ACR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AUDIO_SAMPLE_CH1_O" "HDMI_RX_C0_0:AUDIO_SAMPLE_CH1_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AUDIO_SAMPLE_CH2_O" "HDMI_RX_C0_0:AUDIO_SAMPLE_CH2_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"B_O" "HDMI_RX_C0_0:PIXEL_DATA_O[47:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"G_O" "HDMI_RX_C0_0:PIXEL_DATA_O[95:48]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:DATA_B_I" "PF_XCVR_ERM_C1_0:LANE0_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:DATA_G_I" "PF_XCVR_ERM_C1_0:LANE1_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:DATA_R_I" "PF_XCVR_ERM_C1_0:LANE2_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_0:PIXEL_DATA_O[143:96]" "R_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:PIXEL_DATA_I" "PIXEL_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:TMDS_B_O" "PF_XCVR_ERM_C1_0:LANE0_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:TMDS_G_O" "PF_XCVR_ERM_C1_0:LANE1_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:TMDS_R_O" "PF_XCVR_ERM_C1_0:LANE2_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:VIC_I" "VIC_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:XCVR_LANE_0_DATA_O" "PF_XCVR_ERM_C1_0:LANE3_TX_DATA" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4Lite_Target_IF_HDMI_RX" "HDMI_RX_C0_0:AXI4Lite_Target_IF_HDMI_RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4Lite_Target_IF_HDMI_TX" "HDMI_TX_C0_0:AXI4Lite_Target_IF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4Stream_Target_IF_AUDIO" "HDMI_TX_C0_0:AXI4Stream_Target_IF_AUDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMITX_DEEP_COLOR_PLL_DRI" "HDMI_Clocks_Resets_1:HDMITX_DEEP_COLOR_PLL_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_CDR_PLL0_DRI" "HDMI_Clocks_Resets_1:HDMI_CDR_PLL0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:CLKS_TO_XCVR" "PF_XCVR_ERM_C1_0:CLKS_FROM_TXPLL_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:HDMI_RX_SYS_CLK_PLL_DRI" "HDMI_RX_SYS_CLK_PLL_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Clocks_Resets_1:HDMI_TxPLL_DRI" "HDMI_TxPLL_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_DRI_SLAVE" "PF_XCVR_ERM_C1_0:LANE0_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_DRI_SLAVE" "PF_XCVR_ERM_C1_0:LANE1_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_DRI_SLAVE" "PF_XCVR_ERM_C1_0:LANE2_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_DRI_SLAVE" "PF_XCVR_ERM_C1_0:LANE3_DRI_SLAVE" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "HDMI_Top"
generate_component -component_name ${sd_name}
