module tb
(
  
);

   reg a;
   reg b;
   reg CarryIn;
   reg [3:0] ALUop;
   wire Result;
   wire CarryOut;
   
   
   ALU_1_bit ALU1
  (
   .a(a),
   .b(b),
   .CarryIn(CarryIn),
   .ALUop(ALUop),
   .Result(Result),
   .CarryOut(CarryOut)
   );
   
  initial
  begin
   a = 1;
   b = 0;
   ALUop = 4'b0001;
   CarryIn = 0;
  end
  
endmodule
  
   