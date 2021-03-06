`timescale 1ns / 1ps

module reg_4bit(
    input [3:0] d,
    input clk,
    input rst,
    output reg [3:0] q
    );
    always @(posedge clk or negedge rst)
        if( !rst)
            q <= 4'b0000;
        else
            q <= d;
endmodule
