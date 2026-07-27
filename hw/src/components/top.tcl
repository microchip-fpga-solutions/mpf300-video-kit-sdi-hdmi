# Creating SmartDesign "top"
set sd_name {top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CABLE_REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CABLE_REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HPD_HDMITx} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HPD_Rx_I} -port_direction {IN}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_135_148p5_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_135_148p5_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SCL_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {FMC_135or148p5MHz_CLK_SEL} -port_direction {OUT}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED2_SDI_TxPLL_LOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED3_HDMI_TxPLL_LOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED4_SDI_Rx_Alignment} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_DIVEN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_DIVMR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_SELB0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_SELB1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDO1_DISABLE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISCLKO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISS_Reclocker} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISS_RxDriverReclkr} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISS_TxDriver} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_TX_O} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDA} -port_direction {INOUT} -port_is_pad {1}


sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SDI_DIVEN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SDI_DIVMR} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SDI_SELB0} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SDI_SELB1} -value {GND}
# Add audio_cts_mapper_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {audio_cts_mapper} -hdl_file {hdl\audio_cts_mapper.v} -instance_name {audio_cts_mapper_0}



# Add clocks_and_reset_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {clocks_and_reset} -instance_name {clocks_and_reset_1}



# Add PROC_SUB_SYSTEM_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PROC_SUB_SYSTEM} -instance_name {PROC_SUB_SYSTEM_0}



# Add SDI_HDMI_top_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {SDI_HDMI_top} -instance_name {SDI_HDMI_top_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SDI_HDMI_top_0:ACR_VALID_IN} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SDI_HDMI_top_0:ACR_N} -value {00000001100000000000}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"FMC_135or148p5MHz_CLK_SEL" "PROC_SUB_SYSTEM_0:CLK_SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_CABLE_REF_CLK_PAD_N" "SDI_HDMI_top_0:HDMI_CABLE_REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_CABLE_REF_CLK_PAD_P" "SDI_HDMI_top_0:HDMI_CABLE_REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_SCL" "PROC_SUB_SYSTEM_0:HDMI_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_SDA" "PROC_SUB_SYSTEM_0:HDMI_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HPD_HDMITx" "PROC_SUB_SYSTEM_0:HPD_HDMITx" "SDI_HDMI_top_0:HPD_Tx_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HPD_O" "SDI_HDMI_top_0:HPD_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HPD_Rx_I" "SDI_HDMI_top_0:HPD_Rx_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "SDI_HDMI_top_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N_0" "SDI_HDMI_top_0:LANE0_RXD_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "SDI_HDMI_top_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P_0" "SDI_HDMI_top_0:LANE0_RXD_P_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "SDI_HDMI_top_0:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N_0" "SDI_HDMI_top_0:LANE0_TXD_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "SDI_HDMI_top_0:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P_0" "SDI_HDMI_top_0:LANE0_TXD_P_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_N" "SDI_HDMI_top_0:LANE1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_P" "SDI_HDMI_top_0:LANE1_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_N" "SDI_HDMI_top_0:LANE1_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_P" "SDI_HDMI_top_0:LANE1_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RXD_N" "SDI_HDMI_top_0:LANE2_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RXD_P" "SDI_HDMI_top_0:LANE2_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_TXD_N" "SDI_HDMI_top_0:LANE2_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_TXD_P" "SDI_HDMI_top_0:LANE2_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RXD_N" "SDI_HDMI_top_0:LANE3_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RXD_P" "SDI_HDMI_top_0:LANE3_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_TXD_N" "SDI_HDMI_top_0:LANE3_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_TXD_P" "SDI_HDMI_top_0:LANE3_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED1" "PROC_SUB_SYSTEM_0:LED1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED2_SDI_TxPLL_LOCK" "SDI_HDMI_top_0:SDI_TxPLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED3_HDMI_TxPLL_LOCK" "SDI_HDMI_top_0:HDMI_TxPLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED4_SDI_Rx_Alignment" "SDI_HDMI_top_0:RX_ALIGNED_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:MSYS_EI" "SDI_HDMI_top_0:DATA_RATE_INT_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:PCLK" "SDI_HDMI_top_0:PCLK" "clocks_and_reset_1:CLK_50MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:RESETN" "SDI_HDMI_top_0:PRESETN" "SDI_HDMI_top_0:RESETN_150M_I" "clocks_and_reset_1:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:SDIRx_INT" "SDI_HDMI_top_0:RX_ALIGNMENT_LOST_IRQ_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:SDI_TX_CLK_SEL" "SDI_HDMI_top_0:SDI_TX_CLK_SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:SDI_Tx_IRQ" "SDI_HDMI_top_0:RES_CHANGE_IRQ_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:SDO1_DISABLE" "SDO1_DISABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:SPISCLKO" "SPISCLKO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:SPISDI" "SPISDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:SPISDO" "SPISDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:SPISS_Reclocker" "SPISS_Reclocker" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:SPISS_RxDriverReclkr" "SPISS_RxDriverReclkr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:SPISS_TxDriver" "SPISS_TxDriver" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:UART_TX_O" "UART_TX_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:fractional_frame_rate" "audio_cts_mapper_0:FRACTIONAL_FRAME_RATE_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:frame_rate_60fps_30fps" "audio_cts_mapper_0:FRAME_RATE_60FPS_30FPS_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:hdmi_resetn" "SDI_HDMI_top_0:HDMI_RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:sdi_resetn" "SDI_HDMI_top_0:SDI_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:sdi_xcvr_calib_req" "SDI_HDMI_top_0:LANE0_CALIB_REQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_135_148p5_PAD_N" "SDI_HDMI_top_0:REF_CLK_135_148p5_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_135_148p5_PAD_P" "SDI_HDMI_top_0:REF_CLK_135_148p5_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_N" "clocks_and_reset_1:REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_P" "clocks_and_reset_1:REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SCL_I" "SDI_HDMI_top_0:SCL_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDA" "SDI_HDMI_top_0:SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_HDMI_top_0:FPGA_POR_N" "clocks_and_reset_1:FABRIC_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_HDMI_top_0:HDMI_XCVR_REF_CLK_FAB" "clocks_and_reset_1:XCVR_FAB_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_HDMI_top_0:INIT_DONE" "clocks_and_reset_1:DEVICE_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_HDMI_top_0:REF_150M_CLK_I" "clocks_and_reset_1:CLK_150MHZ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_HDMI_top_0:Tx_PLL_REF_CLK" "clocks_and_reset_1:Tx_PLL_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_HDMI_top_0:XCVR_INIT_DONE" "clocks_and_reset_1:XCVR_INIT_DONE" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:GPIO_OUT" "SDI_HDMI_top_0:conversion_sel_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_HDMI_top_0:ACR_CTS" "audio_cts_mapper_0:CTS_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SDI_HDMI_top_0:video_code_o" "audio_cts_mapper_0:VIDEO_CODE_I" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:APB_INITIATOR" "SDI_HDMI_top_0:APBS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:AXI4mslave0" "SDI_HDMI_top_0:AXI4Lite_Target_IF_HDMI_TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:AXI4mslave2" "SDI_HDMI_top_0:AXI4Lite_Target_IF_HDMI_RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:AXI4mslave3" "SDI_HDMI_top_0:AXI4Lite_Config_sditx" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUB_SYSTEM_0:AXI4mslave4" "SDI_HDMI_top_0:AXI4Lite_Config_sdirx" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "top"
generate_component -component_name ${sd_name}
