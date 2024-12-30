`define TESTVECS 4  

module fa (input wire i0, i1, cin, output wire sum, cout);
   wire t0, t1, t2;

   
   assign sum = i0 ^ i1 ^ cin;

   
   assign t0 = i0 & i1;
   assign t1 = i1 & cin;
   assign t2 = cin & i0;

   
   assign cout = t0 | t1 | t2;
endmodule

module circuit3 (input wire [2:0] i1, input wire i2, output wire sum1, cout1);
   wire x1, x2;

   
   fa fa_1(i1[0], i1[1], i1[2], x1, x2);

   
   fa fa_2(x1, x2, i2, sum1, cout1);
endmodule

module tb;
   reg [2:0] i1;
   reg i2;
   wire sum1, cout1;
   reg [3:0] test_vecs [0:(`TESTVECS-1)];  
   integer i;

   initial begin
      $dumpfile("circuit_4.vcd");
      $dumpvars(0, tb);
   end

   initial begin
     
      test_vecs[0] = 4'b0000;
      test_vecs[1] = 4'b1001;
      test_vecs[2] = 4'b0010;
      test_vecs[3] = 4'b1111;
   end

   initial {i1, i2} = 0;

   
   circuit3 circuit3_0 (i1, i2, sum1, cout1);

   initial begin
      $display("Time\t i1\t i2\t sum1\t cout1");
      $monitor("%0t\t %b\t %b\t %b\t %b", $time, i1, i2, sum1, cout1);
      for (i = 0; i < `TESTVECS; i = i + 1) begin
         #10 {i1, i2} = test_vecs[i];
      end
   end
endmodule
