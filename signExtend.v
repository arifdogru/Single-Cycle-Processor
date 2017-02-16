module signExtend(inp, result);

input [15:0] inp;
output [31:0] result;

assign result = { {16{inp[15]} }, inp };

endmodule