////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : comparator.vf
// /___/   /\     Timestamp : 01/31/2026 00:40:21
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w Z:/lab/lab3/lab3/comparator.sch comparator.vf
//Design Name: comparator
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale  100 ps / 10 ps

module COMP8_HXILINX_comparator (EQ, A, B);
    

   output EQ;

   input  [7:0] A;
   input  [7:0] B;

   assign EQ = (A==B) ;

endmodule
`timescale  100 ps / 10 ps

module AND7_HXILINX_comparator (O, I0, I1, I2, I3, I4, I5, I6);
    

   output O;

   input I0;
   input I1;
   input I2;
   input I3;
   input I4;
   input I5;
   input I6;

assign O = I0 && I1 && I2 && I3 && I4 && I5 && I6;

endmodule
`timescale 1ns / 1ps

module comparator(a, 
                  amask, 
                  b, 
                  match);

    input [55:0] a;
    input [6:0] amask;
    input [55:0] b;
   output match;
   
   wire XLXN_1;
   wire XLXN_2;
   wire XLXN_3;
   wire XLXN_4;
   wire XLXN_23;
   wire XLXN_24;
   wire XLXN_25;
   wire XLXN_26;
   wire XLXN_27;
   wire XLXN_28;
   wire XLXN_29;
   wire XLXN_30;
   wire XLXN_31;
   wire XLXN_32;
   
   COMP8_HXILINX_comparator XLXI_1 (.A(a[55:48]), 
                                    .B(b[55:48]), 
                                    .EQ(XLXN_1));
   // synthesis attribute HU_SET of XLXI_1 is "XLXI_1_0"
   COMP8_HXILINX_comparator XLXI_2 (.A(a[47:40]), 
                                    .B(b[47:40]), 
                                    .EQ(XLXN_2));
   // synthesis attribute HU_SET of XLXI_2 is "XLXI_2_1"
   COMP8_HXILINX_comparator XLXI_3 (.A(a[39:32]), 
                                    .B(b[39:32]), 
                                    .EQ(XLXN_3));
   // synthesis attribute HU_SET of XLXI_3 is "XLXI_3_2"
   COMP8_HXILINX_comparator XLXI_4 (.A(a[31:24]), 
                                    .B(b[31:24]), 
                                    .EQ(XLXN_4));
   // synthesis attribute HU_SET of XLXI_4 is "XLXI_4_3"
   OR2B1 XLXI_5 (.I0(amask[6]), 
                 .I1(XLXN_1), 
                 .O(XLXN_26));
   OR2B1 XLXI_6 (.I0(amask[5]), 
                 .I1(XLXN_2), 
                 .O(XLXN_27));
   OR2B1 XLXI_7 (.I0(amask[4]), 
                 .I1(XLXN_3), 
                 .O(XLXN_28));
   OR2B1 XLXI_8 (.I0(amask[3]), 
                 .I1(XLXN_4), 
                 .O(XLXN_29));
   AND7_HXILINX_comparator XLXI_9 (.I0(XLXN_32), 
                                   .I1(XLXN_31), 
                                   .I2(XLXN_30), 
                                   .I3(XLXN_29), 
                                   .I4(XLXN_28), 
                                   .I5(XLXN_27), 
                                   .I6(XLXN_26), 
                                   .O(match));
   // synthesis attribute HU_SET of XLXI_9 is "XLXI_9_4"
   COMP8_HXILINX_comparator XLXI_10 (.A(a[23:16]), 
                                     .B(b[23:16]), 
                                     .EQ(XLXN_23));
   // synthesis attribute HU_SET of XLXI_10 is "XLXI_10_5"
   COMP8_HXILINX_comparator XLXI_11 (.A(a[15:8]), 
                                     .B(b[15:8]), 
                                     .EQ(XLXN_24));
   // synthesis attribute HU_SET of XLXI_11 is "XLXI_11_6"
   COMP8_HXILINX_comparator XLXI_12 (.A(a[7:0]), 
                                     .B(b[7:0]), 
                                     .EQ(XLXN_25));
   // synthesis attribute HU_SET of XLXI_12 is "XLXI_12_7"
   OR2B1 XLXI_13 (.I0(amask[2]), 
                  .I1(XLXN_23), 
                  .O(XLXN_30));
   OR2B1 XLXI_14 (.I0(amask[1]), 
                  .I1(XLXN_24), 
                  .O(XLXN_31));
   OR2B1 XLXI_15 (.I0(amask[0]), 
                  .I1(XLXN_25), 
                  .O(XLXN_32));
endmodule
