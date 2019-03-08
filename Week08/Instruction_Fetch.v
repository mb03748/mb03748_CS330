module Instruction_Fetch
  (
    input clk,
    input reset,
    output [31:0] Instruction
  
  );
  
    wire [63:0] PC_Out;
    wire [63:0] Address;
    
  Program_Counter PC
  (
    .clk(clk),
    .reset(reset),
    .PC_In(Address),
    .PC_Out(PC_Out)  
  );
  
   adder add
   (
     .a(PC_Out),
     .b(64'd4),
     .c(Address)
   );
   
   Instruction_Memory IM
   (
     .Inst_Address(PC_Out),
     .Instruction(Instruction)
   );
   
endmodule
