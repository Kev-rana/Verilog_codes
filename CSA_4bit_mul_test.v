`timescale 1ns / 1ps
module CSA_4bit_mul_test;
    reg [3:0] A,B;
    wire [7:0]Product;
    reg  [7:0]check;
    CSA_4bit_mul UUT(.a(A), .b(B), .p(Product));
    initial repeat(10)
    begin
        A = $random;
        B = $random;
        check = A * B;
        #10
        $display($time, ": %d x %d  =  %d ", A, B, Product, check);
    end

endmodule
