# Creating SmartDesign "SDI_Clocks_Resets"
set sd_name {SDI_Clocks_Resets}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {EXT_RST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_POR_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL0_DRI_DRI_ARST_N_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL0_DRI_DRI_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI_DRI_ARST_N_0_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI_DRI_CLK_0_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_135_148p5_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_135_148p5_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Rx_READY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_PIX_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_RX_XCVR_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_TX_CLK_SEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_TX_PLL_REF_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_XCVR_TX_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Tx_CLK_Stable} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CDR_REF_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLKS_TO_XCVR_BIT_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLKS_TO_XCVR_LOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLKS_TO_XCVR_REF_CLK_TO_LANE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Lane0_CLK_REF} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PF_CLK_DIV_C0_0_pin_CLK_OUT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL0_DRI_DRI_INTERRUPT_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI_DRI_INTERRUPT_0_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_RX_RESET_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_Rx_divide1or10_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_TX_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_TX_RESET_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_TxPLL_LOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_INTERRUPT} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {PLL0_DRI_DRI_CTRL_0} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PLL0_DRI_DRI_WDATA_0} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI_DRI_CTRL_0_0} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI_DRI_WDATA_0_0} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {PLL0_DRI_DRI_RDATA_0} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI_DRI_RDATA_0_0} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TxPLL_DRI_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {PF_TX_PLL_C1_0_pin_TxPLL_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:TxPLL_DRI_DRI_CLK" \
"DRI_ARST_N:TxPLL_DRI_DRI_ARST_N" \
"DRI_CTRL:TxPLL_DRI_DRI_CTRL" \
"DRI_RDATA:TxPLL_DRI_DRI_RDATA" \
"DRI_WDATA:TxPLL_DRI_DRI_WDATA" \
"DRI_INTERRUPT:TxPLL_DRI_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {PF_TX_PLL_C1_0_pin_CLKS_TO_XCVR} -port_bif_vlnv {Actel:busdef.clock:PF_TXPLL_XCVR_CLK:1.0} -port_bif_role {master} -port_bif_mapping {\
"LOCK:CLKS_TO_XCVR_LOCK" \
"BIT_CLK:CLKS_TO_XCVR_BIT_CLK" \
"REF_CLK_TO_LANE:CLKS_TO_XCVR_REF_CLK_TO_LANE" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {PLL_divide1or10_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:PLL_divide1or10_DRI_DRI_CLK_0_0" \
"DRI_ARST_N:PLL_divide1or10_DRI_DRI_ARST_N_0_0" \
"DRI_CTRL:PLL_divide1or10_DRI_DRI_CTRL_0_0" \
"DRI_RDATA:PLL_divide1or10_DRI_DRI_RDATA_0_0" \
"DRI_WDATA:PLL_divide1or10_DRI_DRI_WDATA_0_0" \
"DRI_INTERRUPT:PLL_divide1or10_DRI_DRI_INTERRUPT_0_0" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {Lane_Ref_PLL0_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:PLL0_DRI_DRI_CLK_0" \
"DRI_ARST_N:PLL0_DRI_DRI_ARST_N_0" \
"DRI_CTRL:PLL0_DRI_DRI_CTRL_0" \
"DRI_RDATA:PLL0_DRI_DRI_RDATA_0" \
"DRI_WDATA:PLL0_DRI_DRI_WDATA_0" \
"DRI_INTERRUPT:PLL0_DRI_DRI_INTERRUPT_0" } 

# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



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



# Add PF_CCC_divide10_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_divide10} -instance_name {PF_CCC_divide10_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_CCC_divide10_0:PLL_LOCK_0}



# Add PF_CCC_divide_1or10_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_divide_1or10} -instance_name {PF_CCC_divide_1or10_0}



# Add PF_CCC_SDI_XCVR_CLK_REF instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_SDI_XCVR_CLK_REF} -instance_name {PF_CCC_SDI_XCVR_CLK_REF_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_CCC_SDI_XCVR_CLK_REF_0:PLL_LOCK_0}



# Add PF_CLK_DIV_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CLK_DIV_C0} -instance_name {PF_CLK_DIV_C0_0}



# Add PF_NGMUX_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_NGMUX_C0} -instance_name {PF_NGMUX_C0_0}



# Add PF_OSC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_OSC_C0} -instance_name {PF_OSC_C0_0}



# Add PF_TX_PLL_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TX_PLL_C1} -instance_name {PF_TX_PLL_C1_0}



# Add PF_XCVR_REF_CLK_135MHz_148p5MHz_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_REF_CLK_C0} -instance_name {PF_XCVR_REF_CLK_135MHz_148p5MHz_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "PF_CCC_divide_1or10_0:PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "Rx_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "CORERESET_PF_C0_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CDR_REF_CLK" "PF_CCC_SDI_XCVR_CLK_REF_0:REF_CLK_0" "PF_XCVR_REF_CLK_135MHz_148p5MHz_0:REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:CLK" "PF_CCC_divide_1or10_0:REF_CLK_0" "SDI_RX_XCVR_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:EXT_RST_N" "EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:FABRIC_RESET_N" "SDI_RX_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:FPGA_POR_N" "CORERESET_PF_C0_1:FPGA_POR_N" "FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:INIT_DONE" "CORERESET_PF_C0_1:INIT_DONE" "INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_1:CLK" "PF_TX_PLL_C1_0:JA_FAB_REF_CLK" "SDI_PIX_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_1:EXT_RST_N" "Tx_CLK_Stable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_1:FABRIC_RESET_N" "SDI_TX_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_1:PLL_LOCK" "PF_TX_PLL_C1_0:PLL_LOCK" "SDI_TxPLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Lane0_CLK_REF" "PF_CCC_SDI_XCVR_CLK_REF_0:OUT0_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_divide10_0:OUT0_FABCLK_0" "PF_NGMUX_C0_0:CLK1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_divide10_0:REF_CLK_0" "PF_NGMUX_C0_0:CLK0" "SDI_XCVR_TX_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_divide_1or10_0:OUT0_FABCLK_0" "SDI_Rx_divide1or10_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CLK_DIV_C0_0:CLK_IN" "PF_OSC_C0_0:RCOSC_160MHZ_CLK_DIV" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CLK_DIV_C0_0:CLK_OUT" "PF_CLK_DIV_C0_0_pin_CLK_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_NGMUX_C0_0:CLK_OUT" "SDI_TX_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_NGMUX_C0_0:SEL" "SDI_TX_CLK_SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TX_PLL_C1_0:REF_CLK" "SDI_TX_PLL_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_135MHz_148p5MHz_0:REF_CLK_PAD_N" "REF_CLK_135_148p5_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_135MHz_148p5MHz_0:REF_CLK_PAD_P" "REF_CLK_135_148p5_PAD_P" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Lane_Ref_PLL0_DRI" "PF_CCC_SDI_XCVR_CLK_REF_0:PLL0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_divide_1or10_0:PLL0_DRI" "PLL_divide1or10_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TX_PLL_C1_0:CLKS_TO_XCVR" "PF_TX_PLL_C1_0_pin_CLKS_TO_XCVR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TX_PLL_C1_0:TxPLL_DRI" "PF_TX_PLL_C1_0_pin_TxPLL_DRI" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "SDI_Clocks_Resets"
generate_component -component_name ${sd_name}
