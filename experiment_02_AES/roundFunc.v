module roundFunc
(
	input clk,
	input rst_n,
	input [127 : 0] iBlockIn,
	input [127 : 0] iKeyValue,//轮密钥
	output [127 : 0] oBlockout
);

wire [127 : 0] wRowShift;

subByte_rowShift subByte_rowShift_inst1
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(iBlockIn),
	.oBlockout(wRowShift)
);

colMix_keyAdd colMix_keyAdd_inst1
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(wRowShift),
	.iKeyValue(iKeyValue),//轮密钥
	.oBlockout(oBlockout)
);

endmodule