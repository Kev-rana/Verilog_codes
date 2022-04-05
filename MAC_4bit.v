`timescale 1ns / 1ps

module MAC_4bit(
    input [3:0] a,
    input [3:0] b,
    input clk,
    input rst,
    output [9:0] y
    );
    wire [3:0]w1, w2;
    wire [7:0]w3, w4;
    wire [9:0]w5, w6;
    reg_4bit  R1(a, clk, rst, w1);
    reg_4bit  R2(b, clk, rst, w2);
    reg_8bit  R3(w3, clk, rst, w4);
    reg_10bit R4(w5, clk, rst, w6);    
    assign w3 = w1 * w2;
    assign w5 = w4 + w6;
    assign y = w6;

endmodule
    