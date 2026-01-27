// Verilog test fixture created from schematic Z:\lab3\lab2\ALU_32_bit.sch - Mon Jan 26 22:45:15 2026

`timescale 1ns / 1ps

module ALU_32bit (
    input  wire [31:0] A,
    input  wire [31:0] B,
    input  wire [2:0]  ALUControl,
    output reg  [31:0] Result,
    output wire        Zero
);

    always @(*) begin
        case (ALUControl)
            3'b000: Result = A + B;                
            3'b001: Result = A - B;                
            3'b010: Result = A & B;                
            3'b011: Result = A | B;                
            3'b100: Result = A ^ B;                
            
            default: Result = 32'd0;
        endcase
    end

    // Zero flag
    assign Zero = (Result == 32'd0);

endmodule

