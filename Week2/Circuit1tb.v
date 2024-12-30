module Circuit1tb;
    reg A, B, C;
    wire D, E; 
    Circuit1 M1 (A, B, C, D, E); //M1 is the instance name and this line defines an instance
    initial begin //Beginning of a block of code
        A = 1'b0; // 1'b means 1 byte
        B = 1'b0;
        C = 1'b0;

        #20 A = 1'b0; //#20 is refresh time
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
        $monitor($time, "A = %b, B = %b, C = %b, D = %b, E = %b", A, B, C, D, E); //display on the monitor
    end
    initial begin
        $dumpfile("Circuit1.vcd"); 
        $dumpvars(0, Circuit1tb);
    end
endmodule