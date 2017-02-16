module mips_data_mem (read_data, mem_address, write_data, sig_mem_read, sig_mem_write);
output [31:0] read_data;
input [31:0] mem_address;
input [31:0] write_data;
input sig_mem_read;
input sig_mem_write;

reg [7:0] data_mem [1023:0];
//reg [31:0] data_mem  [255:0];

// I put this to get rid of the error below
// Error (10137): Verilog HDL Procedural Assignment error at mips_data_mem.v(19): object "read_data" on left-hand side of assignment must have a variable data type
reg [31:0] read_data;

initial begin
	$readmemb(".\\data.mem", data_mem);
end

always @(mem_address or write_data or sig_mem_read or sig_mem_write) begin
	if (sig_mem_read) begin
		read_data = {data_mem[mem_address], data_mem[mem_address+1], data_mem[mem_address+2], data_mem[mem_address+3]};
	end
	
	if (sig_mem_write) begin
		data_mem[mem_address] <= write_data[7:0];
		data_mem[mem_address+1] <= write_data[15:8];
		data_mem[mem_address+2] <= write_data[23:16];
		data_mem[mem_address+3] <= write_data[31:24];
	end
end

endmodule