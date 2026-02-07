////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : wordmatch.vf
// /___/   /\     Timestamp : 02/06/2026 00:59:13
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w C:/labs/Lab3Attempt5/wordmatch.sch wordmatch.vf
//Design Name: wordmatch
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale  100 ps / 10 ps

module OR8_HXILINX_wordmatch (O, I0, I1, I2, I3, I4, I5, I6, I7);
    

   output O;

   input I0;
   input I1;
   input I2;
   input I3;
   input I4;
   input I5;
   input I6;
   input I7;

assign O = (I0 || I1 || I2 || I3 || I4 || I5 || I6 || I7);

endmodule
`timescale 1ns / 1ps

module wordmatch(datacomp, 
                 datain, 
                 wildcard, 
                 match);

    input [55:0] datacomp;
    input [111:0] datain;
    input [6:0] wildcard;
   output match;
   
   wire XLXN_13;
   wire XLXN_14;
   wire XLXN_15;
   wire XLXN_16;
   wire XLXN_17;
   wire XLXN_18;
   wire XLXN_19;
   wire XLXN_20;
   
   comparator XLXI_1 (.A(datacomp[55:0]), 
                      .amask(wildcard[6:0]), 
                      .B(datain[111:56]), 
                      .match(XLXN_20));
   comparator XLXI_2 (.A(datacomp[55:0]), 
                      .amask(wildcard[6:0]), 
                      .B(datain[103:48]), 
                      .match(XLXN_19));
   comparator XLXI_3 (.A(datacomp[55:0]), 
                      .amask(wildcard[6:0]), 
                      .B(datain[95:40]), 
                      .match(XLXN_15));
   comparator XLXI_4 (.A(datacomp[55:0]), 
                      .amask(wildcard[6:0]), 
                      .B(datain[87:32]), 
                      .match(XLXN_14));
   comparator XLXI_5 (.A(datacomp[55:0]), 
                      .amask(wildcard[6:0]), 
                      .B(datain[79:24]), 
                      .match(XLXN_13));
   comparator XLXI_6 (.A(datacomp[55:0]), 
                      .amask(wildcard[6:0]), 
                      .B(datain[71:16]), 
                      .match(XLXN_16));
   comparator XLXI_7 (.A(datacomp[55:0]), 
                      .amask(wildcard[6:0]), 
                      .B(datain[63:8]), 
                      .match(XLXN_17));
   comparator XLXI_8 (.A(datacomp[55:0]), 
                      .amask(wildcard[6:0]), 
                      .B(datain[55:0]), 
                      .match(XLXN_18));
   OR8_HXILINX_wordmatch XLXI_25 (.I0(XLXN_20), 
                                  .I1(XLXN_19), 
                                  .I2(XLXN_15), 
                                  .I3(XLXN_14), 
                                  .I4(XLXN_13), 
                                  .I5(XLXN_16), 
                                  .I6(XLXN_17), 
                                  .I7(XLXN_18), 
                                  .O(match));
   // synthesis attribute HU_SET of XLXI_25 is "XLXI_25_0"
endmodule
