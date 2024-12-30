
module tb_pc;
    reg clk;
    reg reset;
    reg inc;
    reg add;
    reg sub;
    reg [15:0] offset;

    wire [15:0] pc;

    pc uut (
    .clk(clk),
    .reset(reset),
    .inc(inc),
    .add(add),
    .sub(sub),
    .offset(offset),
    .pc(pc)
    );

    initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        inc = 0;
        add = 0;
        sub = 0;
        offset = 16'h0000;

        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        $monitor("Time: %0t | Reset: %b | Inc: %b | Add: %b | Sub: %b | Offset: %h | PC: %h", $time, reset, inc, add, sub, offset, pc);

        // Test sequence
        inc = 1; add = 0; sub = 0; offset = 16'hXXXX; #10;
        inc = 0; add = 1; sub = 0; offset = 16'h00A5; #10;
        inc = 0; add = 0; sub = 0; offset = 16'hXXXX; #10;
        inc = 1; add = 0; sub = 0; offset = 16'hXXXX; #10;
        inc = 0; add = 0; sub = 1; offset = 16'h0014; #10;

        $finish;
    end


    initial begin
    $dumpfile("pc.vcd");
    $dumpvars(0, tb_pc);
    end

endmodule
