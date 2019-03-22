vlog Control_Unit.v CU_tb.v
vsim -novopt work.CU_tb 
add wave sim:/CU_tb/*
view wave
run 500ns