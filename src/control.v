
/* 
This Control Module send the Control Signals To all sub modules present in the MIPS
*/

module control (
	input [5:0] instruction_opcode,
	output reg [1:0] aluop,
	output reg regdst,alusrc,memtoreg,branch,reg_write,mem_read,mem_write);

	always@(*) begin
		case(instruction_opcode)
		6'b000000 : 	begin				// R-Format Control Signals
				regdst	   = 1'b1 ;
				alusrc     = 1'b0 ;
				memtoreg   = 1'b0 ;
				branch     = 1'b0 ;
				reg_write  = 1'b1 ;
				mem_read   = 1'b0 ;
				mem_write  = 1'b0 ;
				aluop      = 2'b10 ;
				end 
		6'b100011 : 	begin				// LW Control Signals
				regdst	   = 1'b0 ;
				alusrc     = 1'b1 ;
				memtoreg   = 1'b1 ;
				branch     = 1'b0 ;
				reg_write  = 1'b1 ;
				mem_read   = 1'b1 ;
				mem_write  = 1'b0 ;
				aluop      = 2'b00 ;
				end  
		6'b101011 : 	begin				// SW Control Signals
				alusrc     = 1'b1 ;
				branch     = 1'b0 ;
				reg_write  = 1'b0 ;
				mem_read   = 1'b0 ;
				mem_write  = 1'b1 ;
				aluop      = 2'b00 ;
				end 
		6'b000100 : 	begin
				alusrc     = 1'b0 ;
				branch     = 1'b1 ;
				reg_write  = 1'b0 ;
				mem_read   = 1'b0 ;
				mem_write  = 1'b0 ;
				aluop      = 2'b01 ;
				end  
		default : begin
				regdst	   = 1'b0 ;
				alusrc     = 1'b0 ;
				memtoreg   = 1'b0 ;
				branch     = 1'b0 ;
				reg_write  = 1'b0 ;
				mem_read   = 1'b0 ;
				mem_write  = 1'b0 ;
				aluop      = 2'b00 ;
				end 

		endcase

	end


endmodule
