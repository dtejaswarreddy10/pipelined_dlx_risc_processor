/* 
mux operation 
*/

module mux #(parameter DATA_WIDTH = 32)(
	input [DATA_WIDTH-1:0] i0,i1,
	input s0,
	output reg [DATA_WIDTH-1:0] out);

	always@(*) begin
		case(s0)
			1'b0 : out = i0;
			1'b1 : out = i1;
		endcase
	end
endmodule
