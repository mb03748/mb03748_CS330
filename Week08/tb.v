module tb
  (  
  );
  
  reg clk;
  reg reset;
  wire [31:0] Instruction;
  
  Instruction_Fetch IF
  (
     .clk(clk),
     .reset(reset),
     .Instruction(Instruction)
  );
  
  initial 
  begin
    clk = 1'b0;
    reset = 1'b0;
    #10	reset = ~reset;
	#5	reset = ~reset;
  end
  
  always
  begin
    #10 clk = ~clk;
    /*#300 reset = 1'b1;
    #320 reset = 1'b0;*/
  end  
  
endmodule