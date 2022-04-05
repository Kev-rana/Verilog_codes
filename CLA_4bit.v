`timescale 1ns / 1ps

module CLA_4bit(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );
    wire [3:0]c, p, g;
    assign c[0] = cin;
    assign p = a ^ b;
    assign g = a & b;
    assign c[1] = (p[0] & c[0]) | g[0];
    assign c[2] = (p[1] & p[0] & c[0]) | (p[1] & g[0]) | g[1];
    assign c[3] = (p[2] & p[1] & p[0] & c[0]) | (p[2] & p[1] & g[0]) | (p[2] & g[1]) | g[2];
    assign cout = (p[3] & p[2] & p[1] & p[0] & c[0]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & g[1]) | (p[3] & g[2]) | g[3];  
    assign s = p ^ c;
endmodule
