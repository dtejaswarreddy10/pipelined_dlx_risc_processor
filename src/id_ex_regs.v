/*
ID/EX Pipeline Registers
*/


module id_ex_regs (
	input clk,reset,

	input [31:0] a_in,
	input [31:0] b_in,
	input [31:0] npc_in,
	input [31:0] imm_in,
	input [4:0] rd1_in,
	input [4:0] rd2_in,

	input regdst_in,
	input alusrc_in,
	input [1:0] aluop_in,

	input branch_in,
	input mem_read_in,
	input mem_write_in,

	input reg_write_in,
	input mem_to_reg_in,

	output reg [31:0] a_out,
        output reg [31:0] b_out,
        output reg [31:0] npc_out,
        output reg [31:0] imm_out,
        output reg [4:0]  rd1_out,
	output reg [4:0]  rd2_out,

        output reg regdst_out,
        output reg alusrc_out,
        output reg [1:0] aluop_out,

        output reg branch_out,
        output reg mem_read_out,
        output reg mem_write_out,

        output reg reg_write_out,
        output reg mem_to_reg_out

);

	always@(posedge clk or posedge reset) begin
		if (reset) begin

			a_out		<= 'd0;
        		b_out		<= 'd0;
        		npc_out		<= 'd0;
        		imm_out		<= 'd0;
        		rd1_out		<= 'd0;
			rd2_out		<= 'd0;

        		regdst_out	<= 'd0;
        		alusrc_out	<= 'd0;
        		aluop_out	<= 'd0;

        		branch_out	<= 'd0;
        		mem_read_out	<= 'd0;
        		mem_write_out	<= 'd0;

        		reg_write_out	<= 'd0;
        		mem_to_reg_out	<= 'd0;

		end else begin
			a_out		<= a_in;
        		b_out		<= b_in;
        		npc_out		<= npc_in;
        		imm_out		<= imm_in;
        		rd1_out		<= rd1_in;
			rd2_out		<= rd2_in;

        		regdst_out	<= regdst_in;
        		alusrc_out	<= alusrc_in;
        		aluop_out	<= aluop_in;

        		branch_out	<= branch_in;
        		mem_read_out	<= mem_read_in;
        		mem_write_out	<= mem_write_in;

        		reg_write_out	<= reg_write_in;
        		mem_to_reg_out	<= mem_to_reg_in;

		end

	end

endmodule
