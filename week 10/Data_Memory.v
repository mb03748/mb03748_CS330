module Data_Memory(
	input [63:0] Mem_Addr,
	input [63:0] Write_Data,
	input wire clk, 
	input wire MemWrite, 
	input wire MemRead,
	output reg [63:0] Read_Data
);
	reg [7:0] DM [63:0];
	
	integer i;
	initial
	begin
	for (i = 0; i < 64; i = i + 1)
		DM[i] <= i + 2;
	end
	
	integer j;
	integer k = 0;
	always@(posedge clk)
	begin
	  if (MemWrite == 1)
		  for (j = 0; j < 8; j = j + 1)
				 DM[j] <= Write_Data[j+k+7-:7];    // This is picking 7 bits before j+7+k, in other words 7 bits in a perticular row.
				 k = k+7;
	end
	always@(Mem_Addr)
	begin
	  if (MemRead == 1)
  		  Read_Data = {DM[Mem_Addr+7],DM[Mem_Addr+6],DM[Mem_Addr+5],DM[Mem_Addr+4], DM[Mem_Addr+3], DM[Mem_Addr+2], DM[Mem_Addr+1], DM[Mem_Addr]};
	end	
		
endmodule

	