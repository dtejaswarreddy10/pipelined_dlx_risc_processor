/* 
left shift by 2 operation means mul by 4 
*/

module left_shift (
	input [31 : 0] in,
	output [31 : 0] out);

	assign out = in << 2 ;

endmodule
