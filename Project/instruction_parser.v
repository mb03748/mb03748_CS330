module instruction_parser(instruction, opcode, rd, funct3, rs1, rs2, funct7);
	
	input [31:0] instruction;
	output reg [6:0] opcode;
	output reg [4:0] rd;
	output reg [2:0] funct3;
	output reg [4:0] rs1;
	output reg [4:0] rs2;
	output reg [6:0] funct7;
	
	always@(instruction)
	begin
		opcode [6:0] <= instruction[6:0];
		rd [4:0] <= instruction[11:7];
		funct3[2:0] <= instruction[14:12];
		rs1[4:0] <= instruction[19:15];
		rs2[4:0] <= instruction[24:20];
		funct7[6:0] <= instruction[31:25];
	end
endmodule