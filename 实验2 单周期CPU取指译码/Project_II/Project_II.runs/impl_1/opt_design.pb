
L
Command: %s
53*	vivadotcl2

opt_design2default:defaultZ4-113h px
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px
k
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px
O

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px
M
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px
R
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px
a
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.063 . Memory (MB): peak = 477.441 ; gain = 1.3672default:defaulth px
B
%Done setting XDC timing constraints.
35*timingZ38-35h px
^

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px
f

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px
r
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px
H
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px
9
'Phase 1 Retarget | Checksum: 153f4a1b7
*commonh px
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.047 . Memory (MB): peak = 944.270 ; gain = 0.0002default:defaulth px
r

Phase %s%s
101*constraints2
2 2default:default2(
Constant Propagation2default:defaultZ18-101h px
r
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px
F
Eliminated %s cells.
10*opt2
02default:defaultZ31-10h px
E
3Phase 2 Constant Propagation | Checksum: 153f4a1b7
*commonh px
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.047 . Memory (MB): peak = 944.270 ; gain = 0.0002default:defaulth px
c

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101h px
?
Deleting driverless net: %s.
6*opt2?
?instruction_rom/U0/inst_blk_mem_gen/gnative_mem_map_bmg.native_mem_map_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/rsta2default:defaultZ31-6h px
?
Deleting driverless net: %s.
6*opt2?
sinstruction_rom/U0/inst_blk_mem_gen/gnative_mem_map_bmg.native_mem_map_blk_mem_gen/valid.cstr/ramloop[0].ram.r/rsta2default:defaultZ31-6h px
?
Deleting driverless net: %s.
6*opt2v
binstruction_rom/U0/inst_blk_mem_gen/gnative_mem_map_bmg.native_mem_map_blk_mem_gen/valid.cstr/rsta2default:defaultZ31-6h px
?
Deleting driverless net: %s.
6*opt2k
Winstruction_rom/U0/inst_blk_mem_gen/gnative_mem_map_bmg.native_mem_map_blk_mem_gen/rsta2default:defaultZ31-6h px
s
Deleting driverless net: %s.
6*opt2<
(instruction_rom/U0/inst_blk_mem_gen/rsta2default:defaultZ31-6h px
_
Deleting driverless net: %s.
6*opt2(
instruction_rom/rsta2default:defaultZ31-6h px
R
 Eliminated %s unconnected nets.
12*opt2
972default:defaultZ31-12h px
S
!Eliminated %s unconnected cells.
11*opt2
262default:defaultZ31-11h px
6
$Phase 3 Sweep | Checksum: 1960c0a03
*commonh px
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.125 . Memory (MB): peak = 944.270 ; gain = 0.0002default:defaulth px
^

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px
?

%s
*constraints2n
ZTime (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 944.270 ; gain = 0.0002default:defaulth px
G
5Ending Logic Optimization Task | Checksum: 1960c0a03
*commonh px
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.125 . Memory (MB): peak = 944.270 ; gain = 0.0002default:defaulth px
>
,Implement Debug Cores | Checksum: 1aca2215d
*commonh px
;
)Logic Optimization | Checksum: 1aca2215d
*commonh px
^

Starting %s Task
103*constraints2&
Power Optimization2default:defaultZ18-103h px
p
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
3.132default:defaultZ34-132h px
:
Applying IDT optimizations ...
9*pwroptZ34-9h px
<
Applying ODC optimizations ...
10*pwroptZ34-10h px


*pwropth px
b

Starting %s Task
103*constraints2*
PowerOpt Patch Enables2default:defaultZ18-103h px
?
?WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
02default:default2
12default:defaultZ34-162h px
a
+Structural ODC has moved %s WE to EN ports
155*pwropt2
02default:defaultZ34-201h px
?
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
02default:default2
02default:default2
22default:defaultZ34-65h px
K
9Ending PowerOpt Patch Enables Task | Checksum: 1960c0a03
*commonh px
?

%s
*constraints2n
ZTime (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 955.250 ; gain = 0.0002default:defaulth px
G
5Ending Power Optimization Task | Checksum: 1960c0a03
*commonh px
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.312 . Memory (MB): peak = 955.250 ; gain = 10.9802default:defaulth px
W
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
262default:default2
62default:default2
02default:default2
02default:defaultZ4-41h px
Y
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
opt_design: 2default:default2
00:00:122default:default2
00:00:132default:default2
955.2502default:default2
481.5862default:defaultZ17-268h px
A
Writing placer database...
1603*designutilsZ20-1893h px
:
Writing XDEF routing.
211*designutilsZ20-211h px
G
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px
G
#Writing XDEF routing special nets.
210*designutilsZ20-210h px
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.0622default:default2
955.2502default:default2
0.0002default:defaultZ17-268h px
M
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px
?
#The results of DRC are in file %s.
168*coretcl2?
ZC:/Users/windows10/Desktop/vivadoWorks/Project_II/Project_II.runs/impl_1/top_drc_opted.rptZC:/Users/windows10/Desktop/vivadoWorks/Project_II/Project_II.runs/impl_1/top_drc_opted.rpt2default:default8Z2-168h px


End Record