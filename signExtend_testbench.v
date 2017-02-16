module signExtend_testbench();

reg [15:0] inp;
wire [31:0] result;



signExtend test(inp,result);

initial begin
// MSB = 0
inp[0] = 0; inp[1] = 1; inp[2] = 1; inp[3] = 1;
inp[4] = 0; inp[5] = 0; inp[6] = 0; inp[7] = 0;
inp[8] = 0; inp[9] = 0; inp[10] = 0; inp[11] = 0; 
inp[12] = 0; inp[13] = 0; inp[14] = 0; inp[15] = 0;

#1
// MSB = 1
inp[0] = 0; inp[1] = 1; inp[2] = 1; inp[3] = 1;
inp[4] = 0; inp[5] = 0; inp[6] = 0; inp[7] = 0;
inp[8] = 0; inp[9] = 0; inp[10] = 0; inp[11] = 0; 
inp[12] = 0; inp[13] = 0; inp[14] = 0; inp[15] = 1;

end

initial begin
$monitor("input => %16b, result => %32b", inp,result);
end
endmodule