module MEM_WB
  (
     input [63:0] Result1,
     input [63:0] Read_Data1,
     input [4:0] rd1,
     input MemtoReg1,
     input RegWrite1,
     input clk,
     input reset,
     output reg [63:0] Result2,
     output reg [63:0] Read_Data2,
     output reg [4:0] rd2,
     output reg MemtoReg2,
     output reg RegWrite2     
     
  );
  
  always@(reset)
  begin 
    if(reset == 1'b1)
      begin
      Result2 <= 64'b0;
      Read_Data2 <= 64'b0;
      rd2 <= 5'b0;
      MemtoReg2 <= 1'b0;
      RegWrite2 <= 1'b0;
      end
   end
   
  always@(posedge clk)
  begin
    if(reset == 1'b0)
      begin
      Result2 <= Result1;
      Read_Data2 <= Read_Data1;
      rd2 <= rd1;
      MemtoReg2 <= MemtoReg1;
      RegWrite2 <= RegWrite1;
      end
   end
   
endmodule