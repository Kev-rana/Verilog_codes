`timescale 1ns / 1ps


module FIR_3rdOrder(
    input [3:0] x,
    input rst,
    input clk,
    output [9:0] y
    );
    wire [3:0] w1, w2, w3, w4;
    wire [7:0] w5, w6, w7, w8;
    wire [9:0] w9, w10;
    
    parameter b0 = 4'b0001;
    parameter b1 = 4'b0010;
    parameter b2 = 4'b0011;
    parameter b3 = 4'b0100;
    
    reg_4bit r1(x , clk, rst, w1);
    reg_4bit r2(w1, clk, rst, w2);
    reg_4bit r3(w2, clk, rst, w3);
    reg_4bit r4(w3, clk, rst, w4);
    
    assign w5  = w1 * b0;
    assign w6  = w2 * b1;
    assign w7  = w3 * b2;
    assign w8  = w4 * b3;
    assign w9  = w5 + w6;
    assign w10 = w7 + w9;
    assign y   =w10 + w8;
        
endmodule
