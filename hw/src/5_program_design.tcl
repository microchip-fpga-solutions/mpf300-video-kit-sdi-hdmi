## run_tool -name {GENERATEPROGRAMMINGDATA}
run_tool_wrapper "run_tool -name {GENERATEPROGRAMMINGDATA} "

#load MiV hex file
configure_ram -cfg_file {./src/cfg/SNVM_SDI_HDMI.cfg}

configure_design_initialization_data -second_stage_start_address {0x00000000} \
    -third_stage_uprom_start_address {0x00000000} \
	-third_stage_snvm_start_address {0x00000000} \
	-third_stage_spi_start_address {0x00000400} \
	-third_stage_spi_type {SPIFLASH_NO_BINDING_PLAINTEXT} \
	-third_stage_spi_clock_divider {6} \
	-init_timeout 128 \
	-auto_calib_timeout {3000} \
	-broadcast_RAMs {1} \
	-standalone_initialization {0} 
	
generate_design_initialization_data

# Configure and generate programming file data
# Examples for configuring the programming files TBD

configure_tool \
         -name {GENERATEPROGRAMMINGFILE} \
         -params {program_fabric:true} \
         -params {program_security:false} \
         -params {program_snvm:true} \
         -params {sanitize_snvm:false} 

## run_tool -name GENERATEPROGRAMMINGFILE
run_tool_wrapper "run_tool -name GENERATEPROGRAMMINGFILE"

puts "Programmingfile generated successfully\n"

## run_tool -name {GENERATE_SPI_FLASH_IMAGE} 
run_tool_wrapper "run_tool -name GENERATE_SPI_FLASH_IMAGE"

save_project

# Export Programming Job

# Programming job files can be imported in FlasPro Express standalone for programming the device
export_prog_job \
	-job_file_name {top} \
	-export_dir ${PrjLocation}/designer/top/export \
	-bitstream_file_type {TRUSTED_FACILITY} \
	-bitstream_file_components {FABRIC SNVM} \
	-program_design 1 \
	-program_spi_flash 1 \
	-include_plaintext_passkey 0 

puts "Exported job file successfully\n"

puts "Full design flow passed execution"
