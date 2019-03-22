module top_control
  (
   input [6:0] Opcode,
   input [3:0] Funct,
   output Branch,
   output MemRead,
   output MemtoReg,
   output MemWrite,
   output ALUSrc,
   output RegWrite,
   output [3:0] Operation
  );
  
  wire [1:0] temp;
  
  
 Control_Unit CU
 (
    .Opcode(Opcode),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .ALUOp(temp),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
 ); 
 
 ALU_Control AC

(
   .ALUOp(temp),
   .Funct(Funct),
   .Operation(Operation)
);
 
endmodule
 
 