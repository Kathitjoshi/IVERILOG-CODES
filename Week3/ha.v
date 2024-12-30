module ha(a,b,s,c);
output s,c;
input a,b;
wire w1;
xor2 G1(s,a,b);
and2 G2(c,a,b);
endmodule