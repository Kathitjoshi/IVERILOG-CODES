module Circuit3tb;
    reg A, B, C;
    wire Z;
    Circuit3 M1 (A, B, C, Z);
    initial begin
        A = 1'b0;
        B = 1'b0;
        C = 1'b0;

        #20 A = 1'b0;
        B = 1'b0;
        C = 1'b1;

        #20 A = 1'b0;
        B = 1'b1;
        C = 1'b0;

        #20 A = 1'b0;
        B = 1'b1;
        C = 1'b1;

        #20 A = 1'b1;
        B = 1'b0;
        C = 1'b0;

        #20 A = 1'b1;
        B = 1'b0;
        C = 1'b1;

        #20 A = 1'b1;
        B = 1'b1;
        C = 1'b0;

        #20 A = 1'b1;
        B = 1'b1;
        C = 1'b1;
    end
    initial begin
        $monitor($time, "A = %b, B = %b, C = %b, Z = %b", A, B, C, Z);
    end
    initial begin
        $dumpfile("Circuit3.vcd");
        $dumpvars(0, Circuit3tb);
    end
endmodule