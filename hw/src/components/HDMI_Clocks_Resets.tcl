# Creating SmartDesign "HDMI_Clocks_Resets"
set sd_name {HDMI_Clocks_Resets}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_POR_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMIRx_SYS_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI_DRI_ARST_N_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI_DRI_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CABLE_REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CABLE_REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI_DRI_ARST_N_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI_DRI_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI_DRI_ARST_N_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI_DRI_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_Rx_Valid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_Tx_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_Tx_Reset_n} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {JA_FAB_REF_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX_PLL_REF_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Tx_CLK_Stable} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {XCVR_REF_CLK_FAB} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CCC_SYSCLK_HDMIRx_RESET_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CDR_REF_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLKS_TO_XCVR_BIT_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLKS_TO_XCVR_LOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLKS_TO_XCVR_REF_CLK_TO_LANE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMIRx_SYS_CLK_CCC} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI_DRI_INTERRUPT_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CABLE_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI_DRI_INTERRUPT_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI_DRI_INTERRUPT_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_TX_SYS_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_TxPLL_LOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_Tx_Tx_CLK_RESET_n} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_INTERRUPT} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI_DRI_CTRL_0} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI_DRI_WDATA_0} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI_DRI_CTRL_0} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI_DRI_WDATA_0} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI_DRI_CTRL_0} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI_DRI_WDATA_0} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {HDMITX_DEEP_COLOR_PLL_DRI_DRI_RDATA_0} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_CDR_PLL0_DRI_DRI_RDATA_0} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {HDMI_RX_SYS_CLK_PLL_DRI_DRI_RDATA_0} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {HDMI_TxPLL_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:TxPLL_DRI_DRI_CLK" \
"DRI_ARST_N:TxPLL_DRI_DRI_ARST_N" \
"DRI_CTRL:TxPLL_DRI_DRI_CTRL" \
"DRI_RDATA:TxPLL_DRI_DRI_RDATA" \
"DRI_WDATA:TxPLL_DRI_DRI_WDATA" \
"DRI_INTERRUPT:TxPLL_DRI_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {CLKS_TO_XCVR} -port_bif_vlnv {Actel:busdef.clock:PF_TXPLL_XCVR_CLK:1.0} -port_bif_role {master} -port_bif_mapping {\
"LOCK:CLKS_TO_XCVR_LOCK" \
"BIT_CLK:CLKS_TO_XCVR_BIT_CLK" \
"REF_CLK_TO_LANE:CLKS_TO_XCVR_REF_CLK_TO_LANE" } 

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

# Add CORERESET_PF_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C0} -instance_name {CORERESET_PF_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:PLL_POWERDOWN_B}



# Add CORERESET_PF_C0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C0} -instance_name {CORERESET_PF_C0_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_1:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_1:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_1:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_1:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_1:PLL_POWERDOWN_B}



# Add PF_CCC_C2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C2} -instance_name {PF_CCC_C2_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_CCC_C2_0:PLL_LOCK_0}



# Add PF_CCC_HDMI_CDR_REF_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_HDMI_CDR_REF} -instance_name {PF_CCC_HDMI_CDR_REF_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_CCC_HDMI_CDR_REF_0:PLL_LOCK_0}



# Add PF_CCC_HDMIRX_SYS_CLK_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_HDMIRX_SYS_CLK} -instance_name {PF_CCC_HDMIRX_SYS_CLK_0}



# Add PF_TX_PLL_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TX_PLL_C0} -instance_name {PF_TX_PLL_C0_0}



# Add PF_XCVR_REF_CLK_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_REF_CLK_C1} -instance_name {PF_XCVR_REF_CLK_C1_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_SYSCLK_HDMIRx_RESET_N" "CORERESET_PF_C0_1:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CDR_REF_CLK" "PF_CCC_HDMI_CDR_REF_0:OUT0_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:CLK" "HDMI_Tx_CLK" "PF_CCC_C2_0:REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:EXT_RST_N" "HDMI_Tx_Reset_n" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:FABRIC_RESET_N" "HDMI_Tx_Tx_CLK_RESET_n" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:FPGA_POR_N" "CORERESET_PF_C0_1:FPGA_POR_N" "FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:INIT_DONE" "CORERESET_PF_C0_1:INIT_DONE" "INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:PLL_LOCK" "Tx_CLK_Stable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_1:CLK" "HDMIRx_SYS_CLK_CCC" "PF_CCC_HDMIRX_SYS_CLK_0:OUT0_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_1:EXT_RST_N" "HDMI_Rx_Valid" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_1:PLL_LOCK" "PF_CCC_HDMIRX_SYS_CLK_0:PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMIRx_SYS_CLK" "PF_CCC_HDMIRX_SYS_CLK_0:REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_CABLE_CLK" "PF_XCVR_REF_CLK_C1_0:REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_CABLE_REF_CLK_PAD_N" "PF_XCVR_REF_CLK_C1_0:REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_CABLE_REF_CLK_PAD_P" "PF_XCVR_REF_CLK_C1_0:REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_SYS_CLK" "PF_CCC_C2_0:OUT0_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TxPLL_LOCK" "PF_TX_PLL_C0_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"JA_FAB_REF_CLK" "PF_TX_PLL_C0_0:JA_FAB_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_HDMI_CDR_REF_0:REF_CLK_0" "XCVR_REF_CLK_FAB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TX_PLL_C0_0:REF_CLK" "TX_PLL_REF_CLK" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKS_TO_XCVR" "PF_TX_PLL_C0_0:CLKS_TO_XCVR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMITX_DEEP_COLOR_PLL_DRI" "PF_CCC_C2_0:PLL0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_CDR_PLL0_DRI" "PF_CCC_HDMI_CDR_REF_0:PLL0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_SYS_CLK_PLL_DRI" "PF_CCC_HDMIRX_SYS_CLK_0:PLL0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TxPLL_DRI" "PF_TX_PLL_C0_0:TxPLL_DRI" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "HDMI_Clocks_Resets"
generate_component -component_name ${sd_name}
