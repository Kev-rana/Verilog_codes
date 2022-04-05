`timescale 1ns / 1ps

module SD_4bit_test;
    reg [3:0] A;
    wire [7:0]Square;
    reg  [7:0]check;
    SD_4bit UUT(.a(A), .p(Square));
    initial repeat(10)
    begin
        A = $random;
        check = A * A;
        #10
        $display($time, ": %d x %d = %d (%d) ", A, A, Square, check);
    end
endmodule

