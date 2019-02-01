vlog tb.v mux.v
vsim -novopt work.tb 
add wave \
{sim:/tb/x[0] } \
{sim:/tb/y[0] } \
{sim:/tb/z } \
{sim:/tb/try[0] } 
run 300ns