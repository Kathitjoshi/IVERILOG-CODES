module demux1to2 (
    input wire din,    // Input data
    input wire sel,    // Select signal
    output wire y0,    // Output 0
    output wire y1     // Output 1
);

    // Demultiplexer logic
    assign y0 = (sel == 1'b0) ? din : 1'b0;
    assign y1 = (sel == 1'b1) ? din : 1'b0;

endmodule
