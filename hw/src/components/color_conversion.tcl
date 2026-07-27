# Creating SmartDesign "color_conversion"
set sd_name {color_conversion}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLOCK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N_I} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_O} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {PIXEL_DATA_I} -port_direction {IN} -port_range {[143:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {conversion_sel_i} -port_direction {IN} -port_range {[1:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {PIXEL_DATA_O} -port_direction {OUT} -port_range {[143:0]}


sd_create_pin_slices -sd_name ${sd_name} -pin_name {PIXEL_DATA_I} -pin_slices {[143:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PIXEL_DATA_I} -pin_slices {[47:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PIXEL_DATA_I} -pin_slices {[95:48]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PIXEL_DATA_O} -pin_slices {[143:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PIXEL_DATA_O} -pin_slices {[47:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PIXEL_DATA_O} -pin_slices {[95:48]}
# Add conversion_sel_mux_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {conversion_sel_mux} -hdl_file {hdl\conversion_sel_mux.v} -instance_name {conversion_sel_mux_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {conversion_sel_mux_0:pixel_data_rgb2yuv422_i} -pin_slices {[143:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {conversion_sel_mux_0:pixel_data_rgb2yuv422_i} -pin_slices {[47:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {conversion_sel_mux_0:pixel_data_rgb2yuv422_i[47:0]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {conversion_sel_mux_0:pixel_data_rgb2yuv422_i} -pin_slices {[95:48]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {conversion_sel_mux_0:pixel_data_yuv4442yuv422_i} -pin_slices {[143:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {conversion_sel_mux_0:pixel_data_yuv4442yuv422_i} -pin_slices {[47:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {conversion_sel_mux_0:pixel_data_yuv4442yuv422_i[47:0]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {conversion_sel_mux_0:pixel_data_yuv4442yuv422_i} -pin_slices {[95:48]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {conversion_sel_mux_0:pixel_data_i} -pin_slices {[143:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {conversion_sel_mux_0:pixel_data_i} -pin_slices {[47:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {conversion_sel_mux_0:pixel_data_i} -pin_slices {[95:48]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {conversion_sel_mux_0:pixel_data_o} -pin_slices {[143:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {conversion_sel_mux_0:pixel_data_o} -pin_slices {[47:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {conversion_sel_mux_0:pixel_data_o} -pin_slices {[95:48]}



# Add RGBtoYCbCr_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RGBtoYCbCr_C0} -instance_name {RGBtoYCbCr_C0_0}



# Add YUV444_to_YUV422_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {YUV444_to_YUV422} -hdl_file {hdl\YUV444_to_YUV422.v} -instance_name {YUV444_to_YUV422_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {YUV444_to_YUV422_0:pixel_data_i} -pin_slices {[143:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {YUV444_to_YUV422_0:pixel_data_i} -pin_slices {[47:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {YUV444_to_YUV422_0:pixel_data_i} -pin_slices {[95:48]}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_I" "RGBtoYCbCr_C0_0:CLOCK_I" "YUV444_to_YUV422_0:clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_VALID_I" "RGBtoYCbCr_C0_0:DATA_VALID_I" "YUV444_to_YUV422_0:data_valid_i" "conversion_sel_mux_0:valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_VALID_O" "conversion_sel_mux_0:valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_N_I" "RGBtoYCbCr_C0_0:RESET_N_I" "YUV444_to_YUV422_0:resetn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:DATA_VALID_O" "conversion_sel_mux_0:valid_rgb2yuv422_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"YUV444_to_YUV422_0:data_valid_o" "conversion_sel_mux_0:valid_yuv4442yuv422_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PIXEL_DATA_I[143:96]" "RGBtoYCbCr_C0_0:RED_I" "YUV444_to_YUV422_0:pixel_data_i[143:96]" "conversion_sel_mux_0:pixel_data_i[143:96]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PIXEL_DATA_I[47:0]" "RGBtoYCbCr_C0_0:BLUE_I" "YUV444_to_YUV422_0:pixel_data_i[47:0]" "conversion_sel_mux_0:pixel_data_i[47:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PIXEL_DATA_I[95:48]" "RGBtoYCbCr_C0_0:GREEN_I" "YUV444_to_YUV422_0:pixel_data_i[95:48]" "conversion_sel_mux_0:pixel_data_i[95:48]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PIXEL_DATA_O[143:96]" "conversion_sel_mux_0:pixel_data_o[143:96]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PIXEL_DATA_O[47:0]" "conversion_sel_mux_0:pixel_data_o[47:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PIXEL_DATA_O[95:48]" "conversion_sel_mux_0:pixel_data_o[95:48]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:C_OUT" "conversion_sel_mux_0:pixel_data_rgb2yuv422_i[95:48]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:Y_OUT" "conversion_sel_mux_0:pixel_data_rgb2yuv422_i[143:96]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"YUV444_to_YUV422_0:C_data_o" "conversion_sel_mux_0:pixel_data_yuv4442yuv422_i[95:48]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"YUV444_to_YUV422_0:Y_data_o" "conversion_sel_mux_0:pixel_data_yuv4442yuv422_i[143:96]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"conversion_sel_i" "conversion_sel_mux_0:select_i" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "color_conversion"
generate_component -component_name ${sd_name}
