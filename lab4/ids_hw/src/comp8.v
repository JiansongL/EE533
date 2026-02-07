////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : comp8.vf
// /___/   /\     Timestamp : 02/06/2026 00:59:15
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w C:/labs/Lab3Attempt5/comp8.sch comp8.vf
//Design Name: comp8
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module comp8(A, 
             B, 
             EQ);

    input [7:0] A;
    input [7:0] B;
   output EQ;
   
   wire XLXN_18;
   wire XLXN_19;
   wire XLXN_22;
   wire XLXN_23;
   wire XLXN_24;
   wire XLXN_25;
   wire XLXN_26;
   wire XLXN_27;
   wire XLXN_28;
   wire XLXN_29;
   
   AND2 XLXI_9 (.I0(XLXN_29), 
                .I1(XLXN_28), 
                .O(EQ));
   AND4 XLXI_10 (.I0(XLXN_18), 
                 .I1(XLXN_22), 
                 .I2(XLXN_26), 
                 .I3(XLXN_27), 
                 .O(XLXN_28));
   AND4 XLXI_11 (.I0(XLXN_25), 
                 .I1(XLXN_24), 
                 .I2(XLXN_23), 
                 .I3(XLXN_19), 
                 .O(XLXN_29));
   XNOR2 XLXI_20 (.I0(B[7]), 
                  .I1(A[7]), 
                  .O(XLXN_27));
   XNOR2 XLXI_21 (.I0(B[6]), 
                  .I1(A[6]), 
                  .O(XLXN_26));
   XNOR2 XLXI_22 (.I0(B[5]), 
                  .I1(A[5]), 
                  .O(XLXN_22));
   XNOR2 XLXI_23 (.I0(B[4]), 
                  .I1(A[4]), 
                  .O(XLXN_18));
   XNOR2 XLXI_24 (.I0(B[3]), 
                  .I1(A[3]), 
                  .O(XLXN_19));
   XNOR2 XLXI_25 (.I0(B[2]), 
                  .I1(A[2]), 
                  .O(XLXN_23));
   XNOR2 XLXI_26 (.I0(B[1]), 
                  .I1(A[1]), 
                  .O(XLXN_24));
   XNOR2 XLXI_27 (.I0(B[0]), 
                  .I1(A[0]), 
                  .O(XLXN_25));
endmodule
