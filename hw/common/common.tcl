set COREAHBTOAPB3ver {4.0.106}
set CoreAPB3ver {4.2.100}
set COREAXI4INTERCONNECTver {2.9.100}
set COREAXITOAHBLver {3.6.101}
set CoreGPIOver {3.2.102}
set COREI2Cver {7.2.101}
set COREJTAGDEBUGver {4.0.100}
set CORERESET_PFver {2.3.100}
set CORESPIver {5.2.104}
set CoreUARTapbver {5.7.100}
set HDMI_RXver {5.8.0}
set HDMI_TXver {5.7.0}
set MIV_RV32ver {3.1.200}
set PF_CCCver {2.2.220}
set PF_CLK_DIVver {1.0.103}
set PF_DRIver {1.1.104}
set PF_INIT_MONITORver {2.0.308}
set PF_NGMUXver {1.0.101}
set PF_OSCver {1.0.102}
set PF_SRAM_AHBL_AXIver {1.2.111}
set PF_TX_PLLver {2.0.304}
set PF_TX_PLLver {2.0.304}
set PF_XCVR_ERMver {3.1.206}
set PF_XCVR_ERMver {3.1.206}
set PF_XCVR_REF_CLKver {1.0.103}
set PF_XCVR_REF_CLKver {1.0.103}
set PF_XCVR_REF_CLKver {1.0.103}
set RGBtoYCbCrver {4.6.0}
set SDI_RXver {1.2.0}
set SDI_TXver {1.2.0}

#tool profiles 
set synprofile1 {Synplify Pro ME}
set simuprofile1 {QuestaSim ME} 

#device details
set die_eval {MPF300T}
set eval_package {FCG1152}
set eval_part_range {EXT}

# A common procedure called by all tests.

# Computes the runtime for each command run in Libero

proc run_tool_wrapper { cmd } {

# get tool name from the command

regexp {run_tool\s+-name\s+\{*(\w*)\}*} $cmd full1 tool;

puts "Starting $tool command";

set full_cmd  "time \{ $cmd \}" ;

set TIME_start [clock seconds];

set runtime [eval $full_cmd ];

set TIME_taken [expr [clock seconds] - $TIME_start];

puts  "\nRUNTIME:$tool=$TIME_taken secs\n";

set runtime_secs [ expr [lindex $runtime 0]/1000000];

puts "\nRUNTIME_bytime:$tool=$runtime_secs secs\n"; 
}
