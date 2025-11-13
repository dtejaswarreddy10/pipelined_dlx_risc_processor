/*
Instruction Execution 

*/


module ex_stage(
	input [31:0] add_pc_4_in,sign_extend_in,read_data1_in,read_data2_in,
	input [4:0] regdst_mux_0,regdst_mux_1,

	input regdst,alusrc,
	input [1:0] aluop,

	output [4:0]regdst_out,
	output [31:0]alu_data_out,add_out,
	output Zero
	

);
	wire [31:0] shift_left_2_out;
	wire [31:0]alu_in2;
	wire [3:0] alu_control_out;
	

	add Add(.data_in1(add_pc_4_in),.data_in2(shift_left_2_out),.data_out(add_out));
	left_shift Shift_Left_2(.in(sign_extend_in),.out(shift_left_2_out));
	alu ALU(.opcode(alu_control_out),.data_in1(read_data1_in),.data_in2(alu_in2),.data_out(alu_data_out),.zero_flag(Zero));
	mux Mux_alusrc(.i0(read_data2_in),.i1(sign_extend_in),.s0(alusrc),.out(alu_in2));
	alu_control ALU_Control(.ALUOp(aluop),.function_field(sign_extend_in[5:0]),.alu_action_out(alu_control_out));
	mux #(5) Mux_regdst(.i0(regdst_mux_0),.i1(regdst_mux_1),.s0(regdst),.out(regdst_out));

endmodule