onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb/RISC/clk
add wave -noupdate -format Logic /tb/RISC/reset
add wave -noupdate -divider PC
add wave -noupdate -format Literal -radix unsigned /tb/RISC/PC_Out
add wave -noupdate -format Literal -radix unsigned /tb/RISC/PC_In
add wave -noupdate -divider ALU
add wave -noupdate -format Literal -radix unsigned /tb/RISC/out1
add wave -noupdate -format Literal /tb/RISC/imm_data
add wave -noupdate -format Literal /tb/RISC/out2
add wave -noupdate -format Literal -radix unsigned /tb/RISC/out3
add wave -noupdate -format Literal /tb/RISC/Instruction
add wave -noupdate -format Literal -radix unsigned /tb/RISC/Result
add wave -noupdate -divider Register
add wave -noupdate -format Literal -radix unsigned /tb/RISC/WriteData
add wave -noupdate -format Literal /tb/RISC/Read_Data
add wave -noupdate -format Literal /tb/RISC/opcode
add wave -noupdate -format Literal -radix unsigned /tb/RISC/rs1
add wave -noupdate -format Literal -radix unsigned /tb/RISC/rs2
add wave -noupdate -format Literal -radix unsigned /tb/RISC/rd
add wave -noupdate -format Literal -radix unsigned /tb/RISC/ReadData1
add wave -noupdate -format Literal -radix unsigned /tb/RISC/ReadData2
add wave -noupdate -format Literal /tb/RISC/funct3
add wave -noupdate -format Literal /tb/RISC/funct7
add wave -noupdate -format Literal /tb/RISC/ALUOp
add wave -noupdate -format Literal /tb/RISC/Operation
add wave -noupdate -format Literal -radix unsigned -expand /tb/RISC/rf/Registers
add wave -noupdate -format Logic /tb/RISC/Branch
add wave -noupdate -divider {Data Mem}
add wave -noupdate -format Logic /tb/RISC/MemRead
add wave -noupdate -format Logic /tb/RISC/MemtoReg
add wave -noupdate -format Logic /tb/RISC/MemWrite
add wave -noupdate -format Logic /tb/RISC/ALUSrc
add wave -noupdate -format Logic /tb/RISC/RegWrite
add wave -noupdate -format Logic /tb/RISC/sel
add wave -noupdate -format Logic /tb/RISC/Zero
add wave -noupdate -format Logic /tb/RISC/MemtoReg
add wave -noupdate -format Literal -radix hexadecimal -expand /tb/RISC/DM/DM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 197
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
WaveRestoreZoom {7 ns} {27 ns}
