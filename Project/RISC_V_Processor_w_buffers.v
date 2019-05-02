module RISC_V_Processor_Pipelined(clk, reset);

	input wire clk, reset;
	wire [63:0] mux2PC_In, PC_Out, PC_Out1, PC_Out2, PC_inc4_Out,
	PC_inc_Out, PC_inc_Out1, imm_data, imm_data1, ReadData1, ReadData1tomux,
	ReadData2tomux, ReadData2, ALU_mux_Out, Read_data, Read_data1,
	Data_mem_mux_Out, ALU_Out, ALU_Out1, ALU_Out2, ForwardAmux_Out,
	ForwardBmux_Out, ForwardBmux_Out1;
	wire [31:0] Instruction, Instruction1;
	wire [6:0] opcode, funct7; 
	wire [4:0] rs1, rs2, rd, Rs1, Rs2, Rd, Rd1, Rd2;
	wire [2:0] funct3;
	wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Zero,
	Branch1, MemRead1, MemtoReg1, MemWrite1, ALUSrc1, RegWrite1, Zero1,
	Branch2, MemRead2, MemtoReg2, MemWrite2, ALUSrc2, RegWrite2,
	RegWrite3, MemtoReg3;
	wire [1:0] ALUOp, ALUOp1;
	wire [3:0] Funct = {Instruction[30], Instruction[14], Instruction[13], Instruction[12]};
	wire [3:0] Funct1;
	wire [3:0] Operation;
	wire [63:0] b_PC_inc4 = 64'd4;
	wire [63:0] imm_data_shift = imm_data1 << 1;
	wire PCSrc = Branch2 & Zero1;
	wire [1:0] ForwardA;
	wire [1:0] ForwardB;
	reg a, b, c, d;
	
	initial
	begin
	a <= 1'b0;
	b <= 1'b0;
	c <= 1'b0;
	d <= 1'b0;
	end
	
	always@(posedge clk)
	begin
	a <= 1'b1;
	#1
	b <= 1'b1;
	#1
	c <= 1'b1;
	#1
	d <= 1'b1;
	end
	
	always@(negedge clk)
	begin
	a <= 1'b0;
	b <= 1'b0;
	c <= 1'b0;
	d <= 1'b0;
	end
	
	Program_Counter PC
	(
		.clk(clk),
		.reset(reset),
		.PC_In(mux2PC_In),
		.PC_Out(PC_Out)
	);
	
	Adder PC_inc4
	(
		.a(PC_Out),
		.b(b_PC_inc4),
		.out(PC_inc4_Out)
	);
	
	Adder PC_inc
	(
		.a(PC_Out2),
		.b(imm_data_shift),
		.out(PC_inc_Out)
	);
	
	mux PC_mux
	(
		.a(PC_inc4_Out),
		.b(PC_inc_Out1),
		.sel(PCSrc),
		.data_out(mux2PC_In)
	);
	
	Instruction_Memory Ins_Mem
	(
		.Inst_Address(PC_Out),
		.Instruction(Instruction)
	);
	
	IF_ID buffer1
	(
		.PC_Out1(PC_Out),
		.Instruction1(Instruction),
		.PC_Out2(PC_Out1),
		.Instruction2(Instruction1),
		.clk(d),
		.reset(reset)
	);
	
	instruction_parser ins_par
	(
		.instruction(Instruction1),
		.opcode(opcode),
		.rs1(rs1),
		.rs2(rs2),
		.rd(rd),
		.funct3(funct3),
		.funct7(funct7)
	);
	
	Control_Unit Ctrl_Unit
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
	
	registerFile Registers
	(
		.rs1(rs1),
		.rs2(rs2),
		.rd(Rd2),
		.WriteData(Data_mem_mux_Out),
		.ReadData1(ReadData1),
		.ReadData2(ReadData2),
		.clk(clk),
		.reset(reset),
		.RegWrite(RegWrite3)
	);
	
	immediate_data_extractor Imm_Data_Ex
	(
		.instruction(Instruction1),
		.imm_data(imm_data)
	);
	
	ID_EX buffer2
	(
		.PC_out1(PC_Out1),
		.ReadData1in(ReadData1),
		.ReadData2in(ReadData2),
		.imm1(imm_data),
		.clk(c),
		.reset(reset),
		.Branch1(Branch),
		.MemRead1(MemRead),
		.MemWrite1(MemWrite),
		.MemtoReg1(MemtoReg),
		.ALUSrc1(ALUSrc),
		.RegWrite1(RegWrite),
		.ALUOp1(ALUOp),
		.Rd1(rd),
		.Rs1in(rs1),
		.Rs2in(rs2),
		.Funct1(Funct),
		.PC_out2(PC_Out2),
		.ReadData1out(ReadData1tomux),
		.ReadData2out(ReadData2tomux),
		.imm2(imm_data1),
		.Branch2(Branch1),
		.MemRead2(MemRead1),
		.MemWrite2(MemWrite1),
		.MemtoReg2(MemtoReg1),
		.ALUSrc2(ALUSrc1),
		.RegWrite2(RegWrite1),
		.ALUOp2(ALUOp1),
		.Rd2(Rd),
		.Rs1out(Rs1),
		.Rs2out(Rs2),
		.Funct2(Funct1)
	);
	
	ALU_Control ALU_Ctrl
	(
		.ALUOp(ALUOp1),
		.Funct(Funct1),
		.Operation(Operation)
	);
	
	Forwarding_Unit FU
	(
		.rs1(Rs1),
		.rs2(Rs2),
		.EXMEMrd(Rd1),
		.MEMWBrd(Rd2),
		.EXMEMregWrite(RegWrite2),
		.MEMWBregWrite(RegWrite3),
		.ForwardA(ForwardA),
		.ForwardB(ForwardB)
	);
	
	mux3 ForwardAmux
	(
		.a(ReadData1tomux),
		.b(Data_mem_mux_Out),
		.c(ALU_Out1),
		.sel(ForwardA),
		.data_out(ForwardAmux_Out)
	);
	
	mux3 ForwardBmux
	(
		.a(ReadData2tomux),
		.b(Data_mem_mux_Out),
		.c(ALU_Out1),
		.sel(ForwardB),
		.data_out(ForwardBmux_Out)
	);
	
	mux ALU_mux
	(
		.a(ForwardBmux_Out),
		.b(imm_data1),
		.sel(ALUSrc1),
		.data_out(ALU_mux_Out)
	);
	
	ALU_64_bit ALU
	(
		.a(ForwardAmux_Out),
		.b(ALU_mux_Out),
		.ALUOp(Operation),
		.Zero(Zero),
		.Result(ALU_Out)
	);
	
	EX_MEM buffer3
	(
		.PC_sum1(PC_inc_Out),
		.ALUResult1(ALU_Out),
		.ReadData2in(ForwardBmux_Out),
		.clk(b),
		.reset(reset),
		.Branch1(Branch1),
		.MemRead1(MemRead1),
		.MemtoReg1(MemtoReg1),
		.MemWrite1(MemWrite1),
		.RegWrite1(RegWrite1),
		.Zero1(Zero),
		.Rd1(Rd),
		.PC_sum2(PC_inc_Out1),
		.ALUResult2(ALU_Out1),
		.ReadData2out(ForwardBmux_Out1),
		.Branch2(Branch2),
		.MemRead2(MemRead2),
		.MemtoReg2(MemtoReg2),
		.MemWrite2(MemWrite2),
		.RegWrite2(RegWrite2),
		.Zero2(Zero1),
		.Rd2(Rd1)
	);
	
	Data_Memory Data_Mem
	(
		.Mem_Addr(ALU_Out1),
		.Write_Data(ForwardBmux_Out1),
		.Read_Data(Read_data),
		.MemRead(MemRead2),
		.MemWrite(MemWrite2),
		.clk(clk)
	);
	
	MEM_WB buffer4
	(
		.Result1(ALU_Out1),
		.Read_Data1(Read_data),
		.rd1(Rd1),
		.MemtoReg1(MemtoReg2),
		.RegWrite1(RegWrite2),
		.clk(a),
		.reset(reset),
		.Result2(ALU_Out2),
		.Read_Data2(Read_data1),
		.rd2(Rd2),
		.MemtoReg2(MemtoReg3),
		.RegWrite2(RegWrite3)		
	);
	
	mux Data_mem_mux
	(
		.a(ALU_Out2),
		.b(Read_data1),
		.sel(MemtoReg3),
		.data_out(Data_mem_mux_Out)
	);
	
	
endmodule