module mux( select, inp, out );

input[1:0] select;
input[3:0] inp;
output     out;

assign out = inp[select];

endmodule