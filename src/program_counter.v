/* 
This module contains Instructions
depth = 256 
data width = 32
*/

module program_counter (
	input clk,reset,
	input [31:0] count_in,
	output reg [31 :0] count_out);

	always@(posedge clk) begin
		if (reset) count_out <= 32'd0 ; 
		else count_out <= count_in ; 
	end

	

endmodule
