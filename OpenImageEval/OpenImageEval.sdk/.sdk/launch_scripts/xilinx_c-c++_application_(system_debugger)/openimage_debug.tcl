connect -url tcp:127.0.0.1:3121
source D:/Xilinx/SDK/2019.1/scripts/sdk/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS1 210205812999A"} -index 1
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS1 210205812999A" && level==0} -index 0
fpga -file D:/Projects/260-Open-Image/OpenImageEval/OpenImageEval.runs/impl_1/edt_zcu106_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS1 210205812999A"} -index 1
loadhw -hw D:/Projects/260-Open-Image/OpenImageEval/OpenImageEval.sdk/edt_zcu106_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS1 210205812999A"} -index 1
source D:/Projects/260-Open-Image/OpenImageEval/OpenImageEval.sdk/edt_zcu106_wrapper_hw_platform_0/psu_init.tcl
psu_init
after 1000
psu_ps_pl_isolation_removal
after 1000
psu_ps_pl_reset_config
catch {psu_protection}
targets -set -nocase -filter {name =~"*A53*0" && jtag_cable_name =~ "Digilent JTAG-HS1 210205812999A"} -index 1
rst -processor
dow D:/Projects/260-Open-Image/OpenImageEval/OpenImageEval.sdk/OpenImage/Debug/OpenImage.elf
configparams force-mem-access 0
bpadd -addr &main
