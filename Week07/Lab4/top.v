module top
( 
	input [31:0]  instruction,
	input clk,
	input reset,
	output [63:0] ReadData1,
	output [63:0] ReadData2
);

	wire [4:0] temp1;
	wire [4:0] temp2;
	wire [4:0] temp3;
	
	
	instruction_parser ip
	(
		.instruction(instruction),
		.rs1(temp1),
		.rs2(temp2),
		.rd(temp3)
	);
	
	registerFile regf
	(
		.Rs1(temp1),
		.Rs2(temp2),
		.Rd(temp3),
		.clk(clk),
		.reset(reset),
		.ReadData1(ReadData1),
		.ReadData2(ReadData2)
	);
	
endmodule