module mux_32Bit( inp1, inp2, select, out );

input select;
input[31:0] inp1 , inp2;
output [31:0] out;

mux_5to1_Bit mux1( inp1[4:0], inp2[4:0], select, out[4:0]);
mux_5to1_Bit mux2( inp1[9:5], inp2[9:5], select, out[9:5]);
mux_5to1_Bit mux3( inp1[14:10], inp2[14:10], select, out[14:10]);
mux_5to1_Bit mux4( inp1[19:15], inp2[19:15], select, out[19:15]);
mux_5to1_Bit mux5( inp1[24:20], inp2[24:20], select, out[24:20]);
mux_5to1_Bit mux6( inp1[29:25], inp2[29:25], select, out[29:25]);
mux_2to1_Bit mux7(inp1[30],inp2[30],select,out[30]);
mux_2to1_Bit mux8(inp1[31],inp2[31],select,out[31]);


endmodule