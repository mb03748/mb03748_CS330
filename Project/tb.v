module tb();

	reg clk, reset;
	
	RISC_V_Processor_Pipelined Processor
	(
		.clk(clk),
		.reset(reset)
	);
	
	always
	#5 clk = ~clk;
	
	initial
	begin
		reset = 1'b1;
		clk = 1'b1;
		#10
		reset = 1'b0;
	end
	
endmodule