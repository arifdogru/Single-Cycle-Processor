module mips_ALU_1Bit(bi,Aluop,ai,ci,lessi,ri,c2);

input bi,ai,lessi,ci;
input [2:0] Aluop;

output c2,ri;

wire w1,w2,w3,w4,w5,w6,w7,w8,w9;
wire [3:0] wireArray;

xor(w1,bi,Aluop[2]);
or(w3,ai,w1); // w3 will used in mux 1st
and(w2,w1,ai); // w2 will used in mux 0th
not(w4,w2);		
and(w5,w4,w3);
and(w6,w5,ci);
or(w7,w5,ci);
or(c2,w6,w2);
not(w8,w6);
and(w9,w8,w7); // w9 will used in mux 2nd


assign wireArray[3] = lessi;
assign wireArray[1] = w3;
assign wireArray[0] = w2;
assign wireArray[2] = w9;

mux m2(Aluop[1:0], wireArray[3:0],ri);

endmodule