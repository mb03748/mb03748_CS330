module ALU_1_bit

  (
   input a,
   input b,
   input CarryIn,
   input [3:0] ALUop,
   output reg Result,
   output reg CarryOut
   
   );
   
   wire mux1out;
   assign mux1out = ALUop[3] ? ~a : a;
   wire mux2out;
   assign mux2out = ALUop[2] ? ~b : b;
   
   wire Result0;
   wire Result1;
   wire [1:0] Result2;
   wire Result3;
   
   assign Result0 = mux1out & mux2out;
   assign Result1 = mux1out | mux2out;
   assign Result2 = mux1out + mux2out + CarryIn;
   assign Result3 = ~(mux1out | mux2out);
   
always @ (*)
 begin
   
   if (ALUop[1:0] == 2'b00)
     begin
        Result = Result0;
     end
   else if (ALUop[1:0] == 2'b01)
     begin 
        Result = Result1;
     end
   else if (ALUop[1:0] == 2'b10)
     begin 
        Result = Result2[0];
        CarryOut = Result2[1];
     end  
end


endmodule
   
   
   
