module AC_tb
  (
  );
  
  reg [1:0] ALUOp;
  reg [3:0] Funct;
  wire [3:0] Operation;
  
  

ALU_Control AC

(
   .ALUOp(ALUOp),
   .Funct(Funct),
   .Operation(Operation)
);

initial 
begin
  ALUOp = 2'b00;
  Funct = 4'b0000;
  #20
  ALUOp = 2'b01;
  #20
  ALUOp = 2'b10;
  #20
  Funct = 4'b1000;
  #20
  Funct = 4'b0111;
  #20
  Funct = 4'b0110;
  
end
endmodule