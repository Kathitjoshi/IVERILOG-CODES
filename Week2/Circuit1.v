module Circuit1 (
    A,
    B,
    C,
    D,
    E
);

    output D, E;
    input A, B, C;
    wire w1; //intermediate results
    and G1 (w1,A,B); //G1,G2,G3 are optional; If A,B,w1 doesn't work try w1,A,B,similarly for others(o/p first then i/p)
    not G2 (E,C);
    or G3 (D,w1,E);
endmodule