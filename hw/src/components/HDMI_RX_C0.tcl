# Exporting Component Description of HDMI_RX_C0 to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component HDMI_RX_C0
create_and_configure_core -core_vlnv "Microchip:SolutionCore:HDMI_RX:$HDMI_RXver" -component_name {HDMI_RX_C0} -params {\
"G_4K60_SUPPORT:1"  \
"G_AUDIO_CHANNEL:2"  \
"g_bits_per_component:12"  \
"g_CONFIG_INTERFACE:1"  \
"G_FORMAT_AUDIO:0"  \
"G_FORMAT_VIDEO:0"  \
"g_HDCP_EN:0"  \
"g_PIXELS_PER_CLK:4"  \
"g_SIMULATION_MODE:0"  \
"g_STROBE_EN:1"  \
"g_USER_EDID_CONFIG:1"   }
# Exporting Component Description of HDMI_RX_C0 to TCL done
