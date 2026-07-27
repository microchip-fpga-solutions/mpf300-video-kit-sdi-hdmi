import_files -io_pdc {./src/constraints/io_constraints.pdc}
import_files -fp_pdc {./src/constraints/fp_constraints.pdc}
import_files -sdc {./src/constraints/timing_constraints.sdc}
import_files -sdc {./src/constraints/timing_ngmux_constraints.sdc}
derive_constraints_sdc
organize_tool_files -tool {SYNTHESIZE} \
	-file ${PrjLocation}/constraint/top_derived_constraints.sdc\
	-module {top::work} \
	-input_type {constraint}
organize_tool_files -tool {PLACEROUTE} \
	-file ${PrjLocation}/constraint/timing_constraints.sdc \
	-file ${PrjLocation}/constraint/io/io_constraints.pdc \
	-file ${PrjLocation}/constraint/fp/fp_constraints.pdc \
	-file ${PrjLocation}/constraint/top_derived_constraints.sdc \
	-file ${PrjLocation}/constraint/timing_ngmux_constraints.sdc \
	-module {top::work} \
	-input_type {constraint}
organize_tool_files -tool {VERIFYTIMING} \
	-file ${PrjLocation}/constraint/timing_constraints.sdc \
	-file ${PrjLocation}/constraint/top_derived_constraints.sdc \
	-file ${PrjLocation}/constraint/timing_ngmux_constraints.sdc \
	-module {top::work} \
	-input_type {constraint}
## run_tool -name {CONSTRAINT_MANAGEMENT}
run_tool_wrapper "run_tool -name {CONSTRAINT_MANAGEMENT}
"
save_project 
 puts "Imported and derived constraints successfully
"
