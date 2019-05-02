onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {IF Stage}
add wave -noupdate -format Literal /tb/Processor/Ins_Mem/Inst_Address
add wave -noupdate -format Literal /tb/Processor/Ins_Mem/Instruction
add wave -noupdate -divider {IF/ID buffer}
add wave -noupdate -format Logic -radix unsigned /tb/clk
add wave -noupdate -format Logic -radix unsigned /tb/reset
add wave -noupdate -format Literal -radix unsigned /tb/Processor/PC_Out
add wave -noupdate -format Literal -radix unsigned /tb/Processor/PC_Out1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/Instruction
add wave -noupdate -format Literal -radix unsigned /tb/Processor/Instruction1
add wave -noupdate -format Literal -radix unsigned -expand /tb/Processor/Registers/Registers
add wave -noupdate -divider {ID Stage}
add wave -noupdate -format Literal /tb/Processor/ins_par/instruction
add wave -noupdate -format Literal /tb/Processor/ins_par/opcode
add wave -noupdate -format Literal /tb/Processor/ins_par/rd
add wave -noupdate -format Literal /tb/Processor/ins_par/funct3
add wave -noupdate -format Literal /tb/Processor/ins_par/rs1
add wave -noupdate -format Literal /tb/Processor/ins_par/rs2
add wave -noupdate -format Literal /tb/Processor/ins_par/funct7
add wave -noupdate -format Literal /tb/Processor/Imm_Data_Ex/instruction
add wave -noupdate -format Literal /tb/Processor/Imm_Data_Ex/imm_data
add wave -noupdate -format Literal /tb/Processor/Registers/rs1
add wave -noupdate -format Literal /tb/Processor/Registers/rs2
add wave -noupdate -format Literal /tb/Processor/Registers/rd
add wave -noupdate -format Literal /tb/Processor/Registers/WriteData
add wave -noupdate -format Logic /tb/Processor/Registers/RegWrite
add wave -noupdate -format Logic /tb/Processor/Registers/clk
add wave -noupdate -format Logic /tb/Processor/Registers/reset
add wave -noupdate -format Literal /tb/Processor/Registers/ReadData1
add wave -noupdate -format Literal /tb/Processor/Registers/ReadData2
add wave -noupdate -divider {ID/EX buffer}
add wave -noupdate -format Logic -radix unsigned /tb/clk
add wave -noupdate -format Logic -radix unsigned /tb/reset
add wave -noupdate -format Logic -radix unsigned /tb/Processor/Branch
add wave -noupdate -format Logic -radix unsigned /tb/Processor/Branch1
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemRead
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemRead1
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemtoReg
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemtoReg1
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemWrite
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemWrite1
add wave -noupdate -format Logic -radix unsigned /tb/Processor/ALUSrc
add wave -noupdate -format Logic -radix unsigned /tb/Processor/ALUSrc1
add wave -noupdate -format Logic -radix unsigned /tb/Processor/RegWrite
add wave -noupdate -format Logic -radix unsigned /tb/Processor/RegWrite1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/ALUOp
add wave -noupdate -format Literal -radix unsigned /tb/Processor/ALUOp1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/PC_Out1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/PC_Out2
add wave -noupdate -format Literal -radix unsigned /tb/Processor/ReadData1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/ReadData1tomux
add wave -noupdate -format Literal -radix unsigned /tb/Processor/ReadData2
add wave -noupdate -format Literal -radix unsigned /tb/Processor/ReadData2tomux
add wave -noupdate -format Literal -radix unsigned /tb/Processor/imm_data
add wave -noupdate -format Literal -radix unsigned /tb/Processor/imm_data1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/rs1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/rs2
add wave -noupdate -format Literal -radix unsigned /tb/Processor/rd
add wave -noupdate -format Literal -radix unsigned /tb/Processor/Rd
add wave -noupdate -format Literal -radix unsigned /tb/Processor/Funct
add wave -noupdate -format Literal -radix unsigned /tb/Processor/Funct1
add wave -noupdate -divider {EX Stage}
add wave -noupdate -format Literal /tb/Processor/ALU/a
add wave -noupdate -format Literal /tb/Processor/ALU/b
add wave -noupdate -format Literal /tb/Processor/ALU/ALUOp
add wave -noupdate -format Literal /tb/Processor/ALU/Result
add wave -noupdate -format Logic /tb/Processor/ALU/Zero
add wave -noupdate -format Literal /tb/Processor/ALU_mux/a
add wave -noupdate -format Literal /tb/Processor/ALU_mux/b
add wave -noupdate -format Logic /tb/Processor/ALU_mux/sel
add wave -noupdate -format Literal /tb/Processor/ALU_mux/data_out
add wave -noupdate -format Literal /tb/Processor/ForwardAmux/a
add wave -noupdate -format Literal /tb/Processor/ForwardAmux/b
add wave -noupdate -format Literal /tb/Processor/ForwardAmux/c
add wave -noupdate -format Literal /tb/Processor/ForwardAmux/sel
add wave -noupdate -format Literal /tb/Processor/ForwardAmux/data_out
add wave -noupdate -format Literal /tb/Processor/ForwardBmux/a
add wave -noupdate -format Literal /tb/Processor/ForwardBmux/b
add wave -noupdate -format Literal /tb/Processor/ForwardBmux/c
add wave -noupdate -format Literal /tb/Processor/ForwardBmux/sel
add wave -noupdate -format Literal /tb/Processor/ForwardBmux/data_out
add wave -noupdate -format Literal /tb/Processor/ALU_Ctrl/ALUOp
add wave -noupdate -format Literal /tb/Processor/ALU_Ctrl/Funct
add wave -noupdate -format Literal /tb/Processor/ALU_Ctrl/Operation
add wave -noupdate -format Literal /tb/Processor/PC_inc/a
add wave -noupdate -format Literal /tb/Processor/PC_inc/b
add wave -noupdate -format Literal /tb/Processor/PC_inc/out
add wave -noupdate -divider {EX/MEM buffer}
add wave -noupdate -format Logic -radix unsigned /tb/clk
add wave -noupdate -format Logic -radix unsigned /tb/reset
add wave -noupdate -format Logic -radix unsigned /tb/Processor/Branch1
add wave -noupdate -format Logic -radix unsigned /tb/Processor/Branch2
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemRead1
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemRead2
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemtoReg1
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemtoReg2
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemWrite1
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemWrite2
add wave -noupdate -format Logic -radix unsigned /tb/Processor/RegWrite1
add wave -noupdate -format Logic -radix unsigned /tb/Processor/RegWrite2
add wave -noupdate -format Literal -radix unsigned /tb/Processor/PC_inc_Out
add wave -noupdate -format Literal -radix unsigned /tb/Processor/PC_inc_Out1
add wave -noupdate -format Logic -radix unsigned /tb/Processor/Zero
add wave -noupdate -format Logic -radix unsigned /tb/Processor/Zero1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/ALU_Out
add wave -noupdate -format Literal -radix unsigned /tb/Processor/ALU_Out1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/Rd
add wave -noupdate -format Literal -radix unsigned /tb/Processor/Rd1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/ForwardBmux_Out
add wave -noupdate -format Literal -radix unsigned /tb/Processor/ForwardBmux_Out1
add wave -noupdate -divider {MEM Stage}
add wave -noupdate -format Literal /tb/Processor/Data_Mem/Mem_Addr
add wave -noupdate -format Literal /tb/Processor/Data_Mem/Write_Data
add wave -noupdate -format Logic /tb/Processor/Data_Mem/clk
add wave -noupdate -format Logic /tb/Processor/Data_Mem/MemWrite
add wave -noupdate -format Logic /tb/Processor/Data_Mem/MemRead
add wave -noupdate -format Literal /tb/Processor/Data_Mem/Read_Data
add wave -noupdate -format Literal /tb/Processor/Data_Mem/j
add wave -noupdate -format Literal /tb/Processor/Data_Mem/k
add wave -noupdate -divider {MEM/WB buffer}
add wave -noupdate -format Logic -radix unsigned /tb/clk
add wave -noupdate -format Logic -radix unsigned /tb/reset
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemtoReg2
add wave -noupdate -format Logic -radix unsigned /tb/Processor/MemtoReg3
add wave -noupdate -format Logic -radix unsigned /tb/Processor/RegWrite2
add wave -noupdate -format Logic -radix unsigned /tb/Processor/RegWrite3
add wave -noupdate -format Literal -radix unsigned /tb/Processor/Read_data
add wave -noupdate -format Literal -radix unsigned /tb/Processor/Read_data1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/ALU_Out1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/ALU_Out2
add wave -noupdate -format Literal -radix unsigned /tb/Processor/Rd1
add wave -noupdate -format Literal -radix unsigned /tb/Processor/Rd2
add wave -noupdate -divider {WB Stage}
add wave -noupdate -format Literal /tb/Processor/Data_mem_mux/a
add wave -noupdate -format Literal /tb/Processor/Data_mem_mux/b
add wave -noupdate -format Logic /tb/Processor/Data_mem_mux/sel
add wave -noupdate -format Literal /tb/Processor/Data_mem_mux/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {34 ns} 0}
configure wave -namecolwidth 228
configure wave -valuecolwidth 180
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {212 ns}
