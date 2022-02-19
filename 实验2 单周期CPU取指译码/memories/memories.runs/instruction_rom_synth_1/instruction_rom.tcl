# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-3

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/windows10/Desktop/vivadoWorks/memories/memories.cache/wt [current_project]
set_property parent.project_path C:/Users/windows10/Desktop/vivadoWorks/memories/memories.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_ip c:/Users/windows10/Desktop/vivadoWorks/memories/memories.srcs/sources_1/ip/instruction_rom/instruction_rom.xci
set_property is_locked true [get_files c:/Users/windows10/Desktop/vivadoWorks/memories/memories.srcs/sources_1/ip/instruction_rom/instruction_rom.xci]

synth_design -top instruction_rom -part xc7a100tcsg324-3 -mode out_of_context
rename_ref -prefix_all instruction_rom_
write_checkpoint -noxdef instruction_rom.dcp
catch { report_utilization -file instruction_rom_utilization_synth.rpt -pb instruction_rom_utilization_synth.pb }
if { [catch {
  file copy -force C:/Users/windows10/Desktop/vivadoWorks/memories/memories.runs/instruction_rom_synth_1/instruction_rom.dcp c:/Users/windows10/Desktop/vivadoWorks/memories/memories.srcs/sources_1/ip/instruction_rom/instruction_rom.dcp
} _RESULT ] } { 
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}
if { [catch {
  write_verilog -force -mode synth_stub c:/Users/windows10/Desktop/vivadoWorks/memories/memories.srcs/sources_1/ip/instruction_rom/instruction_rom_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode synth_stub c:/Users/windows10/Desktop/vivadoWorks/memories/memories.srcs/sources_1/ip/instruction_rom/instruction_rom_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_verilog -force -mode funcsim c:/Users/windows10/Desktop/vivadoWorks/memories/memories.srcs/sources_1/ip/instruction_rom/instruction_rom_funcsim.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode funcsim c:/Users/windows10/Desktop/vivadoWorks/memories/memories.srcs/sources_1/ip/instruction_rom/instruction_rom_funcsim.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}
