vlog tb.v ALU_Control.v Control_Unit.v Adder.v ALU_64_bit.v Data_Memory.v immediate_data_extractor.v Instruction_Memory.v instruction_parser.v mux.v Program_Counter.v registerFile.v RISC_V_Processor_w_buffers.v IF_ID.v ID_EX.v EX_MEM.v MEM_WB.v  mux3.v Forwarding_Unit.v

vsim -novopt work.tb


do wave.do

run 300ns