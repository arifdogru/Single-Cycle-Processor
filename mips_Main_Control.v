module mips_Main_Control(op,RegWrite,AluSrc,RegDst,MemtoReg,MemRead,MemWrite,Branch,Jump,Aluop);

input [5:0] op;
output RegWrite,RegDst,AluSrc,MemRead,MemWrite,MemtoReg,Branch,Jump;
output [1:0] Aluop;

wire R_type,lw,sw,beq,jump_signal;
wire opnot0,opnot1,opnot2,opnot3,opnot4,opnot5;

// not all of op
not(opnot0,op[0]);
not(opnot1,op[1]); //
not(opnot2,op[2]);
not(opnot3,op[3]);
not(opnot4,op[4]);
not(opnot5,op[5]);

and(R_type,opnot0,opnot1,opnot2,opnot3,opnot4,opnot5); // R_type
and(lw,op[5],op[0],op[1],opnot2,opnot3,opnot4);        // Lw
and(sw,opnot2,opnot4,op[0],op[1],op[3],op[5]);         // Sw
and(beq,op[2],opnot0,opnot1,opnot3,opnot4,opnot5);     // beq
and(jump_signal,opnot0 ,op[1],opnot2,opnot3,opnot4,opnot5); // jump

or(RegWrite,R_type,lw);    // RegWrite Signal
or(AluSrc,lw,sw);          // AluSrc Signal
assign RegDst = R_type;    // RegDst Signal
assign MemtoReg = lw;      // MemtoReg Signal
assign MemRead = lw;       // MemRead Signal
assign MemWrite = sw;      // MemWrite Signal
assign Branch = beq;       // Branch Signal
assign Aluop[1] = R_type;  // Aluop<1> Signal 
assign Aluop[0] = beq;     // Aluop<0> Signal
assign Jump = jump_signal; // Jump Signal

endmodule