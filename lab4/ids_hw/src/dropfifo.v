////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : dropfifo.vf
// /___/   /\     Timestamp : 02/06/2026 00:59:17
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w C:/labs/Lab3Attempt5/dropfifo.sch dropfifo.vf
//Design Name: dropfifo
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 100 ps / 10 ps

module FD8CE_HXILINX_dropfifo(Q, C, CE, CLR, D);

   
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
`timescale 100 ps / 10 ps

module CB8CLE_HXILINX_dropfifo(CEO, Q, TC, C, CE, CLR, D, L);
   
   parameter TERMINAL_COUNT = 8'b1111_1111;
   
   output             CEO;
   output [7:0]       Q;
   output             TC;

   input 	      C;	
   input 	      CE;	
   input 	      CLR;	
   input  [7:0]       D;
   input              L;
   
   reg    [7:0]       Q;
   
   always @(posedge C or posedge CLR)
     begin
	if (CLR)
	  Q <= 8'b0000_0000;
        else if (L)
          Q <= D;
	else if (CE)
	  Q <= Q + 1;
     end
   
   assign CEO = TC & CE;
   assign TC = Q == TERMINAL_COUNT;
   
endmodule
`timescale 100 ps / 10 ps

module CB8CE_HXILINX_dropfifo(CEO, Q, TC, C, CE, CLR);
   
   parameter TERMINAL_COUNT = 8'b1111_1111;
   
   output             CEO;
   output [7:0]       Q;
   output             TC;

   input 	      C;	
   input 	      CE;	
   input 	      CLR;	
   
   reg   [7:0]        Q;
   
   always @(posedge C or posedge CLR)
     begin
	if (CLR)
	  Q <= 8'b0000_0000;
	else if (CE)
	  Q <= Q + 1;
     end
   
   assign CEO = TC & CE;
   assign TC = Q == TERMINAL_COUNT;
   
endmodule
`timescale 1ns / 1ps

module comp8_MUSER_dropfifo(A, 
                            B, 
                            EQ);

    input [7:0] A;
    input [7:0] B;
   output EQ;
   
   wire AB0;
   wire AB1;
   wire AB2;
   wire AB3;
   wire AB4;
   wire AB5;
   wire AB6;
   wire AB7;
   wire AB03;
   wire AB47;
   
   AND4 I_36_32 (.I0(AB7), 
                 .I1(AB6), 
                 .I2(AB5), 
                 .I3(AB4), 
                 .O(AB47));
   XNOR2 I_36_33 (.I0(B[6]), 
                  .I1(A[6]), 
                  .O(AB6));
   XNOR2 I_36_34 (.I0(B[7]), 
                  .I1(A[7]), 
                  .O(AB7));
   XNOR2 I_36_35 (.I0(B[5]), 
                  .I1(A[5]), 
                  .O(AB5));
   XNOR2 I_36_36 (.I0(B[4]), 
                  .I1(A[4]), 
                  .O(AB4));
   AND4 I_36_41 (.I0(AB3), 
                 .I1(AB2), 
                 .I2(AB1), 
                 .I3(AB0), 
                 .O(AB03));
   XNOR2 I_36_42 (.I0(B[2]), 
                  .I1(A[2]), 
                  .O(AB2));
   XNOR2 I_36_43 (.I0(B[3]), 
                  .I1(A[3]), 
                  .O(AB3));
   XNOR2 I_36_44 (.I0(B[1]), 
                  .I1(A[1]), 
                  .O(AB1));
   XNOR2 I_36_45 (.I0(B[0]), 
                  .I1(A[0]), 
                  .O(AB0));
   AND2 I_36_50 (.I0(AB47), 
                 .I1(AB03), 
                 .O(EQ));
endmodule
`timescale 1ns / 1ps

