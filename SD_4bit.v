`timescale 1ns / 1ps


module SD_4bit(
    input [3:0] a,
    output [7:0] p
    );
    wire [1:4]w;
    supply0 Zero;
    assign p[0] = a[0];
    assign p[1] = Zero;
    assign p[2] = a[1] & ~a[0];
    FullAdder_hierarchical fa1( a[3] & a[0], a[2] & ~a[1], w[1], p[4], w[2]);
    HalfAdder_dataflow     ha1( a[1] & a[0], a[2] &  a[0],       p[3], w[1]);
    HalfAdder_dataflow     ha2(        w[3], a[3] & ~a[2],       p[6], w[4]);
    HalfAdder_dataflow     ha3(        w[4], a[3] &  a[2],       p[7], w[4]);
    FullAdder_hierarchical fa2( a[3] & a[1], a[3] &  a[1], w[2], p[5], w[3]);    
endmodule
