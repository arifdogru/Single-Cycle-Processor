module mux_5to1_Bit( inp1, inp2, select, out );

input select;
input[4:0] inp1 , inp2;
output [4:0] out;

mux_2to1_Bit mux1(inp1[0],inp2[0],select,out[0]);
mux_2to1_Bit mux2(inp1[1],inp2[1],select,out[1]);
mux_2to1_Bit mux3(inp1[2],inp2[2],select,out[2]);
mux_2to1_Bit mux4(inp1[3],inp2[3],select,out[3]);
mux_2to1_Bit mux5(inp1[4],inp2[4],select,out[4]);


endmodule