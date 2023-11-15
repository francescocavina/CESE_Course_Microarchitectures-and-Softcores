#If required use the below command and launch symbol server from an external shell.
#symbol_server -S -s tcp::1534
connect -path [list tcp::1534 tcp:lseserver.ddns.net:3121]
source /home/francesco/Desktop/lab2/lab2/lab2.sdk/system_wrapper_hw_platform_1/ps7_init.tcl
targets -set -filter {jtag_cable_name =~ "Digilent Arty Z7 003017A4C81CA" && level==0} -index 1
fpga -file /home/francesco/Desktop/lab2/lab2/lab2.sdk/system_wrapper_hw_platform_1/system_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Arty Z7 003017A4C81CA"} -index 0
loadhw -hw /home/francesco/Desktop/lab2/lab2/lab2.sdk/system_wrapper_hw_platform_1/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Arty Z7 003017A4C81CA"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Arty Z7 003017A4C81CA"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Arty Z7 003017A4C81CA"} -index 0
dow /home/francesco/Desktop/lab2/lab2/lab2.sdk/TestApp/Debug/TestApp.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Arty Z7 003017A4C81CA"} -index 0
con