module dropfifo(clk, 
                drop_pkt, 
                fiforead, 
                fifowrite, 
                firstword, 
                in_fifo, 
                lastword, 
                rst, 
                out_fifo, 
                valid_data);

    input clk;
    input drop_pkt;
    input fiforead;
    input fifowrite;
    input firstword;
    input [71:0] in_fifo;
    input lastword;
    input rst;
   output [71:0] out_fifo;
   output valid_data;
   
   wire [71:0] in_fifo0;
   wire XLXN_24;
   wire XLXN_25;
   wire [7:0] XLXN_27;
   wire [7:0] XLXN_28;
   wire XLXN_29;
   wire XLXN_31;
   wire XLXN_32;
   wire XLXN_35;
   wire XLXN_36;
   wire [7:0] XLXN_87;
   wire XLXN_89;
   wire XLXN_92;
   wire XLXN_94;
   
   FD XLXI_1 (.C(clk), 
              .D(firstword), 
              .Q(XLXN_24));
   defparam XLXI_1.INIT = 1'b0;
   FD XLXI_2 (.C(clk), 
              .D(lastword), 
              .Q(XLXN_25));
   defparam XLXI_2.INIT = 1'b0;
   FD XLXI_3 (.C(clk), 
              .D(drop_pkt), 
              .Q(XLXN_36));
   defparam XLXI_3.INIT = 1'b0;
   FD8CE_HXILINX_dropfifo XLXI_4 (.C(clk), 
                                  .CE(XLXN_35), 
                                  .CLR(rst), 
                                  .D(XLXN_28[7:0]), 
                                  .Q(XLXN_87[7:0]));
   // synthesis attribute HU_SET of XLXI_4 is "XLXI_4_0"
   OR2 XLXI_5 (.I0(XLXN_25), 
               .I1(XLXN_24), 
               .O(XLXN_32));
   comp8_MUSER_dropfifo XLXI_6 (.A(XLXN_28[7:0]), 
                                .B(XLXN_27[7:0]), 
                                .EQ(XLXN_29));
   comp8_MUSER_dropfifo XLXI_7 (.A(XLXN_27[7:0]), 
                                .B(XLXN_87[7:0]), 
                                .EQ(XLXN_31));
   FD XLXI_10 (.C(clk), 
               .D(fifowrite), 
               .Q(XLXN_89));
   defparam XLXI_10.INIT = 1'b0;
   AND2B1 XLXI_11 (.I0(XLXN_36), 
                   .I1(XLXN_32), 
                   .O(XLXN_35));
   AND3B2 XLXI_12 (.I0(XLXN_31), 
                   .I1(XLXN_29), 
                   .I2(fiforead), 
                   .O(XLXN_92));
   CB8CLE_HXILINX_dropfifo XLXI_15 (.C(clk), 
                                    .CE(XLXN_89), 
                                    .CLR(rst), 
                                    .D(XLXN_87[7:0]), 
                                    .L(XLXN_36), 
                                    .CEO(), 
                                    .Q(XLXN_28[7:0]), 
                                    .TC());
   // synthesis attribute HU_SET of XLXI_15 is "XLXI_15_1"
   CB8CE_HXILINX_dropfifo XLXI_16 (.C(clk), 
                                   .CE(XLXN_92), 
                                   .CLR(rst), 
                                   .CEO(), 
                                   .Q(XLXN_27[7:0]), 
                                   .TC());
   // synthesis attribute HU_SET of XLXI_16 is "XLXI_16_2"
   FDC XLXI_17 (.C(clk), 
                .CLR(rst), 
                .D(XLXN_92), 
                .Q(valid_data));
   defparam XLXI_17.INIT = 1'b0;
   reg9B XLXI_49 (.ce(XLXN_94), 
                  .clk(clk), 
                  .clr(rst), 
                  .d(in_fifo[71:0]), 
                  .q(in_fifo0[71:0]));
   VCC XLXI_54 (.P(XLXN_94));
   dualportmem XLXI_55 (.addra(XLXN_28[7:0]), 
                        .addrb(XLXN_27[7:0]), 
                        .clka(clk), 
                        .clkb(clk), 
                        .dina(in_fifo0[71:0]), 
                        .wea(XLXN_89), 
                        .doutb(out_fifo[71:0]));
endmodule
