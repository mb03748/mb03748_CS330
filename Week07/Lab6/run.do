vlog tb.v Instruction_Memory.v
vsim -novopt work.tb
view wave
add wave sim:/tb/*
run 600ns