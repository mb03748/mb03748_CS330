vlog Instruction_Fetch.v adder.v Program_Counter.v tb.v Instruction_Memory.v
vsim -novopt work.tb 
view wave
add wave sim:/tb/*
run 500ns