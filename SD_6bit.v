`timescale 1ns / 1ps

module SD_6bit(
    input [5:0] a,
    output [11:0] p
    );   
    wire [1:21]w;
    supply0 Zero;
    assign p[0] = a[0];
    assign p[1] = Zero;
    assign p[2] = a[1] & ~a[0];
    HalfAdder_dataflow     ha1( a[1] & a[0], a[2] &  a[0]              , p[3] , w[1]);
    HalfAdder_dataflow     ha2( a[3] & a[0], a[2] & ~a[1]              , w[2] , w[3]);
    FullAdder_hierarchical fa1( a[4] & a[0], a[3] &  a[1], a[2] &  a[1], w[4] , w[5]);
    FullAdder_hierarchical fa2( a[5] & a[0], a[4] &  a[1], a[3] & ~a[2], w[6] , w[7]);
    FullAdder_hierarchical fa3( a[5] & a[1], a[4] &  a[2], a[3] &  a[2], w[8] , w[9]);
    HalfAdder_dataflow     ha3( a[5] & a[2], a[4] & ~a[3]              , w[10], w[11]);
    HalfAdder_dataflow     ha4( a[5] & a[3], a[4] &  a[3]              , w[12], w[13]);
    HalfAdder_dataflow     ha5(        w[1],         w[2]              , p[4] , w[14]);
    FullAdder_hierarchical fa4(        w[3],         w[4],        w[14], p[5] , w[15]);    
    FullAdder_hierarchical fa5(        w[5],         w[6],        w[15], p[6] , w[16]);    
    FullAdder_hierarchical fa6(        w[7],         w[8],        w[16], p[7] , w[17]);    
    FullAdder_hierarchical fa7(        w[9],        w[10],        w[17], p[8] , w[18]);    
    FullAdder_hierarchical fa8(       w[11],        w[12],        w[18], p[9] , w[19]);    
    FullAdder_hierarchical fa9(       w[13], a[5] & ~a[4],        w[19], p[10], w[20]);    
    HalfAdder_dataflow     ha6(       w[20], a[5] &  a[4]              , p[11], w[21]);    

endmodule
