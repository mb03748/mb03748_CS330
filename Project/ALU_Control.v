module ALU_Control(ALUOp, Funct, Operation);

	input [1:0] ALUOp;
	input [3:0] Funct;
	output reg [3:0] Operation;
	
	always@(ALUOp or Funct)
	begin
		if (ALUOp == 2'b00)
			Operation = 4'b0010;
		else if (ALUOp == 2'b01)
			Operation = 4'b0110;
		else if (ALUOp == 2'b10)begin
			case(Funct)
				4'b0000: Operation = 4'b0010;
				4'b1000: Operation = 4'b0110;
				4'b0111: Operation = 4'b0000;
				4'b0110: Operation = 4'b0001;
			endcase
		end
	end
endmodule