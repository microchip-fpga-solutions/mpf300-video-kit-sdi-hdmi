# Creating SmartDesign "SDI_Top"
set sd_name {SDI_Top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AUDIO_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AUDIO_DATA_VALID_I} -port_direction {IN}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Stream_Initiator_IF_Audio_TREADY_AUDIO_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EXT_RST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_POR_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_Tx_clk_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {H_SYNC_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_CALIB_REQ} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE_LANE0_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE_LANE0_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Lane_Ref_PLL0_DRI_PLL0_DRI_DRI_ARST_N_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Lane_Ref_PLL0_DRI_PLL0_DRI_DRI_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PIX_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI_DRI_ARST_N_0_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI_DRI_CLK_0_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRESETN_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_135_148p5_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_135_148p5_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_TX_CLK_SEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_Tx_REF_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VIDEO_DATA_VALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {V_SYNC_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {XCVR_INIT_DONE} -port_direction {IN}

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
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Stream_Initiator_IF_Audio_TLAST_AUDIO_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Stream_Initiator_IF_Audio_TVALID_AUDIO_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {H_SYNC_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE_LANE0_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RX_CLK_R} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Lane_Ref_PLL0_DRI_PLL0_DRI_DRI_INTERRUPT_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI_DRI_INTERRUPT_0_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RES_CHANGE_IRQ_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX_ALIGNED_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX_ALIGNMENT_LOST_IRQ_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_Rx_audio_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_TxPLL_LOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VIDEO_DATA_VALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {V_SYNC_O} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AUDIO_DATA_CHANNEL1_I} -port_direction {IN} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AUDIO_DATA_CHANNEL2_I} -port_direction {IN} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_ARADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_AWADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_WDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_ARADDR_I} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_AWADDR_I} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_WDATA_I} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE_LANE0_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE_LANE0_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Lane_Ref_PLL0_DRI_PLL0_DRI_DRI_CTRL_0} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Lane_Ref_PLL0_DRI_PLL0_DRI_DRI_WDATA_0} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI_DRI_CTRL_0_0} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI_DRI_WDATA_0_0} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {VIDEO_DATA_I} -port_direction {IN} -port_range {[143:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_RDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sdirx_RRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_BRESP_O} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_RDATA_O} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Config_sditx_RRESP_O} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Stream_Initiator_IF_Audio_TDATA_AUDIO_O} -port_direction {OUT} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Stream_Initiator_IF_Audio_TID_AUDIO_O} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Stream_Initiator_IF_Audio_TSTRB_AUDIO_O} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Stream_Initiator_IF_Audio_TUSER_AUDIO_O} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE_LANE0_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Lane_Ref_PLL0_DRI_PLL0_DRI_DRI_RDATA_0} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI_DRI_RDATA_0_0} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {VIDEO_DATA_O} -port_direction {OUT} -port_range {[143:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {video_code_o} -port_direction {OUT} -port_range {[7:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:LANE0_DRI_SLAVE_LANE0_DRI_CLK" \
"DRI_ARST_N:LANE0_DRI_SLAVE_LANE0_DRI_ARST_N" \
"DRI_CTRL:LANE0_DRI_SLAVE_LANE0_DRI_CTRL" \
"DRI_RDATA:LANE0_DRI_SLAVE_LANE0_DRI_RDATA" \
"DRI_WDATA:LANE0_DRI_SLAVE_LANE0_DRI_WDATA" \
"DRI_INTERRUPT:LANE0_DRI_SLAVE_LANE0_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {TxPLL_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:TxPLL_DRI_DRI_CLK" \
"DRI_ARST_N:TxPLL_DRI_DRI_ARST_N" \
"DRI_CTRL:TxPLL_DRI_DRI_CTRL" \
"DRI_RDATA:TxPLL_DRI_DRI_RDATA" \
"DRI_WDATA:TxPLL_DRI_DRI_WDATA" \
"DRI_INTERRUPT:TxPLL_DRI_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:PLL_divide1or10_DRI_DRI_CLK_0_0" \
"DRI_ARST_N:PLL_divide1or10_DRI_DRI_ARST_N_0_0" \
"DRI_CTRL:PLL_divide1or10_DRI_DRI_CTRL_0_0" \
"DRI_RDATA:PLL_divide1or10_DRI_DRI_RDATA_0_0" \
"DRI_WDATA:PLL_divide1or10_DRI_DRI_WDATA_0_0" \
"DRI_INTERRUPT:PLL_divide1or10_DRI_DRI_INTERRUPT_0_0" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {Lane_Ref_PLL0_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:Lane_Ref_PLL0_DRI_PLL0_DRI_DRI_CLK_0" \
"DRI_ARST_N:Lane_Ref_PLL0_DRI_PLL0_DRI_DRI_ARST_N_0" \
"DRI_CTRL:Lane_Ref_PLL0_DRI_PLL0_DRI_DRI_CTRL_0" \
"DRI_RDATA:Lane_Ref_PLL0_DRI_PLL0_DRI_DRI_RDATA_0" \
"DRI_WDATA:Lane_Ref_PLL0_DRI_PLL0_DRI_DRI_WDATA_0" \
"DRI_INTERRUPT:Lane_Ref_PLL0_DRI_PLL0_DRI_DRI_INTERRUPT_0" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4Stream_Initiator_IF_Audio} -port_bif_vlnv {AMBA:AMBA4:AXI4Stream:r0p0_1} -port_bif_role {master} -port_bif_mapping {\
"TVALID:AXI4Stream_Initiator_IF_Audio_TVALID_AUDIO_O" \
"TREADY:AXI4Stream_Initiator_IF_Audio_TREADY_AUDIO_I" \
"TDATA:AXI4Stream_Initiator_IF_Audio_TDATA_AUDIO_O" \
"TSTRB:AXI4Stream_Initiator_IF_Audio_TSTRB_AUDIO_O" \
"TLAST:AXI4Stream_Initiator_IF_Audio_TLAST_AUDIO_O" \
"TID:AXI4Stream_Initiator_IF_Audio_TID_AUDIO_O" \
"TUSER:AXI4Stream_Initiator_IF_Audio_TUSER_AUDIO_O" } 

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

# Add AND2_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_1}



# Add PF_XCVR_ERM_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_ERM_C0} -instance_name {PF_XCVR_ERM_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_RX_BYPASS_DATA}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_LOS} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_CALIBRATING}



# Add SDI_Clocks_Resets_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {SDI_Clocks_Resets} -instance_name {SDI_Clocks_Resets_1}



# Add SDI_RX_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {SDI_RX_C0} -instance_name {SDI_RX_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SDI_RX_C0_0:DATA_RATE_O}



# Add SDI_TX_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {SDI_TX_C0} -instance_name {SDI_TX_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SDI_TX_C0_0:VIDEO_DATA_STROBE_I} -value {VCC}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:A" "PF_XCVR_ERM_C0_0:LANE0_RX_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:B" "PF_XCVR_ERM_C0_0:LANE0_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:Y" "SDI_Clocks_Resets_1:Rx_READY" "SDI_RX_C0_0:RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AUDIO_CLK_I" "SDI_TX_C0_0:AUDIO_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AUDIO_DATA_VALID_I" "SDI_TX_C0_0:AUDIO_DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EXT_RST_N" "SDI_Clocks_Resets_1:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FPGA_POR_N" "SDI_Clocks_Resets_1:FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_Tx_clk_I" "SDI_RX_C0_0:PIX_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H_SYNC_I" "SDI_TX_C0_0:H_SYNC_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H_SYNC_O" "SDI_RX_C0_0:H_SYNC_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INIT_DONE" "SDI_Clocks_Resets_1:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_CALIB_REQ" "PF_XCVR_ERM_C0_0:LANE0_CALIB_REQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "PF_XCVR_ERM_C0_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "PF_XCVR_ERM_C0_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RX_CLK_R" "PF_XCVR_ERM_C0_0:LANE0_RX_CLK_G" "SDI_Clocks_Resets_1:SDI_RX_XCVR_CLK" "SDI_RX_C0_0:RX_XCVR_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "PF_XCVR_ERM_C0_0:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "PF_XCVR_ERM_C0_0:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCLK_I" "SDI_RX_C0_0:ACLK_I" "SDI_RX_C0_0:CLK_50MHZ_I" "SDI_TX_C0_0:ACLK_I" "SDI_TX_C0_0:CLK_50MHZ_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_ERM_C0_0:CTRL_ARST_N" "PF_XCVR_ERM_C0_0:LANE0_PCS_ARST_N" "PF_XCVR_ERM_C0_0:LANE0_PMA_ARST_N" "XCVR_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_ERM_C0_0:CTRL_CLK" "SDI_Clocks_Resets_1:PF_CLK_DIV_C0_0_pin_CLK_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_ERM_C0_0:LANE0_CDR_REF_CLK_0" "SDI_Clocks_Resets_1:CDR_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_ERM_C0_0:LANE0_CLK_REF" "SDI_Clocks_Resets_1:Lane0_CLK_REF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_ERM_C0_0:LANE0_TX_CLK_R" "SDI_Clocks_Resets_1:SDI_XCVR_TX_CLK" "SDI_TX_C0_0:XCVR_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_ERM_C0_0:LANE0_TX_CLK_STABLE" "SDI_Clocks_Resets_1:Tx_CLK_Stable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PIX_CLK_I" "SDI_Clocks_Resets_1:SDI_PIX_CLK" "SDI_TX_C0_0:PIX_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PRESETN_I" "SDI_RX_C0_0:ARESETN_I" "SDI_TX_C0_0:ARESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_135_148p5_PAD_N" "SDI_Clocks_Resets_1:REF_CLK_135_148p5_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_135_148p5_PAD_P" "SDI_Clocks_Resets_1:REF_CLK_135_148p5_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RES_CHANGE_IRQ_O" "SDI_TX_C0_0:RES_CHANGE_IRQ_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX_ALIGNED_O" "SDI_RX_C0_0:RATE_LOCKED_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX_ALIGNMENT_LOST_IRQ_O" "SDI_RX_C0_0:RX_ALIGNMENT_LOST_IRQ_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Clocks_Resets_1:SDI_RX_RESET_N" "SDI_RX_C0_0:RX_ARSTN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Clocks_Resets_1:SDI_Rx_divide1or10_CLK" "SDI_RX_C0_0:RX_CLK_I" "SDI_Rx_audio_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Clocks_Resets_1:SDI_TX_CLK" "SDI_TX_C0_0:SDI_TX_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Clocks_Resets_1:SDI_TX_CLK_SEL" "SDI_TX_CLK_SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Clocks_Resets_1:SDI_TX_PLL_REF_CLK" "SDI_Tx_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Clocks_Resets_1:SDI_TX_RESET_N" "SDI_TX_C0_0:RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Clocks_Resets_1:SDI_TxPLL_LOCK" "SDI_TxPLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_RX_C0_0:VIDEO_DATA_VALID_O" "VIDEO_DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_RX_C0_0:V_SYNC_O" "V_SYNC_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_TX_C0_0:VIDEO_DATA_VALID_I" "VIDEO_DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_TX_C0_0:V_SYNC_I" "V_SYNC_I" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AUDIO_DATA_CHANNEL1_I" "SDI_TX_C0_0:AUDIO_DATA_CHANNEL1_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AUDIO_DATA_CHANNEL2_I" "SDI_TX_C0_0:AUDIO_DATA_CHANNEL2_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_ERM_C0_0:LANE0_RX_DATA" "SDI_RX_C0_0:RX_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_ERM_C0_0:LANE0_TX_DATA" "SDI_TX_C0_0:SDI_TX_DATA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_RX_C0_0:VIDEO_CODE_O" "video_code_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_RX_C0_0:VIDEO_DATA_O" "VIDEO_DATA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_TX_C0_0:VIDEO_DATA_I" "VIDEO_DATA_I" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4Lite_Config_sdirx" "SDI_RX_C0_0:AXI4Lite_Config_sdirx" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4Lite_Config_sditx" "SDI_TX_C0_0:AXI4Lite_Config_sditx" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4Stream_Initiator_IF_Audio" "SDI_RX_C0_0:AXI4Stream_Initiator_IF_Audio" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_DRI_SLAVE" "PF_XCVR_ERM_C0_0:LANE0_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Lane_Ref_PLL0_DRI" "SDI_Clocks_Resets_1:Lane_Ref_PLL0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_ERM_C0_0:CLKS_FROM_TXPLL_0" "SDI_Clocks_Resets_1:PF_TX_PLL_C1_0_pin_CLKS_TO_XCVR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PLL_divide1or10_DRI" "SDI_Clocks_Resets_1:PLL_divide1or10_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_Clocks_Resets_1:PF_TX_PLL_C1_0_pin_TxPLL_DRI" "TxPLL_DRI" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "SDI_Top"
generate_component -component_name ${sd_name}
