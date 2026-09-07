source ./common/common.tcl
set Prjname "mpf300-video-kit-sdi-hdmi"
set PrjLocation "./$Prjname"


#variable used in the design
set SimTime 100us
set Effort_Level false 
set Multi_Pass_Layout false 
set Repair_Min_Delay true

# Remove existing project if present
file delete -force ${PrjLocation}

# Create and configure new project
new_project \
	-name "$Prjname" \
	-location "$PrjLocation" \
	-family "PolarFire" \
	-die $die_eval \
	-package $eval_package \
	-die_voltage "1.05" \
	-speed "-1" \
	-part_range $eval_part_range \
	-hdl "VERILOG"
smartdesign -memory_map_drc_change_error_to_warning 1 -bus_interface_data_width_drc_change_error_to_warning 1 -bus_interface_id_width_drc_change_error_to_warning 1

select_profile -name $synprofile1

select_profile -name $simuprofile1

puts "Project created successfully"

download_core -vlnv "Actel:DirectCore:COREAHBTOAPB3:$COREAHBTOAPB3ver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:COREAXI4INTERCONNECT:$COREAXI4INTERCONNECTver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:COREAXITOAHBL:$COREAXITOAHBLver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:COREI2C:$COREI2Cver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:COREJTAGDEBUG:$COREJTAGDEBUGver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:CORERESET_PF:$CORERESET_PFver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:CoreAPB3:$CoreAPB3ver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:CoreGPIO:$CoreGPIOver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:CoreUARTapb:$CoreUARTapbver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:CORESPI:$CORESPIver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Microchip:SolutionCore:HDMI_RX:$HDMI_RXver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Microchip:SolutionCore:HDMI_TX:$HDMI_TXver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Microsemi:MiV:MIV_RV32:$MIV_RV32ver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:SgCore:PF_NGMUX:$PF_NGMUXver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_CCC:$PF_CCCver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_CLK_DIV:$PF_CLK_DIVver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_DRI:$PF_DRIver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_INIT_MONITOR:$PF_INIT_MONITORver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_OSC:$PF_OSCver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SystemBuilder:PF_SRAM_AHBL_AXI:$PF_SRAM_AHBL_AXIver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_TX_PLL:$PF_TX_PLLver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SystemBuilder:PF_XCVR_ERM:$PF_XCVR_ERMver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_XCVR_REF_CLK:$PF_XCVR_REF_CLKver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Microchip:SolutionCore:RGBtoYCbCr:$RGBtoYCbCrver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Microchip:SolutionCore:SDI_RX:$SDI_RXver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Microchip:SolutionCore:SDI_TX:$SDI_TXver" -location {www.microchip-ip.com/repositories/DirectCore}

# Create design
source ./src/1_create_design.tcl

# Constrain design
source ./src/2_constrain_design.tcl

# Implement design
source ./src/4_implement_design.tcl

# Program design
source ./src/5_program_design.tcl

# Close project
close_project -save 1 
