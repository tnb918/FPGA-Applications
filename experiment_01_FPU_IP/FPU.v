module FPU(
		input clk,
		input [31:0] dataA,
		input [31:0] dataB,
		output[31:0] result_add,
		output[31:0] result_sub,
		output[31:0] result_mul,
		output[31:0] result_div		
	);


FPU_add u_FPU_add(
										.clock		(clk),
										.dataa		(dataA),
										.datab		(dataB),
										.result		(result_add)
);


FPU_sub u_FPU_sub(
										.clock		(clk),
										.dataa		(dataA),
										.datab		(dataB),
										.result		(result_sub)
);

	
FPU_mul u_FPU_mul(
										.clock		(clk),
										.dataa		(dataA),
										.datab		(dataB),
										.result		(result_mul)
);


FPU_div u_FPU_div(
										.clock		(clk),
										.dataa		(dataA),
										.datab		(dataB),
										.result		(result_div)
);


endmodule
