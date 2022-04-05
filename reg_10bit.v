`timescale 1ns / 1ps
module reg_10bit(
    input [9:0] d,
    input clk,
    input rst,
    output reg [9:0] q
    );
    always @(posedge clk or negedge rst)
    if( !rst)
        q <= 10'b0000000000;
    else
        q <= d;

endmodule
