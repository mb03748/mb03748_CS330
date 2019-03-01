module tb
(
);

	reg[4:0] Rs1;
	reg [4:0] Rs2;
	reg [4:0] Rd;
	reg RegWrite; 
	reg clk;
	reg reset;
	reg [63:0] WriteData;
	wire [63:0] ReadData1;
	wire [63:0] ReadData2;

 
  registerFile rf
  (
    .Rs1(Rs1),
    .Rs2(Rs2),
    .Rd(Rd),
    .RegWrite(RegWrite),
    .clk(clk),
    .reset(reset),
    .WriteData(WriteData),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2)
  
  );
  
  initial
    begin
      clk = 1'b0;
      Rs1 = 5'b01001;
      Rs2 = 5'b01110;
      RegWrite = 1;
      reset = 0;
      Rd = 5'b11001;
      WriteData = 64'b11010111000001010101;

    end
      
  always
  begin
      #10 clk = ~clk;
  end
    
  always
  begin

  #50 reset = ~reset;
  #70 reset = ~reset;
  #20 RegWrite = ~RegWrite;
end

always
begin 
  #100 Rs1 = 5'b10101;
  #200 Rs2 = 5'b11001;
  #250 Rd = 5'b11110;
end
  
endmodule
  