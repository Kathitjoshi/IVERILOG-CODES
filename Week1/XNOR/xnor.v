
module xnorgate(
    output y,
    input a,
    input b
    
);

assign y = !(a ^ b);
endmodule