module tb
  (

  );
    reg clk;
    reg reset;
  
  RISC_V_Processor RISC
  (
    .clk(clk),
    .reset(reset)
  );
  
  always 
  #10 clk = ~clk;
  
  initial 
  begin
    clk = 1'b0;
    reset = 1'b1;
    #10 reset = ~reset;
  end
  
endmodule