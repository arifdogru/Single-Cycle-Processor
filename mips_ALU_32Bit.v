module mips_ALU_32Bit(Aluop, b, a, r, z, v,cout);

input [2:0]Aluop;
input [31:0]b;
input [31:0]a;

output [31:0]r;
output z,v,cout;

wire [31:0]c;
wire set;
wire out_or;


mips_ALU_1Bit Alu1(b[0],Aluop[2:0],a[0],Aluop[2],set,r[0],c[0]);
mips_ALU_1Bit Alu2(b[1],Aluop[2:0],a[1],c[0],0,r[1],c[1]);
mips_ALU_1Bit Alu3(b[2],Aluop[2:0],a[2],c[1],0,r[2],c[2]);
mips_ALU_1Bit Alu4(b[3],Aluop[2:0],a[3],c[2],0,r[3],c[3]);
mips_ALU_1Bit Alu5(b[4],Aluop[2:0],a[4],c[3],0,r[4],c[4]);
mips_ALU_1Bit Alu6(b[5],Aluop[2:0],a[5],c[4],0,r[5],c[5]);
mips_ALU_1Bit Alu7(b[6],Aluop[2:0],a[6],c[5],0,r[6],c[6]);
mips_ALU_1Bit Alu8(b[7],Aluop[2:0],a[7],c[6],0,r[7],c[7]);

mips_ALU_1Bit Alu9(b[8],Aluop[2:0],a[8],c[7],0,r[8],c[8]);
mips_ALU_1Bit Alu10(b[9],Aluop[2:0],a[9],c[8],0,r[9],c[9]);
mips_ALU_1Bit Alu11(b[10],Aluop[2:0],a[10],c[9],0,r[10],c[10]);
mips_ALU_1Bit Alu12(b[11],Aluop[2:0],a[11],c[10],0,r[11],c[11]);
mips_ALU_1Bit Alu13(b[12],Aluop[2:0],a[12],c[11],0,r[12],c[12]);
mips_ALU_1Bit Alu14(b[13],Aluop[2:0],a[13],c[12],0,r[13],c[13]);
mips_ALU_1Bit Alu15(b[14],Aluop[2:0],a[14],c[13],0,r[14],c[14]);
mips_ALU_1Bit Alu16(b[15],Aluop[2:0],a[15],c[14],0,r[15],c[15]);

mips_ALU_1Bit Alu17(b[16],Aluop[2:0],a[16],c[15],0,r[16],c[16]);
mips_ALU_1Bit Alu18(b[17],Aluop[2:0],a[17],c[16],0,r[17],c[17]);
mips_ALU_1Bit Alu19(b[18],Aluop[2:0],a[18],c[17],0,r[18],c[18]);
mips_ALU_1Bit Alu20(b[19],Aluop[2:0],a[19],c[18],0,r[19],c[19]);
mips_ALU_1Bit Alu21(b[20],Aluop[2:0],a[20],c[19],0,r[20],c[20]);
mips_ALU_1Bit Alu22(b[21],Aluop[2:0],a[21],c[20],0,r[21],c[21]);
mips_ALU_1Bit Alu23(b[22],Aluop[2:0],a[22],c[21],0,r[22],c[22]);
mips_ALU_1Bit Alu24(b[23],Aluop[2:0],a[23],c[22],0,r[23],c[23]);

mips_ALU_1Bit Alu25(b[24],Aluop[2:0],a[24],c[23],0,r[24],c[24]);
mips_ALU_1Bit Alu26(b[25],Aluop[2:0],a[25],c[24],0,r[25],c[25]);
mips_ALU_1Bit Alu27(b[26],Aluop[2:0],a[26],c[25],0,r[26],c[26]);
mips_ALU_1Bit Alu28(b[27],Aluop[2:0],a[27],c[26],0,r[27],c[27]);
mips_ALU_1Bit Alu29(b[28],Aluop[2:0],a[28],c[27],0,r[28],c[28]);
mips_ALU_1Bit Alu30(b[29],Aluop[2:0],a[29],c[28],0,r[29],c[29]);
mips_ALU_1Bit Alu31(b[30],Aluop[2:0],a[30],c[29],0,r[30],c[30]);
mips_ALU_1Bit_MSB Alu32(b[31],Aluop[2:0],a[31],c[30],0,r[31],set,v,cout);

or(out_or,r[0],r[1],r[2],r[3],r[4],r[5],r[6],r[7],r[8],
	r[9],r[10],r[11],r[12],r[13],r[14],r[15],r[16],
	r[17],r[18],r[19],r[20],r[21],r[22],r[23],r[24],
	r[25],r[26],r[27],r[28],r[29],r[30],r[31]);
not(z,out_or);
	
endmodule