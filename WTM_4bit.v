`timescale 1ns / 1ps

module WTM_4bit(
    input [3:0] a,
    input [3:0] b,
    input [7:0] p
    );
    wire[22:1]w;
    assign p[0] = a[0] & b[0];
    
    //Stage 1
    HalfAdder_dataflow     ha1( a[1] & b[0] , a[0] & b[1]              , p[1]  , w[1]);
    FullAdder_hierarchical fa1( a[2] & b[0] , a[1] & b[1], a[0] & b[2] , w[2]  , w[3]); 
    FullAdder_hierarchical fa2( a[3] & b[0] , a[2] & b[1], a[1] & b[2] , w[4]  , w[5]);
    FullAdder_hierarchical fa3( a[3] & b[1] , a[2] & b[2], a[1] & b[3] , w[6]  , w[7]);
    HalfAdder_dataflow     ha2( a[3] & b[2] , a[2] & b[3]              , w[8]  , w[9]);
    
    //Stage 2
    HalfAdder_dataflow     ha3( w[1]        , w[2]       , p[2]        , w[10]);
    FullAdder_hierarchical fa4( w[3]        , w[4]       , a[0] & b[3] , w[11] , w[12]);
    HalfAdder_dataflow     ha4( w[5]        , w[6]                     , w[13] , w[14]);
    HalfAdder_dataflow     ha5( w[7]        , w[8]                     , w[15] , w[16]);
    HalfAdder_dataflow     ha6( w[9]        , a[3] & b[3]              , w[17] , w[18]);
    
    //Final Stage
    HalfAdder_dataflow     ha7( w[11]      , w[10]       , p[3]        , w[19]);
    FullAdder_hierarchical fa5( w[13]      , w[12]       ,  w[19]      , p[4]  , w[20]);
    FullAdder_hierarchical fa6( w[15]      , w[14]       ,  w[20]      , p[5]  , w[21]);
    FullAdder_hierarchical fa7( w[17]      , w[16]       ,  w[21]      , p[6]  , w[22]);
    xor(p[7], w[18], w[22]);
            
endmodule
