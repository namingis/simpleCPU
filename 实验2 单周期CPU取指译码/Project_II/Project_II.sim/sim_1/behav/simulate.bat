@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim sim_for_Project_II_behav -key {Behavioral:sim_1:Functional:sim_for_Project_II} -tclbatch sim_for_Project_II.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
