module full_adder_3input(
    input i0, i1, i2,    // 3 input bits
    output sum, carry    // Outputs: sum and carry
);
    wire s1, c1, c2;

    // Sum and carry for first two inputs
    assign s1 = i0 ^ i1;
    assign c1 = i0 & i1;

    // Final sum and carry after adding third input
    assign sum = s1 ^ i2;
    assign c2 = s1 & i2;

    // Final carry output
    assign carry = c1 | c2;
endmodule

module half_adder(
    input a, b,           // Inputs to the half adder
    output sum1, carry1   // Outputs: sum1 and carry1
);
    assign sum1 = a ^ b;
    assign carry1 = a & b;
endmodule

module and_gate_with_ycompliment(
    input i0, i1, i2,          // Inputs to the full adder
    input y_compliment,        // Additional input for AND gate
    input extra_input,         // Additional input for the half adder
    output sum1, carry1        // Outputs from the half adder
);
    wire sum, carry;
    wire final_and_output;

    // Instantiate the 3-input full adder
    full_adder_3input fa (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .sum(sum),
        .carry(carry)
    );

    // 3-input AND gate with sum, carry, and y_compliment
    assign final_and_output = sum & carry & y_compliment;

    // Instantiate the half adder using final_and_output and extra_input
    half_adder ha (
        .a(final_and_output),
        .b(extra_input),
        .sum1(sum1),
        .carry1(carry1)
    );
endmodule




module testbench;
    reg i0, i1, i2;          // Inputs to the full adder
    reg y_compliment;        // Input to the AND gate
    reg extra_input;         // Additional input to the half adder
    wire sum1, carry1;       // Outputs from the half adder

    // Instantiate the main module
    and_gate_with_ycompliment uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .y_compliment(y_compliment),
        .extra_input(extra_input),
        .sum1(sum1),
        .carry1(carry1)
    );

    initial begin
        // Open a VCD file to store waveform data for GTKWave
        $dumpfile("waveform.vcd");
        $dumpvars(0, testbench);

        // Monitor the signals in the console
        $monitor("Time = %0t | i0 = %b, i1 = %b, i2 = %b, y_compliment = %b, extra_input = %b | sum1 = %b, carry1 = %b", 
                  $time, i0, i1, i2, y_compliment, extra_input, sum1, carry1);

        // Test Case 1
        i0 = 0; i1 = 0; i2 = 0; y_compliment = 0; extra_input = 0;
        #10;
        
        // Test Case 2
        i0 = 0; i1 = 0; i2 = 1; y_compliment = 1; extra_input = 1;
        #10;

        // Test Case 3
        i0 = 0; i1 = 1; i2 = 1; y_compliment = 1; extra_input = 0;
        #10;

        // Test Case 4
        i0 = 1; i1 = 1; i2 = 1; y_compliment = 1; extra_input = 1;
        #10;

        // Test Case 5
        i0 = 1; i1 = 0; i2 = 1; y_compliment = 0; extra_input = 0;
        #10;

        // Test Case 6
        i0 = 0; i1 = 1; i2 = 0; y_compliment = 1; extra_input = 1;
        #10;

        // Test Case 7
        i0 = 1; i1 = 1; i2 = 0; y_compliment = 0; extra_input = 1;
        #10;

        // Test Case 8
        i0 = 1; i1 = 1; i2 = 1; y_compliment = 0; extra_input = 0;
        #10;

        $finish;
    end
endmodule
