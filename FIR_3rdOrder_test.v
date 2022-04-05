`timescale 1ns / 1ps

module FIR_3rdOrder_test;
    reg [3:0] X;
    reg Clk, Rst;
    wire [9:0] Y;
    
    FIR_3rdOrder UUT(X, Rst, Clk, Y);
    
    initial
    begin
        Rst = 1'b0;
        Clk = 1'b0;
        #10;
        Rst = 1'b1;
        X = 1;
        #10;
        X = 2;
        #10;
        X = 3;
        #10;
        X = 4;
        #10;
        X = 0;
    end
    
    always #5 Clk = ~Clk;
  
endmodule
    