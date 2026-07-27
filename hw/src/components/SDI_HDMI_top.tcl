# Creating SmartDesign "SDI_HDMI_top"
set sd_name {SDI_HDMI_top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACR_VALID_IN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBS_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBS_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBS_PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_ARVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_AWVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_BREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_RREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_WVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_ARVALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_AWVALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_BREADY_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_RREADY_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_WVALID_I} -port_direction {IN}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_POR_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CABLE_REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CABLE_REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_RESETN_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_XCVR_REF_CLK_FAB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HPD_Rx_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HPD_Tx_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_CALIB_REQ} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRESETN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_150M_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_135_148p5_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_135_148p5_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_150M_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SCL_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_RST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_TX_CLK_SEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Tx_PLL_REF_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {XCVR_INIT_DONE} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APBS_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBS_PSLVERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_ARREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_AWREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_BVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_RVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_WREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_ARREADY_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_AWREADY_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_BVALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_RVALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_WREADY_O} -port_direction {OUT}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_RATE_INT_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_TxPLL_LOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HPD_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RES_CHANGE_IRQ_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX_ALIGNED_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX_ALIGNMENT_LOST_IRQ_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_TxPLL_LOCK} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {SDA} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {ACR_CTS} -port_direction {IN} -port_range {[19:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {ACR_N} -port_direction {IN} -port_range {[19:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBS_PADDR} -port_direction {IN} -port_range {[28:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBS_PWDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_ARADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_AWADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_WDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_ARADDR_I} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_AWADDR_I} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_WDATA_I} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {conversion_sel_i} -port_direction {IN} -port_range {[1:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APBS_PRDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_RDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_RRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_BRESP_O} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_RDATA_O} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_RRESP_O} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_RX_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_HDMI_TX_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {video_code_o} -port_direction {OUT} -port_range {[7:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4Lite_Config_sdirx_AWADDR" \
"AWVALID:AXI4Lite_Config_sdirx_AWVALID" \
"AWREADY:AXI4Lite_Config_sdirx_AWREADY" \
"WDATA:AXI4Lite_Config_sdirx_WDATA" \
"WVALID:AXI4Lite_Config_sdirx_WVALID" \
"WREADY:AXI4Lite_Config_sdirx_WREADY" \
"BRESP:AXI4Lite_Config_sdirx_BRESP" \
"BVALID:AXI4Lite_Config_sdirx_BVALID" \
"BREADY:AXI4Lite_Config_sdirx_BREADY" \
"ARADDR:AXI4Lite_Config_sdirx_ARADDR" \
"ARVALID:AXI4Lite_Config_sdirx_ARVALID" \
"ARREADY:AXI4Lite_Config_sdirx_ARREADY" \
"RDATA:AXI4Lite_Config_sdirx_RDATA" \
"RRESP:AXI4Lite_Config_sdirx_RRESP" \
"RVALID:AXI4Lite_Config_sdirx_RVALID" \
"RREADY:AXI4Lite_Config_sdirx_RREADY" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4Lite_Config_sditx_AWADDR_I" \
"AWVALID:AXI4Lite_Config_sditx_AWVALID_I" \
"AWREADY:AXI4Lite_Config_sditx_AWREADY_O" \
"WDATA:AXI4Lite_Config_sditx_WDATA_I" \
"WVALID:AXI4Lite_Config_sditx_WVALID_I" \
"WREADY:AXI4Lite_Config_sditx_WREADY_O" \
"BRESP:AXI4Lite_Config_sditx_BRESP_O" \
"BVALID:AXI4Lite_Config_sditx_BVALID_O" \
"BREADY:AXI4Lite_Config_sditx_BREADY_I" \
"ARADDR:AXI4Lite_Config_sditx_ARADDR_I" \
"ARVALID:AXI4Lite_Config_sditx_ARVALID_I" \
"ARREADY:AXI4Lite_Config_sditx_ARREADY_O" \
"RDATA:AXI4Lite_Config_sditx_RDATA_O" \
"RRESP:AXI4Lite_Config_sditx_RRESP_O" \
"RVALID:AXI4Lite_Config_sditx_RVALID_O" \
"RREADY:AXI4Lite_Config_sditx_RREADY_I" } 

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

sd_create_bif_port -sd_name ${sd_name} -port_name {APBS} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"PADDR:APBS_PADDR" \
"PSELx:APBS_PSEL" \
"PENABLE:APBS_PENABLE" \
"PWRITE:APBS_PWRITE" \
"PRDATA:APBS_PRDATA" \
"PWDATA:APBS_PWDATA" \
"PREADY:APBS_PREADY" \
"PSLVERR:APBS_PSLVERR" } 

# Add color_conversion_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {color_conversion} -instance_name {color_conversion_1}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {color_conversion_1:PIXEL_DATA_I} -pin_slices {[143:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {color_conversion_1:PIXEL_DATA_I} -pin_slices {[47:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {color_conversion_1:PIXEL_DATA_I} -pin_slices {[95:48]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {color_conversion_1:PIXEL_DATA_O} -pin_slices {[143:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {color_conversion_1:PIXEL_DATA_O} -pin_slices {[47:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {color_conversion_1:PIXEL_DATA_O} -pin_slices {[95:48]}



# Add HDMI_Top_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {HDMI_Top} -instance_name {HDMI_Top_0}



# Add PF_DRI_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_DRI_C0} -instance_name {PF_DRI_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DRI_C0_0:PINTERRUPT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DRI_C0_0:PTIMEOUT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DRI_C0_0:BUSERROR}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_DRI_C0_0:PSTRB} -value {VCC}



# Add SDI_Top_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {SDI_Top} -instance_name {SDI_Top_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {SDI_Top_0:VIDEO_DATA_I} -pin_slices {[143:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {SDI_Top_0:VIDEO_DATA_I} -pin_slices {[47:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {SDI_Top_0:VIDEO_DATA_I} -pin_slices {[95:48]}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACR_VALID_IN" "HDMI_Top_0:ACR_VALID_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_RATE_INT_O" "HDMI_Top_0:DATA_RATE_INT_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FPGA_POR_N" "HDMI_Top_0:FPGA_POR_N" "SDI_Top_0:FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_CABLE_REF_CLK_PAD_N" "HDMI_Top_0:HDMI_CABLE_REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_CABLE_REF_CLK_PAD_P" "HDMI_Top_0:HDMI_CABLE_REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RESETN_I" "HDMI_Top_0:HDMI_Resetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:ACLK_I" "PCLK" "PF_DRI_C0_0:PCLK" "SDI_Top_0:PCLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:ARESETN_I" "PF_DRI_C0_0:PRESETN" "PRESETN" "SDI_Top_0:PRESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:AUDIO_DATA_VALID_O" "SDI_Top_0:AUDIO_DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HDMIRx_RESET_N" "color_conversion_1:RESET_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HDMIRx_SYS_CLK_CCC" "SDI_Top_0:PIX_CLK_I" "color_conversion_1:CLOCK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HDMI_RX_CLK_B" "SDI_Top_0:AUDIO_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HDMI_TX_CLK" "SDI_Top_0:HDMI_Tx_clk_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HDMI_TxPLL_LOCK" "HDMI_TxPLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HDMI_Tx_AUD_CLK_I" "SDI_Top_0:SDI_Rx_audio_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HPD_O" "HPD_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HPD_Rx_I" "HPD_Rx_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HPD_Tx_I" "HPD_Tx_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:H_SYNC_I" "SDI_Top_0:H_SYNC_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:H_SYNC_O" "SDI_Top_0:H_SYNC_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:INIT_DONE" "INIT_DONE" "SDI_Top_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:JA_FAB_REF_CLK" "SDI_Top_0:LANE0_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE0_RXD_N" "LANE0_RXD_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE0_RXD_P" "LANE0_RXD_P_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE0_TXD_N" "LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE0_TXD_P" "LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE1_RXD_N" "LANE1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE1_RXD_P" "LANE1_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE1_TXD_N" "LANE1_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE1_TXD_P" "LANE1_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE2_RXD_N" "LANE2_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE2_RXD_P" "LANE2_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE2_TXD_N" "LANE2_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE2_TXD_P" "LANE2_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE3_RXD_N" "LANE3_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE3_RXD_P" "LANE3_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE3_TXD_N" "LANE3_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE3_TXD_P" "LANE3_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:REF_150M_CLK_I" "REF_150M_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:REF_CLK" "SDI_Top_0:SDI_Tx_REF_CLK" "Tx_PLL_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:RESETN_150M_I" "RESETN_150M_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:SCL_I" "SCL_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:SDA" "SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:VIDEO_DATA_VALID_I" "SDI_Top_0:VIDEO_DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:VIDEO_DATA_VALID_O" "color_conversion_1:DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:V_SYNC_I" "SDI_Top_0:V_SYNC_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:V_SYNC_O" "SDI_Top_0:V_SYNC_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:XCVR_INIT_DONE" "SDI_Top_0:XCVR_INIT_DONE" "XCVR_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:XCVR_REF_CLK_FAB" "HDMI_XCVR_REF_CLK_FAB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_CALIB_REQ" "SDI_Top_0:LANE0_CALIB_REQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "SDI_Top_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "SDI_Top_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N_0" "SDI_Top_0:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P_0" "SDI_Top_0:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_135_148p5_PAD_N" "SDI_Top_0:REF_CLK_135_148p5_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_135_148p5_PAD_P" "SDI_Top_0:REF_CLK_135_148p5_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RES_CHANGE_IRQ_O" "SDI_Top_0:RES_CHANGE_IRQ_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX_ALIGNED_O" "SDI_Top_0:RX_ALIGNED_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX_ALIGNMENT_LOST_IRQ_O" "SDI_Top_0:RX_ALIGNMENT_LOST_IRQ_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_RST_N" "SDI_Top_0:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_TX_CLK_SEL" "SDI_Top_0:SDI_TX_CLK_SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Top_0:SDI_TxPLL_LOCK" "SDI_TxPLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Top_0:VIDEO_DATA_VALID_I" "color_conversion_1:DATA_VALID_O" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACR_CTS" "HDMI_Top_0:ACR_CTS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACR_N" "HDMI_Top_0:ACR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:AUDIO_SAMPLE_CH1_O" "SDI_Top_0:AUDIO_DATA_CHANNEL1_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:AUDIO_SAMPLE_CH2_O" "SDI_Top_0:AUDIO_DATA_CHANNEL2_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:B_O" "color_conversion_1:PIXEL_DATA_I[47:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:G_O" "color_conversion_1:PIXEL_DATA_I[95:48]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:PIXEL_DATA_I" "SDI_Top_0:VIDEO_DATA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:R_O" "color_conversion_1:PIXEL_DATA_I[143:96]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:VIC_I" "SDI_Top_0:video_code_o" "video_code_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Top_0:VIDEO_DATA_I[143:96]" "color_conversion_1:PIXEL_DATA_O[143:96]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Top_0:VIDEO_DATA_I[47:0]" "color_conversion_1:PIXEL_DATA_O[47:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Top_0:VIDEO_DATA_I[95:48]" "color_conversion_1:PIXEL_DATA_O[95:48]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"color_conversion_1:conversion_sel_i" "conversion_sel_i" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APBS" "PF_DRI_C0_0:APBS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4Lite_Config_sdirx" "SDI_Top_0:AXI4Lite_Config_sdirx" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4Lite_Config_sditx" "SDI_Top_0:AXI4Lite_Config_sditx" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4Lite_Target_IF_HDMI_RX" "HDMI_Top_0:AXI4Lite_Target_IF_HDMI_RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4Lite_Target_IF_HDMI_TX" "HDMI_Top_0:AXI4Lite_Target_IF_HDMI_TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:AXI4Stream_Target_IF_AUDIO" "SDI_Top_0:AXI4Stream_Initiator_IF_Audio" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HDMITX_DEEP_COLOR_PLL_DRI" "PF_DRI_C0_0:PLL1_NE_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HDMI_CDR_PLL0_DRI" "PF_DRI_C0_0:PLL1_SW_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HDMI_RX_SYS_CLK_PLL_DRI" "PF_DRI_C0_0:PLL0_NE_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:HDMI_TxPLL_DRI" "PF_DRI_C0_0:Q2_TXPLL_SSC_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE0_DRI_SLAVE" "PF_DRI_C0_0:Q2_LANE0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE1_DRI_SLAVE" "PF_DRI_C0_0:Q2_LANE1_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE2_DRI_SLAVE" "PF_DRI_C0_0:Q2_LANE2_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Top_0:LANE3_DRI_SLAVE" "PF_DRI_C0_0:Q2_LANE3_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DRI_C0_0:PLL0_NW_DRI" "SDI_Top_0:PLL_divide1or10_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DRI_C0_0:PLL1_SE_DRI" "SDI_Top_0:Lane_Ref_PLL0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DRI_C0_0:Q1_LANE0_DRI" "SDI_Top_0:LANE0_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DRI_C0_0:Q1_TXPLL_SSC_DRI" "SDI_Top_0:TxPLL_DRI" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "SDI_HDMI_top"
generate_component -component_name ${sd_name}
