module mux_32Bit_testbench();

	reg [31:0]inp1;
	reg [31:0]inp2;
	reg select;

	wire [31:0]out;

   mux_32Bit test(inp1,inp2,select,out);
 
 initial begin


 inp1=32'b01011111010111110101111101011111;
 inp2=32'b00000000000000000000000000000000;
 select=0;

 
 #1;
 
 inp1=32'b00000000000000000000000000000000;
 inp2=32'b01011111010111110101111101011111;

 select=1;



 end
 
 initial begin
 $monitor("inp1 =>%32b inp2=%32b, select=%1b, out=%32b ",inp1, inp2, select, out);
 end
 



endmodule