/*
IF/ID Pipeline Register

*/


module if_id_regs (
	input clk,reset,
	input [31:0] ir_in,
	input [31:0] npc_in,
	output reg [31:0] ir_out,
	output reg [31:0] npc_out);


	always@(posedge clk or posedge reset) begin
		if (reset) begin
			ir_out <= 'd0;
			npc_out <= 'd0;

		end else begin
			ir_out <= ir_in;
			npc_out <= npc_in;

		end

	end

endmodule
