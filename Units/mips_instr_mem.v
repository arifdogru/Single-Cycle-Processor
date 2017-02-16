module mips_instr_mem(instruction, program_counter);
input [31:0] program_counter;
output [31:0] instruction;

reg [31:0] instr_mem [0:255];

initial begin
	$readmemb(".\\instruction.mem", instr_mem);
end

assign instruction = instr_mem[program_counter];

endmodule