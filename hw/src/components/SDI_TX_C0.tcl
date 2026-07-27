# Exporting Component Description of SDI_TX_C0 to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component SDI_TX_C0
create_and_configure_core -core_vlnv "Microchip:SolutionCore:SDI_TX:$SDI_TXver" -component_name {SDI_TX_C0} -params {\
"G_AUDIO_CHANNELS:2"  \
"G_AUDIO_ENABLE:1"  \
"G_AUDIO_FORMAT:0"  \
"G_CONFIG_FORMAT:1"  \
"G_HDR_ENABLE:1"  \
"G_PIXEL_WIDTH:12"  \
"G_RES_AUTO_DET:true"  \
"G_SD270Mbps_SUPPORT:1"  \
"G_SIMULATION_MODE:false"  \
"G_VIDEO_CODE:97"  \
"G_VIDEO_FORMAT:0"   }
# Exporting Component Description of SDI_TX_C0 to TCL done
