/*
Memory Stage 

*/


module mem_stage(
	input clk,reset,
	input [31:0] alu_data_in,read_data2_in,
	input mem_write,mem_read,zero,branch,
	
	
	output mux_pcsrc,
	output [31:0] read_data_out
);
	
	dmem Data_Memory(.clk(clk),.reset(reset),.mem_write(mem_write),.mem_read(mem_read),.address(alu_data_in),.write_data(read_data2_in),.read_data(read_data_out));
	assign mux_pcsrc = zero && branch ;
endmodule