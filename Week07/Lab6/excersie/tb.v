module tb
(
);

	reg [63:0] Mem_Addr;
	reg [63:0] Write_Data;
	reg clk;
	reg MemWrite;
	reg MemRead;
	wire [63:0] Read_Data;
	
	Data_Memory DM
	(
		.Mem_Addr(Mem_Addr),
		.Write_Data(Write_Data),
		.clk(clk),
		.MemWrite(MemWrite),
		.MemRead(MemRead),
		.Read_Data(Read_Data)
	);
	
	initial
	begin
		Mem_Addr = 64'd0;
		#10
		Mem_Addr = 64'd8;
		#10
		Mem_Addr = 64'd16;
	end
	
endmodule