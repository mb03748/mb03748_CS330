module tb
  (
  );
  
  reg [63:0] Inst_Address;
  wire [31:0] Instruction;
  
  Instruction_Memory mem
  (
    .Inst_Address(Inst_Address),
    .Instruction(Instruction)
  );
  
  initial
  begin
     
     assign Inst_Address = 64'd0;
     #30
     assign Inst_Address = 64'd4;
     #30
     assign Inst_Address = 64'd8;
     #30
     assign Inst_Address = 64'd12;
  end
  
endmodule