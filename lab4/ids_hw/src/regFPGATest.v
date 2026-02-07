////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : regFPGATest.vf
// /___/   /\     Timestamp : 02/04/2026 19:23:32
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w "C:/Documents and Settings/student/NetFPGATestDesign/regFPGATest.sch" regFPGATest.vf
//Design Name: regFPGATest
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 100 ps / 10 ps

module FD8CE_HXILINX_regFPGATest(Q, C, CE, CLR, D);

   
   output [7:0]       Q;

   input 	      C;	
   input 	      CE;	
   input 	      CLR;	
   input  [7:0]       D;
   
   reg    [7:0]       Q;
   
   always @(posedge C or posedge CLR)
     begin
	if (CLR)
	  Q <= 8'b0000_0000;
	else if (CE)
          Q <= D;
     end
   
   
endmodule
`timescale 1ns / 1ps

module regFPGATest(clk, 
                   inBus, 
                   inSingle, 
                   outBus, 
                   outSingle);

    input clk;
    input [7:0] inBus;
    input inSingle;
   output [7:0] outBus;
   output outSingle;
   
   wire XLXN_12;
   wire XLXN_13;
   
   FD XLXI_1 (.C(clk), 
              .D(inSingle), 
              .Q(outSingle));
   defparam XLXI_1.INIT = 1'b0;
   FD8CE_HXILINX_regFPGATest XLXI_4 (.C(clk), 
                                     .CE(XLXN_13), 
                                     .CLR(XLXN_12), 
                                     .D(inBus[7:0]), 
                                     .Q(outBus[7:0]));
   // synthesis attribute HU_SET of XLXI_4 is "XLXI_4_0"
   VCC XLXI_5 (.P(XLXN_13));
   GND XLXI_6 (.G(XLXN_12));
endmodule
