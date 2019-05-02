module Instruction_Memory(
	Inst_Address, Instruction
);

	input [63:0] Inst_Address;
	output reg [31:0] Instruction;
	reg [7:0] ins_mem [15:0];
	initial
	begin
	ins_mem[0] = 8'b00110011;
	ins_mem[1] = 8'b10000010;
	ins_mem[2] = 8'b01100010;
	ins_mem[3] = 8'b00000000;
	ins_mem[4] = 8'b00110011;
	ins_mem[5] = 8'b00000100;
	ins_mem[6] = 8'b00110010;
	ins_mem[7] = 8'b01000000;
	ins_mem[8] = 8'b10110011;
	ins_mem[9] = 8'b00000011;
	ins_mem[10] = 8'b01000100;
	ins_mem[11] = 8'b00000000;
	ins_mem[12] = 8'b10110011;
	ins_mem[13] = 8'b10000100;
	ins_mem[14] = 8'b01100010;
	ins_mem[15] = 8'b00000000;
	end
	
	always@(Inst_Address)
	begin
		case(Inst_Address)
		64'd0: Instruction = {ins_mem[3], ins_mem[2], ins_mem[1], ins_mem[0]};
		64'd4: Instruction = {ins_mem[7], ins_mem[6], ins_mem[5], ins_mem[4]};
		64'd8: Instruction = {ins_mem[11], ins_mem[10], ins_mem[9], ins_mem[8]};
		64'd12: Instruction = {ins_mem[15], ins_mem[14], ins_mem[13], ins_mem[12]};
		endcase
end

endmodule