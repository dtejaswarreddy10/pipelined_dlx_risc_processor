/*
Instruction Feteching

*/

module if_stage(
	input clk,reset,
	input [31:0] add_in,
	input mux_pcsrc_in,
	
	output [31:0] add_pc_4_out,
	output [31:0] instruction
);
	wire [31:0]pc_in,pc_out;
	

	mux Mux_pcsrc(.i0(add_pc_4_out),.i1(add_in),.s0(mux_pcsrc_in),.out(pc_in));
	program_counter PC(.clk(clk),.reset(reset),.count_in(pc_in),.count_out(pc_out));
	add Add_pc_4(.data_in1(pc_out),.data_in2(32'd4),.data_out(add_pc_4_out));
	imem Instruction_Memory(.read_address(pc_out),.instruction(instruction));


endmodule