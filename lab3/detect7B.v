////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : detect7B.vf
// /___/   /\     Timestamp : 01/31/2026 00:40:23
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w Z:/lab/lab3/lab3/detect7B.sch detect7B.vf
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
                match);

    input ce;
    input clk;
    input [63:0] hwregA;
    input match_en;
    input mrst;
    input [71:0] pipe1;
   output match;
   
   wire [71:0] pipe0;
   wire [111:0] XLXN_67;
   wire XLXN_70;
   wire XLXN_73;
   wire XLXN_77;
   wire match_DUMMY;
   
   assign match = match_DUMMY;
   reg9B XLXI_19 (.ce(ce), 
                  .clk(clk), 
                  .clr(XLXN_73), 
                  .d(pipe1[71:0]), 
                  .q(pipe0[71:0]));
   busmerge XLXI_20 (.da(pipe0[47:0]), 
                     .db(pipe1[63:0]), 
                     .q(XLXN_67[111:0]));
   AND3B1 XLXI_22 (.I0(match_DUMMY), 
                   .I1(match_en), 
                   .I2(XLXN_70), 
                   .O(XLXN_77));
   FD XLXI_23 (.C(clk), 
               .D(mrst), 
               .Q(XLXN_73));
   defparam XLXI_23.INIT = 1'b0;
   FDCE XLXI_24 (.C(clk), 
                 .CE(XLXN_77), 
                 .CLR(XLXN_73), 
                 .D(XLXN_77), 
                 .Q(match_DUMMY));
   defparam XLXI_24.INIT = 1'b0;
   wordmatch XLXI_26 (.datacomp(hwregA[55:0]), 
                      .datain(XLXN_67[111:0]), 
                      .wildcard(hwregA[62:56]), 
                      .match(XLXN_70));
endmodule
