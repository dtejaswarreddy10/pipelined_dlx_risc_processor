/*
MEM/WB Pipelibe Registers 
*/


module mem_wb_regs (
	input clk,reset,

        input [31:0] lmd_in,
        input [31:0] aluoutput_in,
        input [4:0] rd_in,

	input reg_write_in,
        input mem_to_reg_in,

        output reg [31:0] lmd_out,
        output reg [31:0] aluoutput_out,
        output reg [4:0] rd_out,


        output reg reg_write_out,
        output reg mem_to_reg_out
);
	always@(posedge clk or posedge reset) begin
		if (reset) begin

        		lmd_out		<= 'd0;
        		aluoutput_out	<= 'd0;
        		rd_out		<= 'd0;

        		reg_write_out	<= 'd0;
        		mem_to_reg_out	<= 'd0;

		end else begin
        		lmd_out		<= lmd_in;
        		aluoutput_out	<= aluoutput_in;
        		rd_out		<= rd_in;

        		reg_write_out	<= reg_write_in;
        		mem_to_reg_out	<= mem_to_reg_in;

		end

	end

endmodule
