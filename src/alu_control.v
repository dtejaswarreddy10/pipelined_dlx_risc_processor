/* 
This ALU Control Module send the Control Signals(Opcode) To ALU to do the requred Operations 
*/

module alu_control (
	input [1:0] ALUOp,
	input [5:0] function_field,
	output reg [3:0] alu_action_out);

	always@(*) begin
		case(ALUOp)
		2'b00 : alu_action_out = 4'b0010 ;			// Add Operation for LW/SW
		2'b01 : alu_action_out = 4'b0110 ;			// Substract Operation for Beq
		2'b10 : begin
			case (function_field)
			6'b100000 : alu_action_out = 4'b0010 ;		// Add
			6'b100010 : alu_action_out = 4'b0110 ;		// Sub
			6'b100100 : alu_action_out = 4'b0000 ;		// AND
			6'b100101 : alu_action_out = 4'b0001 ;		// OR
			6'b101010 : alu_action_out = 4'b0111 ;		// Set on less than
			default   : alu_action_out = 4'b0000 ;
			endcase

			end
		default : alu_action_out = 4'b0000 ;

		endcase

	end


endmodule
