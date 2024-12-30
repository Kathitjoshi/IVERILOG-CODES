module main(A,B,C,D,E);
output D,E;
input A,B,C;
wire w1;
and2 G1(w1,A,B);
not1 G2(E,C);
or2 G3(D,w1,E);
endmodule