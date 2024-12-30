module demux1to2_tb;

    reg din;
    reg sel;
    wire y0;
    wire y1;

    // Instantiate the 1:2 demultiplexer
    demux1to2 uut (
        .din(din),
        .sel(sel),
        .y0(y0),
        .y1(y1)
    );

    initial begin
        // Initialize waveform output for GTKWave
        $dumpfile("demux1to2_tb.vcd");
        $dumpvars(0, demux1to2_tb);

        // Test cases
        din = 1; sel = 0; #10;  // Output should be y0 = 1, y1 = 0
        din = 1; sel = 1; #10;  // Output should be y0 = 0, y1 = 1
        din = 0; sel = 0; #10;  // Output should be y0 = 0, y1 = 0
        din = 0; sel = 1; #10;  // Output should be y0 = 0, y1 = 0

        // Finish simulation
        $finish;
    end

    // Monitor the output
    initial begin
        $monitor("Time = %0t | din = %b | sel = %b | y0 = %b | y1 = %b",
                 $time, din, sel, y0, y1);
    end

endmodule
