module mux_2to1_Bit( inp1, inp2, select, out );

input select;
input inp1, inp2;
output out;

wire not_select,w1,w2;

not(not_select,select);
and(w1,not_select,inp1);
and(w2,inp2,select);
or(out,w1,w2);

endmodule