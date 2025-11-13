/*
Instruction Decode 

*/



module id_stage (
	input clk,reset,
	input [31:0] instruction,memtoreg_in,
	input reg_write_in,
	input [4:0]regdst_in,

	output [31:0] sign_extend_out,read_data1_out,read_data2_out,
	
	output [1:0] aluop,
	output regdst,alusrc,memtoreg,branch,reg_write,mem_read,mem_write
	

);


	control Control(.instruction_opcode(instruction[31:26]),.aluop(aluop),.regdst(regdst),.alusrc(alusrc),.memtoreg(memtoreg),.branch(branch),.reg_write(reg_write),.mem_read(mem_read),.mem_write(mem_write));
	regfile Regfile(.clk(clk),.reset(reset),.reg_write(reg_write_in),.read_reg1(instruction[25:21]),.read_reg2(instruction[20:16]),.write_reg(regdst_in),.write_data(memtoreg_in),.read_data1(read_data1_out),.read_data2(read_data2_out));
	sign_extend Sign_Extend(.in(instruction[15:0]),.out(sign_extend_out));


endmodule