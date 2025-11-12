/*
Write Back

*/



module wb_stage(
	input [31:0]alu_data_in,read_data_in,
	input memtoreg,

	output [31:0]memtoreg_out



);

	mux Mux_memtoreg(.i0(alu_data_in),.i1(read_data_in),.s0(memtoreg),.out(memtoreg_out));
endmodule