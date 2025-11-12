/* 
This module contains 32 register each of width 32
*/

module regfile (
	input clk,reset,reg_write,
	input [4:0] read_reg1,read_reg2,write_reg,
	input [31:0] write_data,
	output [31 :0] read_data1,read_data2);

	reg [31:0] register [31:0] ;
	integer i;

	assign read_data1 = register[read_reg1] ;
	assign read_data2 = register[read_reg2] ;

	always @(posedge clk) begin
		if (reset) begin
			for (i=0;i<32;i=i+1) begin
				register[i] <= 32'd10;
			end	
		end
		else if (reg_write) register[write_reg] <= write_data;
	end	
endmodule
