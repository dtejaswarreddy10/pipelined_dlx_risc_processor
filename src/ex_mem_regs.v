/*
EX/MEM Pipeline Registers 
*/


module ex_mem_regs (
	input clk,reset,

        input zero_in,
        input [31:0] b_in,
        input [31:0] npc_in,
        input [31:0] aluoutput_in,
        input [4:0] rd_in,

        input branch_in,
        input mem_read_in,
        input mem_write_in,

        input reg_write_in,
        input mem_to_reg_in,

        output reg zero_out,
        output reg [31:0] b_out,
        output reg [31:0] npc_out,
        output reg [31:0] aluoutput_out,
        output reg [4:0] rd_out,

        output reg branch_out,
        output reg mem_read_out,
        output reg mem_write_out,

        output reg reg_write_out,
        output reg mem_to_reg_out
);

	always@(posedge clk or posedge reset) begin
		if (reset) begin

			zero_out	<= 'd0;
        		b_out		<= 'd0;
        		npc_out		<= 'd0;
        		aluoutput_out	<= 'd0;
        		rd_out		<= 'd0;


        		branch_out	<= 'd0;
        		mem_read_out	<= 'd0;
        		mem_write_out	<= 'd0;

        		reg_write_out	<= 'd0;
        		mem_to_reg_out	<= 'd0;

		end else begin
			zero_out	<= zero_in;
        		b_out		<= b_in;
        		npc_out		<= npc_in;
        		aluoutput_out	<= aluoutput_in;
        		rd_out		<= rd_in;


        		branch_out	<= branch_in;
        		mem_read_out	<= mem_read_in;
        		mem_write_out	<= mem_write_in;

        		reg_write_out	<= reg_write_in;
        		mem_to_reg_out	<= mem_to_reg_in;

		end

	end

endmodule
