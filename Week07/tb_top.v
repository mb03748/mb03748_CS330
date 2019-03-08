module tb
(
);
  reg [31:0] instruction;
	reg clk;
	reg reset;
	wire [63:0] ReadData1;
	wire [63:0] ReadData2;
	
	
	top tp
	(
		.instruction(instruction),
		.clk(clk),
		.reset(reset),
		.ReadData1(ReadData1),
		.ReadData2(ReadData2)
	);
	
	initial
		begin
			instruction = 32'b1011011_11000_01110_111_01101_1100111;
			clk = 1'b0;	
			reset = 1'b0;
			#300 reset = 1'b1;
			#350 reset = 1'b0;
			#400 instruction = 32'b1011011_11010_01010_111_01101_1110101;
		end
	always
		begin
			#5 clk = ~clk;
		end
	
endmodule