module and2(
    output y,
    input a,
    input b
    
);
assign y = a&b;
endmodule

module or2(
    output y,
    input a,
    input b
    
);
assign y = a|b;
endmodule

module not1(
    output y,
    input a
   );
assign y = !a;
endmodule

module xor2(
output c,
input a,
input b
);
assign c=a^b;
endmodule;


module fa (
    input wire a, b, cin,
    output wire sum, cout
);

    wire [4:0] t;

    xor x0 (t[0], a, b); 
    xor x1 (sum, t[0], cin); 

    and a0 (t[1], a, b); 
    and a1 (t[2], a, cin); 
    and a2 (t[3], b, cin); 

    or o0 (t[4], t[1], t[2]); 
    or o1 (cout, t[4], t[3]); 
endmodule

module mux_21(input wire I0,I1,J,output wire O);
assign O=J?I0:I1;
endmodule