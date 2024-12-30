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