#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source ./src/hdl/Debounce.v
import_files -library work -hdl_source ./src/hdl/YUV444_to_YUV422.v
import_files -library work -hdl_source ./src/hdl/conversion_sel_mux.v
import_files -library work -hdl_source ./src/hdl/audio_cts_mapper.v
#Sourcing the Tcl files for creating individual components under the top level
source ./src/components/COREAHBTOAPB3_C0.tcl 
source ./src/components/COREAXI4INTERCONNECT_C0.tcl 
source ./src/components/COREAXITOAHBL_C0.tcl 
source ./src/components/COREI2C_C0.tcl 
source ./src/components/COREJTAGDEBUG_C0.tcl 
source ./src/components/CORESPI_C0.tcl 
source ./src/components/CoreAPB3_C0.tcl 
source ./src/components/CoreGPIO_C0.tcl 
source ./src/components/CoreUARTapb_C0.tcl 
source ./src/components/MIV_RV32_C0.tcl 
source ./src/components/PF_SRAM_AHBL_AXI_C0.tcl 
source ./src/components/CORERESET_PF_C0.tcl 
source ./src/components/PF_CCC_C2.tcl 
source ./src/components/PF_CCC_HDMIRX_SYS_CLK.tcl 
source ./src/components/PF_CCC_HDMI_CDR_REF.tcl 
source ./src/components/PF_TX_PLL_C0.tcl 
source ./src/components/PF_XCVR_REF_CLK_C1.tcl 
source ./src/components/HDMI_RX_C0.tcl 
source ./src/components/HDMI_TX_C0.tcl 
source ./src/components/PF_XCVR_ERM_C1.tcl 
source ./src/components/PF_DRI_C0.tcl 
source ./src/components/PF_XCVR_ERM_C0.tcl 
source ./src/components/PF_CCC_SDI_XCVR_CLK_REF.tcl 
source ./src/components/PF_CCC_divide10.tcl 
source ./src/components/PF_CCC_divide_1or10.tcl 
source ./src/components/PF_CLK_DIV_C0.tcl 
source ./src/components/PF_NGMUX_C0.tcl 
source ./src/components/PF_OSC_C0.tcl 
source ./src/components/PF_TX_PLL_C1.tcl 
source ./src/components/PF_XCVR_REF_CLK_C0.tcl 
source ./src/components/SDI_RX_C0.tcl 
source ./src/components/SDI_TX_C0.tcl 
source ./src/components/RGBtoYCbCr_C0.tcl 
source ./src/components/PF_CCC_C1.tcl 
source ./src/components/PF_INIT_MONITOR_C0.tcl 
source ./src/components/PF_XCVR_REF_CLK_C4.tcl
 build_design_hierarchy
source ./src/components/clocks_and_reset.tcl
 build_design_hierarchy
source ./src/components/HDMI_Clocks_Resets.tcl
 build_design_hierarchy
source ./src/components/HDMI_Top.tcl
 build_design_hierarchy
source ./src/components/PROC_SUB_SYSTEM.tcl
 build_design_hierarchy
source ./src/components/SDI_Clocks_Resets.tcl 
build_design_hierarchy
source ./src/components/SDI_Top.tcl
 build_design_hierarchy
source ./src/components/color_conversion.tcl
 build_design_hierarchy
source ./src/components/SDI_HDMI_top.tcl
 build_design_hierarchy
source ./src/components/top.tcl
 build_design_hierarchy
set_root -module {top::work} 
save_project
file copy -force "./src/softconsole/miv-rv32i-sdi_hdmi_cross_conv.hex" "./$Prjname/miv-rv32i-sdi_hdmi_cross_conv.hex"
puts "Design generated successfully
"
