#Compiling design modules
vlog ALU_64_bit.v test_bench.v
 
#no optimization
vsim -novopt work.tbEx
  
#view waves
view wave
  
#Adding waves

add wave sim:/test_bench/a
add wave sim:/test_bench/b
add wave sim:/test_bench/ALUOp
add wave sim:/test_bench/Result
add wave sim:/test_bench/Zero

 
run 250ns
