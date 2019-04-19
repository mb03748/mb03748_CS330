module Instruction_Memory
  (
  input [63:0] Inst_Address,
  output reg [31:0] Instruction
  );
  
  reg [7:0] mem [15:0]; 
  
  initial
  begin
    mem[0] = 8'b10000011;
    mem[1] = 8'b00110100;
    mem[2] = 8'b10000101;
    mem[3] = 8'b00000010;
    mem[4] = 8'b10110011;
    mem[5] = 8'b10000100;
    mem[6] = 8'b10011010;
    mem[7] = 8'b00000000;
    mem[8] = 8'b10010011;
    mem[9] = 8'b10000100;
    mem[10] = 8'b00010100;
    mem[11] = 8'b00000000;
    mem[12] = 8'b00100011;
    mem[13] = 8'b00110100;
    mem[14] = 8'b10010101;
    mem[15] = 8'b00000010;
  end

  always@(Inst_Address)
  begin
    case(Inst_Address)
    64'd12: Instruction = {mem[15], mem[14], mem[13], mem[12]};
    64'd8: Instruction = {mem[11], mem[10], mem[9], mem[8]};
    64'd4: Instruction = {mem[7], mem[6], mem[5], mem[4]};
    64'd0: Instruction = {mem[3], mem[2], mem[1], mem[0]};
    endcase
end
endmodule   
  