vlog tb.v ALU_1_bit.v
vsim -novopt work.tb
add wave sim:/tb/*
view wave
run 300ns