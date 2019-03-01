
module registerFile
(
	input [4:0] Rs1,
	input [4:0] Rs2,
	input [4:0] Rd,
	input RegWrite, 
	input clk,
	input reset,
	input [63:0] WriteData,
	output reg [63:0] ReadData1,
	output reg [63:0] ReadData2
);

reg [63:0] Registers [31:0];

initial
  begin 
    Registers[0] = 64'hAD73;
    Registers[1] = 64'hB32;
    Registers[2] = 64'hC10;
    Registers[3] = 64'h9E4;
    Registers[4] = 64'hC23;
    Registers[5] = 64'hBB1;
    Registers[6] = 64'h7344;
    Registers[7] = 64'hD47;
    Registers[8] = 64'hB58;
    Registers[9] = 64'hCC4;
    Registers[10] = 64'hA10;
    Registers[11] = 64'hF11;
    Registers[12] = 64'hB12;
    Registers[13] = 64'hE13;
    Registers[14] = 64'hA14;
    Registers[15] = 64'hE15;
    Registers[16] = 64'hBA16;
    Registers[17] = 64'hCA17;
    Registers[18] = 64'hFA18;
    Registers[19] = 64'hBC19;
    Registers[20] = 64'hDA20;
    Registers[21] = 64'hBA21;
    Registers[22] = 64'hFF22;
    Registers[23] = 64'hE23;
    Registers[24] = 64'hCA24;
    Registers[25] = 64'hAB25;
    Registers[26] = 64'hAA26;
    Registers[27] = 64'hE27;
    Registers[28] = 64'hDC28;
    Registers[29] = 64'hBC29;
    Registers[30] = 64'hAC30;
    Registers[31] = 64'hFC31;
  end
  
  always@ (posedge clk)
  begin
    if (RegWrite == 1)
      begin
        Registers[Rd] = WriteData;
      end
  end
  
  always@ (Rs1, Rs2, reset)
  begin
    ReadData1 = Rs1;
    ReadData2 = Rs2;
    if (reset == 1)
      begin
        ReadData1 = 64'b0;
        ReadData2 = 64'b0;
      end
  end
      
    
  
endmodule