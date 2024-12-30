module mux_21_tb;
reg A,B,S;
wire X;
initial
begin
$dumpfile("mux21.vcd");
$dumpvars(0,mux_21_tb);
end
mux_21 newMux(.I0(A),.I1(B),.J(S),.O(X));
initial
begin
S=1'b0;A=1'b0;B=1'b0;
#5 S=1'b0;A=1'b0;B=1'b1;
#5 S=1'b0;A=1'b1;B=1'b0;
#5 S=1'b0;A=1'b1;B=1'b1;
#5 S=1'b1;A=1'b0;B=1'b0;
#5 S=1'b1;A=1'b0;B=1'b1;
#5 S=1'b1;A=1'b1;B=1'b0;
#5 S=1'b1;A=1'b1;B=1'b1;
end
initial
begin
$monitor($time,"A=%b,B=%b,S=%b,X=%b",A,B,S,X);
end
endmodule