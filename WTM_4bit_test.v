`timescale 1ns / 1ps

module WTM_4bit_test;
    reg [3:0] A,B;
    wire [7:0]Product;
    reg  [7:0]check;
    WTM_4bit UUT(.a(A), .b(B), .p(Product));
    initial repeat(10)
    begin
        A = $random;
        B = $random;
        check = A * B;
        #10
        $display($time, ": %d x %d = %d (%d) ", A, B, Product, check);
    end
endmodule
