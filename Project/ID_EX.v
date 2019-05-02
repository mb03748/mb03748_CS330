module ID_EX
(
	input [63:0] PC_out1,
	output reg [63:0] PC_out2,
	input [63:0] ReadData1in,
	output reg [63:0] ReadData1out,
	input [63:0] ReadData2in,
	output reg [63:0] ReadData2out,
	input [63:0] imm1,
	output reg [63:0] imm2,
	input clk,
	input reset,
	input Branch1, MemRead1, MemtoReg1, MemWrite1, ALUSrc1, RegWrite1,
	output reg Branch2, MemRead2, MemtoReg2, MemWrite2, ALUSrc2, RegWrite2,
	input [1:0] ALUOp1,
	output reg [1:0] ALUOp2,
	input [4:0] Rd1,
	output reg [4:0] Rd2,
	input [3:0] Funct1,
	output reg [3:0] Funct2,
	input [4:0]Rs1in, Rs2in,
	output reg [4:0] Rs1out, Rs2out
);

	always@(posedge clk)
	begin
	if(reset == 1'b0)
		begin
		PC_out2 <= PC_out1;
		ReadData1out <= ReadData1in;
		ReadData2out <= ReadData2in;
		Branch2 <= Branch1;
		MemtoReg2 <= MemtoReg1;
		MemWrite2 <= MemWrite1;
		MemRead2 <= MemRead1;
		ALUSrc2 <= ALUSrc1;
		RegWrite2 <= RegWrite1;
		ALUOp2 <= ALUOp1;
		imm2 <= imm1;
		Rd2 <= Rd1;
		Funct2 <= Funct1;
		Rs1out <= Rs1in;
		Rs2out <= Rs2in;
		end
	end
	
	always@(reset)
	begin
		if(reset == 1'b1)
		begin
			PC_out2 <= 0;
			ReadData1out <= 0;
			ReadData2out <= 0;
			Branch2 <= 0;
			MemtoReg2 <= 0;
			MemWrite2 <= 0;
			MemRead2 <= 0;
			ALUSrc2 <= 0;
			RegWrite2 <= 0;
			ALUOp2 <= 0;
			imm2 <= 0;
			Rd2 <= 0;
			Funct2 <= 0;
			Rs1out <= 0;
			Rs2out <= 0;
		end
	end
	
endmodule