module registerFile(rs1, rs2, rd, WriteData, RegWrite, clk, reset, ReadData1, ReadData2);

	input [4:0] rs1;
	input  [4:0] rs2;
	input [4:0] rd;
	input  [63:0] WriteData;
	input  RegWrite, clk, reset;
	output reg [63:0] ReadData1;
	output reg [63:0] ReadData2;
	reg [63:0] Registers [31:0];
initial
begin	
Registers[0] = 64'd0;
Registers[1] = 64'd1;
Registers[2] = 64'd2;
Registers[3] = 64'd3;
Registers[4] = 64'd4;
Registers[5] = 64'd5;
Registers[6] = 64'd6;
Registers[7] = 64'd7;
Registers[8] = 64'd8;
Registers[9] = 64'd9;
Registers[10] = 64'd10;
Registers[11] = 64'd11;
Registers[12] = 64'd12;
Registers[13] = 64'd13;
Registers[14] = 64'd14;
Registers[15] = 64'd15;
Registers[16] = 64'd16;
Registers[17] = 64'd17;
Registers[18] = 64'd18;
Registers[19] = 64'd19;
Registers[20] = 64'd20;
Registers[21] = 64'd21;
Registers[22] = 64'd22;
Registers[23] = 64'd23;
Registers[24] = 64'd24;
Registers[25] = 64'd25;
Registers[26] = 64'd26;
Registers[27] = 64'd27;
Registers[28] = 64'd28;
Registers[29] = 64'd29;
Registers[30] = 64'd30;
Registers[31] = 64'd31;
end
	always@(rs1 or rs2 or reset)
	begin
		if (reset == 1)
		  begin
			ReadData1 <= 64'h0000000000000000;
			ReadData2 <= 64'h0000000000000000;
		  end	
		else
		  begin
			ReadData1 <= Registers[rs1];
			ReadData2 <= Registers[rs2];
		  end
	end
	
	always@(posedge clk)
	begin
		if (RegWrite == 1 & rd != 5'd0)
			Registers[rd] = WriteData;
	end

endmodule