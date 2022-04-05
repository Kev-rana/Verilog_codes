`timescale 1ns / 1ps
module DTM_4bit(
    input [3:0] a,
    input [3:0] b,
    output [7:0] p
    );
    wire[22:1]w;
    assign p[0] = a[0] & b[0];
    
    //Stage 1
    HalfAdder_dataflow     ha1( a[0] & b[3] , a[1] & b[2]              , w[1]  , w[2]);
    HalfAdder_dataflow     ha2( a[1] & b[3] , a[2] & b[2]              , w[3]  , w[4]);
    
    //Stage 2
    FullAdder_hierarchical fa1( a[2] & b[1] , a[3] & b[0], w[1]        , w[7]  , w[8] ); 
    FullAdder_hierarchical fa2( a[3] & b[1] , w[3]       , w[2]        , w[9]  , w[10]);
    FullAdder_hierarchical fa3( a[2] & b[3] , a[3] & b[2], w[4]        , w[11] , w[12]);
    HalfAdder_dataflow     ha3( a[0] & b[2] , a[1] & b[1]              , w[5]  , w[6] );
    
    //Final Stage
    FullAdder_hierarchical fa8( a[3] & b[3] , w[12]      , w[17]       , p[6]  , p[7] );
    FullAdder_hierarchical fa7( w[11]       , w[10]      , w[16]       , p[5]  , w[17]);
    FullAdder_hierarchical fa6( w[8]        , w[9]       , w[15]       , p[4]  , w[16]);
    FullAdder_hierarchical fa5( w[7]        , w[6]       , w[14]       , p[3]  , w[15]);
    FullAdder_hierarchical fa4( w[5]        , a[2] & b[0], w[13]       , p[2]  , w[14]);
    HalfAdder_dataflow     ha4( a[0] & b[1] , a[1] & b[0]              , p[1]  , w[13]);

endmodule
