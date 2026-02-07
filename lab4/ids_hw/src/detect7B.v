////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : detect7B.vf
// /___/   /\     Timestamp : 02/06/2026 00:59:17
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w C:/labs/Lab3Attempt5/detect7B.sch detect7B.vf
//Design Name: detect7B
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module detect7B(ce, 
                clk, 
                hwregA, 
                match_en, 
                mrst, 
                pipe1, 
                match, 
                XLXN_31);

    input ce;
    input clk;
    input [63:0] hwregA;
    input match_en;
    input mrst;
    input [71:0] pipe1;
   output match;
   output XLXN_31;
   
   wire [71:0] pipe0;
   wire XLXN_21;
   wire XLXN_36;
   wire [111:0] XLXN_43;
   wire XLXN_31_DUMMY;
   wire match_DUMMY;
   
   assign match = match_DUMMY;
   assign XLXN_31 = XLXN_31_DUMMY;
   wordmatch XLXI_4 (.datacomp(hwregA[55:0]), 
                     .datain(XLXN_43[111:0]), 
                     .wildcard(hwregA[62:56]), 
                     .match(XLXN_31_DUMMY));
   FD XLXI_5 (.C(clk), 
              .D(mrst), 
              .Q(XLXN_36));
   defparam XLXI_5.INIT = 1'b0;
   FDCE XLXI_6 (.C(clk), 
                .CE(XLXN_21), 
                .CLR(XLXN_36), 
                .D(XLXN_21), 
                .Q(match_DUMMY));
   defparam XLXI_6.INIT = 1'b0;
   AND3B1 XLXI_8 (.I0(match_DUMMY), 
                  .I1(match_en), 
                  .I2(XLXN_31_DUMMY), 
                  .O(XLXN_21));
   busmerge XLXI_9 (.da(pipe0[47:0]), 
                    .db(pipe1[63:0]), 
                    .q(XLXN_43[111:0]));
   reg9B XLXI_10 (.ce(ce), 
                  .clk(clk), 
                  .clr(XLXN_36), 
                  .d(pipe1[71:0]), 
                  .q(pipe0[71:0]));
endmodule
