`timescale 1ns / 1ps

module rca_4bit(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );
    supply0 zero;
    wire [3:1] c;
    FullAdder_hierarchical FA0(a[0], b[0], cin , s[0], c[1]);
    FullAdder_hierarchical FA1(a[1], b[1], c[1], s[1], c[2]);
    FullAdder_hierarchical FA2(a[2], b[2], c[2], s[2], c[3]);
    FullAdder_hierarchical FA3(a[3], b[3], c[3], s[3], cout);
endmodule
