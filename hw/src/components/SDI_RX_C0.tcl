# Exporting Component Description of SDI_RX_C0 to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component SDI_RX_C0
create_and_configure_core -core_vlnv "Microchip:SolutionCore:SDI_RX:$SDI_RXver" -component_name {SDI_RX_C0} -params {\
"G_AUDIO_FORMAT:1"  \
"G_CONFIG_FORMAT:1"  \
"G_DEBUG_PORTS:0"  \
"G_OUT_PIXEL_WIDTH:12"  \
"G_SD_270_MODE:1"  \
"G_SIMULATION_MODE:false"  \
"G_VIDEO_FORMAT:0"   }
# Exporting Component Description of SDI_RX_C0 to TCL done
