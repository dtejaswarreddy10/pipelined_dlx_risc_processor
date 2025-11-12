/* 
This module contains data 
depth = 256 
data width = 32
*/

module dmem (
	input clk,reset,mem_write,mem_read,
	input [31:0] address,write_data,
	output reg [31 :0] read_data);

	reg [31:0] data_memory [0:255];	
	integer i;
	always @(posedge clk) begin
		if (reset) begin
			for (i=0;i<256;i=i+1) begin
				data_memory[i] = 32'd0;
			end	
		end
		else if (mem_write) data_memory[address] = write_data;
	end
	always @(*) begin
		if (mem_read) read_data = data_memory[address] ;
	end
endmodule
