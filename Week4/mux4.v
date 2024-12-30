module mux4(input wire [0:3]i,input wire j1,j0,output wire O);
wire t0,t1;
mux_21 mux2_0(i[0],i[1],j1,t0);
mux_21 mux2_1(i[2],i[3],j1,t1);
mux_21 mux2_3(t0,t1,j0,O);
endmodule