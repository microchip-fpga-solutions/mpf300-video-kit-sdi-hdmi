# Creating SmartDesign "PROC_SUB_SYSTEM"
set sd_name {PROC_SUB_SYSTEM}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PSLVERR} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HPD_HDMITx} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSYS_EI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDIRx_INT} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_Tx_IRQ} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PENABLE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PSEL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PWRITE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_SEL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDI_TX_CLK_SEL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDO1_DISABLE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISCLKO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISS_Reclocker} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISS_RxDriverReclkr} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISS_TxDriver} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_TX_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {fractional_frame_rate} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_rate_60fps_30fps} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {hdmi_resetn} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {sdi_resetn} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {sdi_xcvr_calib_req} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SDA} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PRDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BID} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RID} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_BID} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_RDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_RID} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_BID} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_RDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_RID} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_BID} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_RDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_RID} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_RUSER} -port_direction {IN} -port_range {[0:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PWDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARID} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWID} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WSTRB} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARID} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWID} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_WDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_WSTRB} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave2_SLAVE2_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARID} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWID} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_WDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_WSTRB} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave3_SLAVE3_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARID} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWID} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_WDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_WSTRB} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave4_SLAVE4_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OUT} -port_direction {OUT} -port_range {[2:1]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APB_INITIATOR} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {master} -port_bif_mapping {\
"PADDR:APB_INITIATOR_APB_PADDR" \
"PSELx:APB_INITIATOR_APB_PSEL" \
"PENABLE:APB_INITIATOR_APB_PENABLE" \
"PWRITE:APB_INITIATOR_APB_PWRITE" \
"PRDATA:APB_INITIATOR_APB_PRDATA" \
"PWDATA:APB_INITIATOR_APB_PWDATA" \
"PREADY:APB_INITIATOR_APB_PREADY" \
"PSLVERR:APB_INITIATOR_APB_PSLVERR" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4mslave0} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4mslave0_SLAVE0_AWID" \
"AWADDR:AXI4mslave0_SLAVE0_AWADDR" \
"AWLEN:AXI4mslave0_SLAVE0_AWLEN" \
"AWSIZE:AXI4mslave0_SLAVE0_AWSIZE" \
"AWBURST:AXI4mslave0_SLAVE0_AWBURST" \
"AWLOCK:AXI4mslave0_SLAVE0_AWLOCK" \
"AWCACHE:AXI4mslave0_SLAVE0_AWCACHE" \
"AWPROT:AXI4mslave0_SLAVE0_AWPROT" \
"AWQOS:AXI4mslave0_SLAVE0_AWQOS" \
"AWREGION:AXI4mslave0_SLAVE0_AWREGION" \
"AWVALID:AXI4mslave0_SLAVE0_AWVALID" \
"AWREADY:AXI4mslave0_SLAVE0_AWREADY" \
"WDATA:AXI4mslave0_SLAVE0_WDATA" \
"WSTRB:AXI4mslave0_SLAVE0_WSTRB" \
"WLAST:AXI4mslave0_SLAVE0_WLAST" \
"WVALID:AXI4mslave0_SLAVE0_WVALID" \
"WREADY:AXI4mslave0_SLAVE0_WREADY" \
"BID:AXI4mslave0_SLAVE0_BID" \
"BRESP:AXI4mslave0_SLAVE0_BRESP" \
"BVALID:AXI4mslave0_SLAVE0_BVALID" \
"BREADY:AXI4mslave0_SLAVE0_BREADY" \
"ARID:AXI4mslave0_SLAVE0_ARID" \
"ARADDR:AXI4mslave0_SLAVE0_ARADDR" \
"ARLEN:AXI4mslave0_SLAVE0_ARLEN" \
"ARSIZE:AXI4mslave0_SLAVE0_ARSIZE" \
"ARBURST:AXI4mslave0_SLAVE0_ARBURST" \
"ARLOCK:AXI4mslave0_SLAVE0_ARLOCK" \
"ARCACHE:AXI4mslave0_SLAVE0_ARCACHE" \
"ARPROT:AXI4mslave0_SLAVE0_ARPROT" \
"ARQOS:AXI4mslave0_SLAVE0_ARQOS" \
"ARREGION:AXI4mslave0_SLAVE0_ARREGION" \
"ARVALID:AXI4mslave0_SLAVE0_ARVALID" \
"ARREADY:AXI4mslave0_SLAVE0_ARREADY" \
"RID:AXI4mslave0_SLAVE0_RID" \
"RDATA:AXI4mslave0_SLAVE0_RDATA" \
"RRESP:AXI4mslave0_SLAVE0_RRESP" \
"RLAST:AXI4mslave0_SLAVE0_RLAST" \
"RVALID:AXI4mslave0_SLAVE0_RVALID" \
"RREADY:AXI4mslave0_SLAVE0_RREADY" \
"AWUSER:AXI4mslave0_SLAVE0_AWUSER" \
"WUSER:AXI4mslave0_SLAVE0_WUSER" \
"BUSER:AXI4mslave0_SLAVE0_BUSER" \
"ARUSER:AXI4mslave0_SLAVE0_ARUSER" \
"RUSER:AXI4mslave0_SLAVE0_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4mslave2} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4mslave2_SLAVE2_AWID" \
"AWADDR:AXI4mslave2_SLAVE2_AWADDR" \
"AWLEN:AXI4mslave2_SLAVE2_AWLEN" \
"AWSIZE:AXI4mslave2_SLAVE2_AWSIZE" \
"AWBURST:AXI4mslave2_SLAVE2_AWBURST" \
"AWLOCK:AXI4mslave2_SLAVE2_AWLOCK" \
"AWCACHE:AXI4mslave2_SLAVE2_AWCACHE" \
"AWPROT:AXI4mslave2_SLAVE2_AWPROT" \
"AWQOS:AXI4mslave2_SLAVE2_AWQOS" \
"AWREGION:AXI4mslave2_SLAVE2_AWREGION" \
"AWVALID:AXI4mslave2_SLAVE2_AWVALID" \
"AWREADY:AXI4mslave2_SLAVE2_AWREADY" \
"WDATA:AXI4mslave2_SLAVE2_WDATA" \
"WSTRB:AXI4mslave2_SLAVE2_WSTRB" \
"WLAST:AXI4mslave2_SLAVE2_WLAST" \
"WVALID:AXI4mslave2_SLAVE2_WVALID" \
"WREADY:AXI4mslave2_SLAVE2_WREADY" \
"BID:AXI4mslave2_SLAVE2_BID" \
"BRESP:AXI4mslave2_SLAVE2_BRESP" \
"BVALID:AXI4mslave2_SLAVE2_BVALID" \
"BREADY:AXI4mslave2_SLAVE2_BREADY" \
"ARID:AXI4mslave2_SLAVE2_ARID" \
"ARADDR:AXI4mslave2_SLAVE2_ARADDR" \
"ARLEN:AXI4mslave2_SLAVE2_ARLEN" \
"ARSIZE:AXI4mslave2_SLAVE2_ARSIZE" \
"ARBURST:AXI4mslave2_SLAVE2_ARBURST" \
"ARLOCK:AXI4mslave2_SLAVE2_ARLOCK" \
"ARCACHE:AXI4mslave2_SLAVE2_ARCACHE" \
"ARPROT:AXI4mslave2_SLAVE2_ARPROT" \
"ARQOS:AXI4mslave2_SLAVE2_ARQOS" \
"ARREGION:AXI4mslave2_SLAVE2_ARREGION" \
"ARVALID:AXI4mslave2_SLAVE2_ARVALID" \
"ARREADY:AXI4mslave2_SLAVE2_ARREADY" \
"RID:AXI4mslave2_SLAVE2_RID" \
"RDATA:AXI4mslave2_SLAVE2_RDATA" \
"RRESP:AXI4mslave2_SLAVE2_RRESP" \
"RLAST:AXI4mslave2_SLAVE2_RLAST" \
"RVALID:AXI4mslave2_SLAVE2_RVALID" \
"RREADY:AXI4mslave2_SLAVE2_RREADY" \
"AWUSER:AXI4mslave2_SLAVE2_AWUSER" \
"WUSER:AXI4mslave2_SLAVE2_WUSER" \
"BUSER:AXI4mslave2_SLAVE2_BUSER" \
"ARUSER:AXI4mslave2_SLAVE2_ARUSER" \
"RUSER:AXI4mslave2_SLAVE2_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4mslave3} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4mslave3_SLAVE3_AWID" \
"AWADDR:AXI4mslave3_SLAVE3_AWADDR" \
"AWLEN:AXI4mslave3_SLAVE3_AWLEN" \
"AWSIZE:AXI4mslave3_SLAVE3_AWSIZE" \
"AWBURST:AXI4mslave3_SLAVE3_AWBURST" \
"AWLOCK:AXI4mslave3_SLAVE3_AWLOCK" \
"AWCACHE:AXI4mslave3_SLAVE3_AWCACHE" \
"AWPROT:AXI4mslave3_SLAVE3_AWPROT" \
"AWQOS:AXI4mslave3_SLAVE3_AWQOS" \
"AWREGION:AXI4mslave3_SLAVE3_AWREGION" \
"AWVALID:AXI4mslave3_SLAVE3_AWVALID" \
"AWREADY:AXI4mslave3_SLAVE3_AWREADY" \
"WDATA:AXI4mslave3_SLAVE3_WDATA" \
"WSTRB:AXI4mslave3_SLAVE3_WSTRB" \
"WLAST:AXI4mslave3_SLAVE3_WLAST" \
"WVALID:AXI4mslave3_SLAVE3_WVALID" \
"WREADY:AXI4mslave3_SLAVE3_WREADY" \
"BID:AXI4mslave3_SLAVE3_BID" \
"BRESP:AXI4mslave3_SLAVE3_BRESP" \
"BVALID:AXI4mslave3_SLAVE3_BVALID" \
"BREADY:AXI4mslave3_SLAVE3_BREADY" \
"ARID:AXI4mslave3_SLAVE3_ARID" \
"ARADDR:AXI4mslave3_SLAVE3_ARADDR" \
"ARLEN:AXI4mslave3_SLAVE3_ARLEN" \
"ARSIZE:AXI4mslave3_SLAVE3_ARSIZE" \
"ARBURST:AXI4mslave3_SLAVE3_ARBURST" \
"ARLOCK:AXI4mslave3_SLAVE3_ARLOCK" \
"ARCACHE:AXI4mslave3_SLAVE3_ARCACHE" \
"ARPROT:AXI4mslave3_SLAVE3_ARPROT" \
"ARQOS:AXI4mslave3_SLAVE3_ARQOS" \
"ARREGION:AXI4mslave3_SLAVE3_ARREGION" \
"ARVALID:AXI4mslave3_SLAVE3_ARVALID" \
"ARREADY:AXI4mslave3_SLAVE3_ARREADY" \
"RID:AXI4mslave3_SLAVE3_RID" \
"RDATA:AXI4mslave3_SLAVE3_RDATA" \
"RRESP:AXI4mslave3_SLAVE3_RRESP" \
"RLAST:AXI4mslave3_SLAVE3_RLAST" \
"RVALID:AXI4mslave3_SLAVE3_RVALID" \
"RREADY:AXI4mslave3_SLAVE3_RREADY" \
"AWUSER:AXI4mslave3_SLAVE3_AWUSER" \
"WUSER:AXI4mslave3_SLAVE3_WUSER" \
"BUSER:AXI4mslave3_SLAVE3_BUSER" \
"ARUSER:AXI4mslave3_SLAVE3_ARUSER" \
"RUSER:AXI4mslave3_SLAVE3_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4mslave4} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4mslave4_SLAVE4_AWID" \
"AWADDR:AXI4mslave4_SLAVE4_AWADDR" \
"AWLEN:AXI4mslave4_SLAVE4_AWLEN" \
"AWSIZE:AXI4mslave4_SLAVE4_AWSIZE" \
"AWBURST:AXI4mslave4_SLAVE4_AWBURST" \
"AWLOCK:AXI4mslave4_SLAVE4_AWLOCK" \
"AWCACHE:AXI4mslave4_SLAVE4_AWCACHE" \
"AWPROT:AXI4mslave4_SLAVE4_AWPROT" \
"AWQOS:AXI4mslave4_SLAVE4_AWQOS" \
"AWREGION:AXI4mslave4_SLAVE4_AWREGION" \
"AWVALID:AXI4mslave4_SLAVE4_AWVALID" \
"AWREADY:AXI4mslave4_SLAVE4_AWREADY" \
"WDATA:AXI4mslave4_SLAVE4_WDATA" \
"WSTRB:AXI4mslave4_SLAVE4_WSTRB" \
"WLAST:AXI4mslave4_SLAVE4_WLAST" \
"WVALID:AXI4mslave4_SLAVE4_WVALID" \
"WREADY:AXI4mslave4_SLAVE4_WREADY" \
"BID:AXI4mslave4_SLAVE4_BID" \
"BRESP:AXI4mslave4_SLAVE4_BRESP" \
"BVALID:AXI4mslave4_SLAVE4_BVALID" \
"BREADY:AXI4mslave4_SLAVE4_BREADY" \
"ARID:AXI4mslave4_SLAVE4_ARID" \
"ARADDR:AXI4mslave4_SLAVE4_ARADDR" \
"ARLEN:AXI4mslave4_SLAVE4_ARLEN" \
"ARSIZE:AXI4mslave4_SLAVE4_ARSIZE" \
"ARBURST:AXI4mslave4_SLAVE4_ARBURST" \
"ARLOCK:AXI4mslave4_SLAVE4_ARLOCK" \
"ARCACHE:AXI4mslave4_SLAVE4_ARCACHE" \
"ARPROT:AXI4mslave4_SLAVE4_ARPROT" \
"ARQOS:AXI4mslave4_SLAVE4_ARQOS" \
"ARREGION:AXI4mslave4_SLAVE4_ARREGION" \
"ARVALID:AXI4mslave4_SLAVE4_ARVALID" \
"ARREADY:AXI4mslave4_SLAVE4_ARREADY" \
"RID:AXI4mslave4_SLAVE4_RID" \
"RDATA:AXI4mslave4_SLAVE4_RDATA" \
"RRESP:AXI4mslave4_SLAVE4_RRESP" \
"RLAST:AXI4mslave4_SLAVE4_RLAST" \
"RVALID:AXI4mslave4_SLAVE4_RVALID" \
"RREADY:AXI4mslave4_SLAVE4_RREADY" \
"AWUSER:AXI4mslave4_SLAVE4_AWUSER" \
"WUSER:AXI4mslave4_SLAVE4_WUSER" \
"BUSER:AXI4mslave4_SLAVE4_BUSER" \
"ARUSER:AXI4mslave4_SLAVE4_ARUSER" \
"RUSER:AXI4mslave4_SLAVE4_RUSER" } 

