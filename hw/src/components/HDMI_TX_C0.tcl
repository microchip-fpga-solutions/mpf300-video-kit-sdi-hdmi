# Exporting Component Description of HDMI_TX_C0 to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component HDMI_TX_C0
create_and_configure_core -core_vlnv "Microchip:SolutionCore:HDMI_TX:$HDMI_TXver" -component_name {HDMI_TX_C0} -params {\
"ACR_GENERATION:1"  \
"AUDIO_CHANNELS:2"  \
"AUDIO_FORMAT:1"  \
"AUDIO_WORD_WIDTH:24"  \
"g_4K60_SUPPORT:1"  \
"g_AUX_CHANNEL_ENABLE:1"  \
"g_BITS_PER_COMPONENT:12"  \
"g_COLOR_COMPONENTS:3"  \
"g_COLOR_FORMAT:0"  \
"g_CONFIG_INTERFACE:1"  \
"G_FORMAT:0"  \
"g_HDMI2P1:0"  \
"g_NO_OF_LANES:4"  \
"g_PIXELS_PER_CLK:4"  \
"G_STROBE_ENABLE:0"   }
# Exporting Component Description of HDMI_TX_C0 to TCL done
