`timescale 1ns / 1ps
module MAC_4bit_test;
    reg [3:0]a, b;
    wire [9:0]y;
    reg rst, clk;
    MAC_4bit UUT(a, b, clk, rst, y);
    initial
    begin
        rst = 1'b0;
        clk = 1'b0;
        #10;
        rst = 1'b1;
        a = 5;
        b = 4;
        #50;
    end
    always #5 clk = ~clk;
    
endmodule
