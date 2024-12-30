module fatb; 
    reg a, b, cin; 
    wire s, cout; 
    fa add1 ( a, b, cin, sum, cout ); 
    initial begin
        #0 a = 1'b0; b = 1'b0; cin = 1'b0; 
        #5 a = 1'b0; b = 1'b0; cin = 1'b1; 
        #5 a = 1'b0; b = 1'b0; cin = 1'b1;
        #5 a = 1'b0; b = 1'b1; cin = 1'b0; 
        #5 a = 1'b0; b = 1'b1; cin = 1'b1; 
        #5 a = 1'b1; b = 1'b0; cin = 1'b0; 
        #5 a = 1'b1; b = 1'b0; cin = 1'b1; 
        #5 a = 1'b1; b = 1'b1; cin = 1'b0; 
        #5 a = 1'b1; b = 1'b1; cin = 1'b1; 
    end
    initial begin 
        $monitor($time, "a=%b, b= %b, c= %b,sum= %b,carry= %b", a, b, cin, sum, cout); 
    end 
    initial begin 
        $dumpfile("fulladder.vcd"); 
        $dumpvars(0, fatb); 
    end 
endmodule