////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : dropfifo.vf
// /___/   /\     Timestamp : 01/31/2026 18:33:34
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w Z:/lab/lab3/lab3/dropfifo.sch dropfifo.vf
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
`timescale  100 ps / 10 ps

module COMP8_HXILINX_dropfifo (EQ, A, B);
    

   output EQ;

   input  [7:0] A;
   input  [7:0] B;

   assign EQ = (A==B) ;

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
   
   wire XLXN_6;
   wire XLXN_7;
   wire XLXN_8;
   wire XLXN_16;
   wire [0:0] XLXN_17;
   wire XLXN_19;
   wire [71:0] XLXN_20;
   wire [7:0] XLXN_31;
   wire [7:0] XLXN_32;
   wire XLXN_36;
   wire XLXN_37;
   wire XLXN_38;
   wire [7:0] XLXN_40;
   wire XLXN_41;
   
   sync_dual_port XLXI_1 (.addra(XLXN_40[7:0]), 
                          .addrb(XLXN_32[7:0]), 
                          .clka(clk), 
                          .clkb(clk), 
                          .dina(XLXN_20[71:0]), 
                          .wea(XLXN_17[0]), 
                          .doutb(out_fifo[71:0]));
   FD XLXI_2 (.C(clk), 
              .D(firstword), 
              .Q(XLXN_7));
   defparam XLXI_2.INIT = 1'b0;
   FD XLXI_3 (.C(clk), 
              .D(lastword), 
              .Q(XLXN_8));
   defparam XLXI_3.INIT = 1'b0;
   FD XLXI_4 (.C(clk), 
              .D(fifowrite), 
              .Q(XLXN_17[0]));
   defparam XLXI_4.INIT = 1'b0;
   FD XLXI_5 (.C(clk), 
              .D(drop_pkt), 
              .Q(XLXN_16));
   defparam XLXI_5.INIT = 1'b0;
   OR2 XLXI_6 (.I0(XLXN_8), 
               .I1(XLXN_7), 
               .O(XLXN_6));
   AND2B1 XLXI_7 (.I0(XLXN_16), 
                  .I1(XLXN_6), 
                  .O(XLXN_19));
   CB8CLE_HXILINX_dropfifo XLXI_8 (.C(clk), 
                                   .CE(XLXN_17[0]), 
                                   .CLR(rst), 
                                   .D(XLXN_31[7:0]), 
                                   .L(XLXN_16), 
                                   .CEO(), 
                                   .Q(XLXN_40[7:0]), 
                                   .TC());
   // synthesis attribute HU_SET of XLXI_8 is "XLXI_8_0"
   COMP8_HXILINX_dropfifo XLXI_11 (.A(XLXN_40[7:0]), 
                                   .B(XLXN_32[7:0]), 
                                   .EQ(XLXN_36));
   // synthesis attribute HU_SET of XLXI_11 is "XLXI_11_1"
   COMP8_HXILINX_dropfifo XLXI_12 (.A(XLXN_32[7:0]), 
                                   .B(XLXN_31[7:0]), 
                                   .EQ(XLXN_37));
   // synthesis attribute HU_SET of XLXI_12 is "XLXI_12_2"
   FDC XLXI_13 (.C(clk), 
                .CLR(rst), 
                .D(XLXN_38), 
                .Q(valid_data));
   defparam XLXI_13.INIT = 1'b0;
   reg9B XLXI_14 (.ce(XLXN_41), 
                  .clk(clk), 
                  .clr(rst), 
                  .d(in_fifo[71:0]), 
                  .q(XLXN_20[71:0]));
   FD8CE_HXILINX_dropfifo XLXI_15 (.C(clk), 
                                   .CE(XLXN_19), 
                                   .CLR(rst), 
                                   .D(XLXN_40[7:0]), 
                                   .Q(XLXN_31[7:0]));
   // synthesis attribute HU_SET of XLXI_15 is "XLXI_15_3"
   CB8CE_HXILINX_dropfifo XLXI_17 (.C(rst), 
                                   .CE(XLXN_38), 
                                   .CLR(rst), 
                                   .CEO(), 
                                   .Q(XLXN_32[7:0]), 
                                   .TC());
   // synthesis attribute HU_SET of XLXI_17 is "XLXI_17_4"
   AND3B2 XLXI_18 (.I0(XLXN_37), 
                   .I1(XLXN_36), 
                   .I2(fiforead), 
                   .O(XLXN_38));
   VCC XLXI_21 (.P(XLXN_41));
endmodule