# Add BIBUF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_0:D} -value {GND}



# Add BIBUF_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_1:D} -value {GND}



# Add COREAHBTOAPB3_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAHBTOAPB3_C0} -instance_name {COREAHBTOAPB3_C0_0}



# Add CoreAPB3_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_C0} -instance_name {CoreAPB3_C0_0}



# Add COREAXI4INTERCONNECT_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4INTERCONNECT_C0} -instance_name {COREAXI4INTERCONNECT_C0_0}



# Add COREAXITOAHBL_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXITOAHBL_C0} -instance_name {COREAXITOAHBL_C0_0}



# Add CoreGPIO_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreGPIO_C0} -instance_name {CoreGPIO_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[10:10]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[2:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[31:11]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[5:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[6:6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[7:7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[8:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[9:9]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:INT}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:GPIO_IN} -value {GND}



# Add COREI2C_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREI2C_C0} -instance_name {COREI2C_C0_0}



# Add COREJTAGDEBUG_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREJTAGDEBUG_C0} -instance_name {COREJTAGDEBUG_C0_0}



# Add CORESPI_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORESPI_C0} -instance_name {CORESPI_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORESPI_C0_0:SPISS} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORESPI_C0_0:SPISS} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORESPI_C0_0:SPISS} -pin_slices {[2:2]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESPI_C0_0:SPIINT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESPI_C0_0:SPIRXAVAIL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESPI_C0_0:SPITXRFM}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORESPI_C0_0:SPISSI} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORESPI_C0_0:SPICLKI} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESPI_C0_0:SPIOEN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESPI_C0_0:SPIMODE}



