module mux_21(input wire I0,I1,J,output wire O);
assign O=J?I0:I1;
endmodule