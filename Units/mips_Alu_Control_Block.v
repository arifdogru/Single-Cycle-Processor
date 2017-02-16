module mips_Alu_Control_Block( func, Aluop, Aluctr );

input [5:0] func;
input[1:0] Aluop;

output [2:0] Aluctr;

wire r1,r2,r3,r4;

//Aluctr<2>
and(r1,Aluop[1],func[1]);
or(Aluctr[2],Aluop[0],r1);

//Aluctr<1>
not(r2,Aluop[1]);
not(r3,func[2]);
or(Aluctr[1],r2,r3);

//Aluctr<0>
or(r4,func[3],func[0]);
and(Aluctr[0],Aluop[1],r4);

endmodule