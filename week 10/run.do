vlog adder.v Program_Counter.v tb.v Instruction_Memory.v ALU_64_bit.v ALU_Control.v Control_Unit.v Data_Memory.v immediate_data_extractor.v instruction_parser.v mux.v registerFile.v RISC_V_Processor.v
vsim -novopt work.tb 
view wave
do wave.do
run 500ns