# Add CoreUARTapb_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreUARTapb_C0} -instance_name {CoreUARTapb_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_C0_0:TXRDY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_C0_0:RXRDY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_C0_0:PARITY_ERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_C0_0:OVERFLOW}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreUARTapb_C0_0:RX} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_C0_0:FRAMING_ERR}



# Add debounce_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {debounce} -hdl_file {hdl\Debounce.v} -instance_name {debounce_0}



# Add INV_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0}



# Add INV_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_1}



# Add MIV_RV32_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MIV_RV32_C0} -instance_name {MIV_RV32_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32_C0_0:MSYS_EI} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32_C0_0:MSYS_EI} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32_C0_0:MSYS_EI} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32_C0_0:MSYS_EI} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32_C0_0:MSYS_EI} -pin_slices {[4:4]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:EXT_RESETN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:JTAG_TDO_DR}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:EXT_IRQ} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:TIME_COUNT_OUT}



# Add PF_SRAM_AHBL_AXI_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_SRAM_AHBL_AXI_C0} -instance_name {PF_SRAM_AHBL_AXI_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:E" "INV_1:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:PAD" "HDMI_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:Y" "COREI2C_C0_0:SCLI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:E" "INV_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:PAD" "HDMI_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:Y" "COREI2C_C0_0:SDAI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_SEL" "CoreGPIO_C0_0:GPIO_OUT[4:4]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_C0_0:HCLK" "COREAXI4INTERCONNECT_C0_0:ACLK" "COREAXITOAHBL_C0_0:ACLK" "COREAXITOAHBL_C0_0:HCLK" "COREI2C_C0_0:PCLK" "CORESPI_C0_0:PCLK" "CoreGPIO_C0_0:PCLK" "CoreUARTapb_C0_0:PCLK" "MIV_RV32_C0_0:CLK" "PCLK" "PF_SRAM_AHBL_AXI_C0_0:HCLK" "debounce_0:clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_C0_0:HRESETN" "COREAXI4INTERCONNECT_C0_0:ARESETN" "COREAXITOAHBL_C0_0:ARESETN" "COREAXITOAHBL_C0_0:HRESETN" "COREI2C_C0_0:PRESETN" "CORESPI_C0_0:PRESETN" "CoreGPIO_C0_0:PRESETN" "CoreUARTapb_C0_0:PRESETN" "MIV_RV32_C0_0:RESETN" "PF_SRAM_AHBL_AXI_C0_0:HRESETN" "RESETN" "debounce_0:resetn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:INT" "MIV_RV32_C0_0:MSYS_EI[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:SCLO" "INV_1:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:SDAO" "INV_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TCK_0" "MIV_RV32_C0_0:JTAG_TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TDI_0" "MIV_RV32_C0_0:JTAG_TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TDO_0" "MIV_RV32_C0_0:JTAG_TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TMS_0" "MIV_RV32_C0_0:JTAG_TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TRSTN_0" "MIV_RV32_C0_0:JTAG_TRSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESPI_C0_0:SPISCLKO" "SPISCLKO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESPI_C0_0:SPISDI" "SPISDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESPI_C0_0:SPISDO" "SPISDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESPI_C0_0:SPISS[0:0]" "SPISS_Reclocker" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESPI_C0_0:SPISS[1:1]" "SPISS_TxDriver" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESPI_C0_0:SPISS[2:2]" "SPISS_RxDriverReclkr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_C0_0:GPIO_OUT[0:0]" "LED1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_C0_0:GPIO_OUT[10:10]" "SDI_TX_CLK_SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_C0_0:GPIO_OUT[3:3]" "SDO1_DISABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_C0_0:GPIO_OUT[5:5]" "sdi_xcvr_calib_req" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_C0_0:GPIO_OUT[6:6]" "hdmi_resetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_C0_0:GPIO_OUT[7:7]" "fractional_frame_rate" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_C0_0:GPIO_OUT[8:8]" "sdi_resetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_C0_0:GPIO_OUT[9:9]" "frame_rate_60fps_30fps" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreUARTapb_C0_0:TX" "UART_TX_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HPD_HDMITx" "debounce_0:switch_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32_C0_0:MSYS_EI[0:0]" "MSYS_EI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32_C0_0:MSYS_EI[2:2]" "debounce_0:IRQ_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32_C0_0:MSYS_EI[3:3]" "SDI_Tx_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32_C0_0:MSYS_EI[4:4]" "SDIRx_INT" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_C0_0:GPIO_OUT[2:1]" "GPIO_OUT" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_INITIATOR" "MIV_RV32_C0_0:APB_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4mslave0" "COREAXI4INTERCONNECT_C0_0:AXI4mslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4mslave2" "COREAXI4INTERCONNECT_C0_0:AXI4mslave2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4mslave3" "COREAXI4INTERCONNECT_C0_0:AXI4mslave3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4mslave4" "COREAXI4INTERCONNECT_C0_0:AXI4mslave4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_C0_0:AHBtarget" "COREAXITOAHBL_C0_0:AHB_MS_IF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_C0_0:APBinitiator" "CoreAPB3_C0_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI3mslave1" "COREAXITOAHBL_C0_0:AXISlaveIF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI4mmaster0" "MIV_RV32_C0_0:AXI4_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:APBslave" "CoreAPB3_C0_0:APBmslave1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESPI_C0_0:APB_bif" "CoreAPB3_C0_0:APBmslave3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_C0_0:APBmslave0" "CoreGPIO_C0_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_C0_0:APBmslave2" "CoreUARTapb_C0_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32_C0_0:AHBL_M_TARGET" "PF_SRAM_AHBL_AXI_C0_0:AHBSlaveInterface" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "PROC_SUB_SYSTEM"
generate_component -component_name ${sd_name}
