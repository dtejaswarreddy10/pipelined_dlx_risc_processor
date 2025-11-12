/* 
This module contains Instructions
depth = 256 
data width = 32

*/


module imem (
	input [31:0] read_address,
	output [31 :0] instruction);

	reg [31:0] Instruction_memory [255:0] ; 

	initial begin

	Instruction_memory [0] =32'h00221820  ;
 	Instruction_memory [1] =32'h00221822  ;
	Instruction_memory [2] =32'h00221824  ;
	Instruction_memory [3] =32'h00221825  ;
	Instruction_memory [4] =32'h0022182A  ;
	Instruction_memory [5] =32'hAC220010  ;
	Instruction_memory [6] =32'h8C220010  ;
	Instruction_memory [7] =32'h10220010  ;

	end
	

	assign instruction = Instruction_memory[read_address >> 2] ;

endmodule

/*

1--add $3, $1, $2
opcode = 000000
rs = 00001
rt = 00010
rd = 00011
shamt = 00000
funct = 100000

Binary: 000000 00001 00010 00011 00000 100000
Hex: 0x00221820


2--sub $3, $1, $2
opcode = 000000
rs = 00001
rt = 00010
rd = 00011
shamt = 00000
funct = 100010


Binary: 000000 00001 00010 00011 00000 100010
Hex: 0x00221822

3--and $3, $1, $2
opcode = 000000
rs = 00001
rt = 00010
rd = 00011
shamt = 00000
funct = 100100


Binary: 000000 00001 00010 00011 00000 100100
Hex: 0x00221824

4--or $3, $1, $2
opcode = 000000
rs = 00001
rt = 00010
rd = 00011
shamt = 00000
funct = 100101


Binary: 000000 00001 00010 00011 00000 100101
Hex: 0x00221825

5--slt $3, $1, $2
opcode = 000000
rs = 00001
rt = 00010
rd = 00011
shamt = 00000
funct = 101010


Binary: 000000 00001 00010 00011 00000 101010
Hex: 0x0022182A

6-- lw $2, 16($1)

(load word from memory[ $1 + 16 ])

opcode = 100011
rs = 00001
rt = 00010
immediate = 0000000000010000 (16)


Binary: 100011 00001 00010 0000000000010000
Hex: 0x8C220010

7-- sw $2, 16($1)

(store word to memory[ $1 + 16 ])

opcode = 101011
rs = 00001
rt = 00010
immediate = 0000000000010000


Binary: 101011 00001 00010 0000000000010000
Hex: 0xAC220010

8-- beq $1, $2, 16

(branch to PC + 4 + 16×4 if $1 == $2)

opcode = 000100
rs = 00001
rt = 00010
immediate = 0000000000010000


Binary: 000100 00001 00010 0000000000010000
Hex: 0x10220010


*/



