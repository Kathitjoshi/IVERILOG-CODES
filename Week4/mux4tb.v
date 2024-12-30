module mux4tb;
reg [0:3]ii;
reg s0,s1;
wire yy;
initial
begin
$dumpfile("mux4.vcd");
$dumpvars(0,mux4tb);
end
mux4 newMux(.i(ii),.j0(s0),.j1(s1),.O(yy));
initial
begin
ii=4'b0000;s0=1'b0;s1=1'b0;
#5 ii=4'b1000;s0=1'b0;s1=1'b0;
#5 ii=4'b0000;s0=1'b0;s1=1'b1;
#5 ii=4'b0100;s0=1'b0;s1=1'b1;
#5 ii=4'b0000;s0=1'b1;s1=1'b0;
#5 ii=4'b0010;s0=1'b1;s1=1'b0;
#5 ii=4'b0000;s0=1'b1;s1=1'b1;
#5 ii=4'b0001;s0=1'b1;s1=1'b1;
end
initial
begin
$monitor($time,"ii=%b,S1=%b,S0=%b,,y=%b",ii,s1,s0,yy);
end
endmodule