module and_test;
    reg a, b;
    wire y;
    and and_test (y, a, b);
    initial begin
      #000 a = 0;
      b = 0;
      #100 a = 0;
      b = 1;
      #100 a = 1;
      b = 0;
      #100 a = 1;
      b = 1;
    #100;
    end
    initial begin
        $monitor($time, "a = %b, b = %b, y = %b", a, b, y);
    end
    initial begin
        $dumpfile("and_gate.vcd");
        $dumpvars(0, and_test);
    end
endmodule