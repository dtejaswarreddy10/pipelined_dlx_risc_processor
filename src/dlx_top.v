/*
Top Level Module

*/

module dlx_top (
	input clk,reset

	);

	wire [31:0] if_s_add_out,if_s_ins_out;

	wire [31:0] id_s_ins_in,id_s_pc_in,id_s_memtoreg_in;
	wire id_s_reg_write_in;
	wire [4:0]id_s_regdst_in;

	wire [31:0]id_s_sign_extend_out,id_s_read_data1_out,id_s_read_data2_out;
	wire [1:0]id_s_aluop_out;
	wire id_s_regdst_out,id_s_alusrc_out,id_s_memtoreg_out,id_s_branch_out,id_s_reg_write_out,id_s_mem_read_out,id_s_mem_write_out;

	wire [31:0]ex_s_a_in,ex_s_b_in,ex_s_npc_in,ex_s_imm_in;
	wire [4:0]ex_s_rd1_in,ex_s_rd2_in;
	wire [1:0]ex_s_aluop_in;
	wire ex_s_regdst_in,ex_s_alusrc_in,ex_s_memtoreg_in,ex_s_branch_in,ex_s_reg_write_in,ex_s_mem_read_in,ex_s_mem_write_in;

	wire [4:0]ex_s_regdst_out;
	wire [31:0]ex_s_alu_data_out,ex_s_add_out;
	wire ex_s_Zero_out;

	wire [31:0]mem_s_b_in,mem_s_npc_in,mem_s_aluoutput_in;
	wire [4:0]mem_s_rd_in;
	wire mem_s_memtoreg_in,mem_s_branch_in,mem_s_reg_write_in,mem_s_mem_read_in,mem_s_mem_write_in,mem_s_zero_in;

	wire mem_s_mux_pcsrc_out;
	wire [31:0]mem_s_read_data_out;

	wire [31:0]wb_s_lmd_in,wb_s_aluoutput_in;
	wire wb_s_memtoreg_in;
	if_stage instruction_fetching (
		.clk(clk),
		.reset(reset),
		.add_in(mem_s_npc_in),
		.mux_pcsrc_in(mem_s_mux_pcsrc_out),
	
		.add_pc_4_out(if_s_add_out),
		.instruction(if_s_ins_out)
	);


	
	if_id_regs if_id_pipile_reg(
		.clk(clk),
		.reset(reset),
		.ir_in(if_s_ins_out),
		.npc_in(if_s_add_out),
		.ir_out(id_s_ins_in),
		.npc_out(id_s_pc_in)
	);

	id_stage instruction_decoding(
		.clk(clk),
		.reset(reset),
		.instruction(id_s_ins_in),
		.memtoreg_in(id_s_memtoreg_in),
		.reg_write_in(id_s_reg_write_in),
		.regdst_in(id_s_regdst_in),

		.sign_extend_out(id_s_sign_extend_out),
		.read_data1_out(id_s_read_data1_out),
		.read_data2_out(id_s_read_data2_out),
	
		.aluop(id_s_aluop_out),
		.regdst(id_s_regdst_out),
		.alusrc(id_s_alusrc_out),
		.memtoreg(id_s_memtoreg_out),
		.branch(id_s_branch_out),
		.reg_write(id_s_reg_write_out),
		.mem_read(id_s_mem_read_out),
		.mem_write(id_s_mem_write_out)
	
	);


	id_ex_regs id_ex_pipeline_reg(
		.clk(clk),
		.reset(reset),

	.a_in(id_s_read_data1_out),
	.b_in(id_s_read_data2_out),
	.npc_in(id_s_pc_in),
	.imm_in(id_s_sign_extend_out),
	.rd1_in(id_s_ins_in[20:16]),
	.rd2_in(id_s_ins_in[15:11]),

	.regdst_in(id_s_regdst_out),
	.alusrc_in(id_s_alusrc_out),
	.aluop_in(id_s_aluop_out),

	.branch_in(id_s_branch_out),
	.mem_read_in(id_s_mem_read_out),
	.mem_write_in(id_s_mem_write_out),

	.reg_write_in(id_s_reg_write_out),
	.mem_to_reg_in(id_s_memtoreg_out),

	.a_out(ex_s_a_in),
        .b_out(ex_s_b_in),
        .npc_out(ex_s_npc_in),
        .imm_out(ex_s_imm_in),
        .rd1_out(ex_s_rd1_in),
	.rd2_out(ex_s_rd2_in),

        .regdst_out(ex_s_regdst_in),
        .alusrc_out(ex_s_alusrc_in),
        .aluop_out(ex_s_aluop_in),

        .branch_out(ex_s_branch_in),
        .mem_read_out(ex_s_mem_read_in),
        .mem_write_out(ex_s_mem_write_in),

        .reg_write_out(ex_s_reg_write_in),
        .mem_to_reg_out(ex_s_memtoreg_in)

);

	ex_stage execution(
		.add_pc_4_in(ex_s_npc_in),
		.sign_extend_in(ex_s_imm_in),
		.read_data1_in(ex_s_a_in),
		.read_data2_in(ex_s_b_in),
		.regdst_mux_0(ex_s_rd1_in),
		.regdst_mux_1(ex_s_rd2_in),

		.regdst(ex_s_regdst_in),
		.alusrc(ex_s_alusrc_in),
		.aluop(ex_s_aluop_in),

		.regdst_out(ex_s_regdst_out),
		.alu_data_out(ex_s_alu_data_out),
		.add_out(ex_s_add_out),
		.Zero(ex_s_Zero_out)
	

);


	ex_mem_regs ex_mem_pipeline_reg(
	 .clk(clk),
	.reset(reset),

         .zero_in(ex_s_Zero_out),
         .b_in(ex_s_b_in),
         .npc_in(ex_s_add_out),
         .aluoutput_in(ex_s_alu_data_out),
         .rd_in(ex_s_regdst_out),

         .branch_in(ex_s_branch_in),
         .mem_read_in(ex_s_mem_read_in),
         .mem_write_in(ex_s_mem_write_in),

         .reg_write_in(ex_s_reg_write_in),
         .mem_to_reg_in(ex_s_memtoreg_in),

          .zero_out(mem_s_zero_in),
          .b_out(mem_s_b_in),
          .npc_out(mem_s_npc_in),
          .aluoutput_out(mem_s_aluoutput_in),
          .rd_out(mem_s_rd_in),

          .branch_out(mem_s_branch_in),
          .mem_read_out(mem_s_mem_read_in),
          .mem_write_out(mem_s_mem_write_in),

          .reg_write_out(mem_s_reg_write_in),
          .mem_to_reg_out(mem_s_memtoreg_in)
);

	mem_stage memory (
		.clk(clk),
		.reset(reset),
		.alu_data_in(mem_s_aluoutput_in),
		.read_data2_in(mem_s_b_in),
	 	.mem_write(mem_s_mem_write_in),
		.mem_read(mem_s_mem_read_in),
		.zero(mem_s_zero_in),
		.branch(mem_s_branch_in),
	
	
		.mux_pcsrc(mem_s_mux_pcsrc_out),
		.read_data_out(mem_s_read_data_out)
);


	mem_wb_regs mem_wb_pipeline_reg(
		.clk(clk),
		.reset(reset),
        	.lmd_in(mem_s_read_data_out),
        	.aluoutput_in(mem_s_aluoutput_in),
        	.rd_in(mem_s_rd_in),

		.reg_write_in(mem_s_reg_write_in),
         	.mem_to_reg_in(mem_s_memtoreg_in),


       		.lmd_out(wb_s_lmd_in),
        	.aluoutput_out(wb_s_aluoutput_in),
        	.rd_out(id_s_regdst_in),


        	.reg_write_out(id_s_reg_write_in),
          	.mem_to_reg_out(wb_s_memtoreg_in)
);



	wb_stage write_back(
		.alu_data_in(wb_s_aluoutput_in),
		.read_data_in(wb_s_lmd_in),
		.memtoreg(wb_s_memtoreg_in),

		.memtoreg_out(id_s_memtoreg_in)



);




endmodule