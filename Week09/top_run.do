vlog Control_Unit.v ALU_Control.v top_control.v top_tb.v
vsim -novopt work.top_tb
add wave sim:/top_tb/*
view wave
run 600ns