////////////////////////////////////////////////////////////////////////////////
// Dual-Port RAM for NetFPGA (Virtex-2 Pro compatible)
// Behavioral implementation that infers Block RAM
// Replaces Spartan-3 IP core for NetFPGA compatibility
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module dualportmem(
	clka,
	dina,
	addra,
	wea,
	clkb,
	addrb,
	doutb);

input clka;
input [71:0] dina;
input [7:0] addra;
input [0:0] wea;
input clkb;
input [7:0] addrb;
output reg [71:0] doutb;

// Dual-port RAM array: 256 locations x 72 bits
(* ram_style = "block" *) reg [71:0] ram [255:0];

// Port A: Write port
always @(posedge clka) begin
    if (wea[0])
        ram[addra] <= dina;
end

// Port B: Read port with output register
always @(posedge clkb) begin
    doutb <= ram[addrb];
end

endmodule

