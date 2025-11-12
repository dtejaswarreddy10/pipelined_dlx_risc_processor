/* 
This ALU Module Do the operation based on the Opcode 
*/

module sc_mips_alu (
	input [3:0] opcode,
	input [31 :0] data_in1,data_in2,
	output reg [31 :0] data_out,
	output zero_flag);

	assign zero_flag = data_out == 32'd0 ; 

	always@(*) begin
		case(opcode)
		4'b0000 : data_out = data_in1 & data_in2 ;
		4'b0001 : data_out = data_in1 | data_in2 ;
		4'b0010 : data_out = data_in1 + data_in2 ;
		4'b0110 : data_out = data_in1 - data_in2 ;
		4'b0111 : data_out = data_in1 < data_in2 ;
		default : data_out = 32'd0 ;
		endcase
	end
endmodule
