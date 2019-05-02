module Data_Memory(
	input [63:0] Mem_Addr,
	input [63:0] Write_Data,
	input wire clk, MemWrite, MemRead,
	output reg [63:0] Read_Data
);
	reg [7:0] data_mem [63:0];
	
	initial
	begin
	data_mem[0] = 8'd0;
	data_mem[1] = 8'd1;
	data_mem[2] = 8'd2;
	data_mem[3] = 8'd3;
	data_mem[4] = 8'd4;
	data_mem[5] = 8'd5;
	data_mem[6] = 8'd6;
	data_mem[7] = 8'd7;
	data_mem[8] = 8'd8;
	data_mem[9] = 8'd9;
	data_mem[10] = 8'd10;
	data_mem[11] = 8'd11;
	data_mem[12] = 8'd12;
	data_mem[13] = 8'd13;
	data_mem[14] = 8'd14;
	data_mem[15] = 8'd15;
	data_mem[16] = 8'd16;
	data_mem[17] = 8'd17;
	data_mem[18] = 8'd18;
	data_mem[19] = 8'd19;
	data_mem[20] = 8'd20;
	data_mem[21] = 8'd21;
	data_mem[22] = 8'd22;
	data_mem[23] = 8'd23;
	data_mem[24] = 8'd24;
	data_mem[25] = 8'd25;
	data_mem[26] = 8'd26;
	data_mem[27] = 8'd27;
	data_mem[28] = 8'd28;
	data_mem[29] = 8'd29;
	data_mem[30] = 8'd30;
	data_mem[31] = 8'd31;
	data_mem[32] = 8'd32;
	data_mem[33] = 8'd33;
	data_mem[34] = 8'd34;
	data_mem[35] = 8'd35;
	data_mem[36] = 8'd36;
	data_mem[37] = 8'd37;
	data_mem[38] = 8'd38;
	data_mem[39] = 8'd39;
	data_mem[40] = 8'd40;
	data_mem[41] = 8'd41;
	data_mem[42] = 8'd42;
	data_mem[43] = 8'd43;
	data_mem[44] = 8'd44;
	data_mem[45] = 8'd45;
	data_mem[46] = 8'd46;
	data_mem[47] = 8'd47;
	data_mem[48] = 8'd48;
	data_mem[49] = 8'd49;
	data_mem[50] = 8'd50;
	data_mem[51] = 8'd51;
	data_mem[52] = 8'd52;
	data_mem[53] = 8'd53;
	data_mem[54] = 8'd54;
	data_mem[55] = 8'd55;
	data_mem[56] = 8'd56;
	data_mem[57] = 8'd57;
	data_mem[58] = 8'd58;
	data_mem[59] = 8'd59;
	data_mem[60] = 8'd60;
	data_mem[61] = 8'd61;
	data_mem[62] = 8'd62;
	data_mem[63] = 8'd63;
	end
	
	integer j;		//iterator in for loop
	integer k = 0;	//to skip 7 bits already selected
	always@(posedge clk)
	begin
	  if (MemWrite == 1)
		data_mem[Mem_Addr]=Write_Data[7:0];
		data_mem[Mem_Addr+1]=Write_Data[15:8];
		data_mem[Mem_Addr+2]=Write_Data[23:16];
		data_mem[Mem_Addr+3]=Write_Data[31:24];
		data_mem[Mem_Addr+4]=Write_Data[39:32];
		data_mem[Mem_Addr+5]=Write_Data[47:40];
		data_mem[Mem_Addr+6]=Write_Data[55:48];
		data_mem[Mem_Addr+7]=Write_Data[63:56];
	  
	end
	always@(Mem_Addr)
	begin
	  if (MemRead == 1)
  		  Read_Data = {data_mem[Mem_Addr+7],data_mem[Mem_Addr+6],data_mem[Mem_Addr+5],data_mem[Mem_Addr+4], data_mem[Mem_Addr+3], data_mem[Mem_Addr+2], data_mem[Mem_Addr+1], data_mem[Mem_Addr]};
	end	
		
endmodule

	