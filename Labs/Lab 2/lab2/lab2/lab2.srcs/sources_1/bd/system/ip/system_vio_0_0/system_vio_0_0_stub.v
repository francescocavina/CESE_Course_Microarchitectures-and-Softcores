// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Tue Nov 14 21:53:13 2023
// Host        : francescosLaptop running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/francesco/Desktop/lab2/lab2/lab2.srcs/sources_1/bd/system/ip/system_vio_0_0/system_vio_0_0_stub.v
// Design      : system_vio_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2018.1" *)
module system_vio_0_0(clk, probe_out0, probe_out1)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_out0[1:0],probe_out1[3:0]" */;
  input clk;
  output [1:0]probe_out0;
  output [3:0]probe_out1;
endmodule
