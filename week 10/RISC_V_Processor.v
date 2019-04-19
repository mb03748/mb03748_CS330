module RISC_V_Processor
  (
    input clk,
    input reset
  );
  
  wire [63:0] PC_Out;
  wire [63:0] PC_In;
  wire [63:0] out1;
  wire [63:0] imm_data;
  wire [63:0] out2;
  wire [63:0] out3;
  wire [31:0] Instruction;
 	wire [63:0] WriteData;
	wire [63:0] ReadData1;
	wire [63:0] ReadData2;
	wire [63:0] Result;
	wire [63:0] Read_Data;
  wire [6:0] opcode;
  wire [4:0] rd;
  wire [2:0] funct3;
  wire [4:0] rs1;
  wire [4:0] rs2;
  wire [6:0] funct7;
  wire [1:0] ALUOp;
  wire [3:0] Operation;
  wire Branch;
  wire MemRead;
  wire MemtoReg;
  wire MemWrite;
  wire ALUSrc;
  wire RegWrite; 
  wire sel;
  wire Zero;
  
  
  Program_Counter PC
  (
    .clk(clk),
    .reset(reset),
    .PC_In(PC_In),
    .PC_Out(PC_Out)
  );
  
  adder add
  (
    .a(PC_Out),
    .b(64'b100),
    .c(out1)  
  );
  
  adder add2
  (
    .a(PC_Out),
    .b(imm_data<<1),
    .c(out2)  
  );
  
  mux mx1
  (
    .a(out1),
    .b(out2),
    .sel(Branch & Zero),
    .data_out(PC_In)
  );  
  mux mx2
  (
    .b(Read_Data),
    .a(Result),
    .sel(MemtoReg),
    .data_out(WriteData)
  );
  
  Instruction_Memory I_M
  (
    .Inst_Address(PC_Out),
    .Instruction(Instruction)
  );
  
  instruction_parser i_p
  (
    .instruction(Instruction),
    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7)
  );
  
  Control_Unit CU
  (
    .Opcode(opcode),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .ALUOp(ALUOp),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
  );
  
  registerFile rf
  (
    .Rs1(rs1),
    .Rs2(rs2),
    .Rd(rd),
    .RegWrite(RegWrite),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2),
    .clk(clk),
    .reset(reset),
    .WriteData(WriteData)
  );
  
  immediate_data_extractor ide
  (
    .instruction(Instruction),
    .imm_data(imm_data)
  );
  
  mux mx3
  (
    .a(ReadData2),
    .b(imm_data),
    .sel(ALUSrc),
    .data_out(out3)
  );
  
  ALU_Control AC
  (
    .ALUOp(ALUOp),
    .Funct({Instruction[30],Instruction[14:12]}),
    .Operation(Operation)
  );
  
  ALU_64_bit ALU_64
  (
     .a(ReadData1),
     .b(out3),
     .ALUOp(Operation),
     .Result(Result),
     .Zero(Zero)
  );
  
  Data_Memory DM
  (
     .Mem_Addr(Result),
     .Write_Data(ReadData2),
     .clk(clk),
     .MemWrite(MemWrite),
     .MemRead(MemRead),
     .Read_Data(Read_Data)
  );
  

  
  
  
  
endmodule  