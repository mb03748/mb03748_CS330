module Instruction_Memory
  (
  input [63:0] Inst_Address,
  output reg [31:0] Instruction
  );
  
  reg [7:0] mem [15:0]; 
  
  initial
  begin
    mem[0] = 8'b01010110;
    mem[1] = 8'b10010010;
    mem[2] = 8'b01110111;
    mem[3] = 8'b00011100;
    mem[4] = 8'b11010111;
    mem[5] = 8'b01010000;
    mem[6] = 8'b11111010;
    mem[7] = 8'b11111111;
    mem[8] = 8'b11000000;
    mem[9] = 8'b01111111;
    mem[10] = 8'b01010100;
    mem[11] = 8'b01010010;
    mem[12] = 8'b11000110;
    mem[13] = 8'b11000111;
    mem[14] = 8'b10101010;
    mem[15] = 8'b11011110;
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
  