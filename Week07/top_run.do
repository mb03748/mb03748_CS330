vlog registerFile.v top.v tb_top.v instruction_parser.v
vsim -novopt work.tb
add wave sim:/tb/*
view wave
run 600ns