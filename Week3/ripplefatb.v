module ripplefatb;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;

ripplefa uut(a,b,cin,sum,cout);

initial begin
cin = 0;
a = 4'b0110;
b = 4'b1100;
#10
a = 4'b1110;
b = 4'b1000;
#10
a = 4'b0111;
b = 4'b1110;
#10
a = 4'b0010;
b = 4'b1001;
end
initial begin 
    $monitor($time, "a=%b, b= %b, c= %b,sum= %b,carry= %b", a, b, cin, sum, cout); 
end 
initial begin 
    $dumpfile("rcatb.vcd"); 
    $dumpvars(0, ripplefatb); 
 end 
                
endmodule