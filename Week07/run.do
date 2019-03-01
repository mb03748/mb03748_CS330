vlog registerFile.v tb.v
vsim -novopt work.tb 
add wave sim:/tb/*
view wave
run 500ns