vlog ALU_Control.v AC_tb.v
vsim -novopt work.AC_tb 
add wave sim:/AC_tb/*
view wave
run 500ns