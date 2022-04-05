`timescale 1ns / 1ps

module SD_6bit_test;
    reg [5:0] A;
    wire [11:0]Square;
    reg  [11:0]check;
    SD_6bit UUT(.a(A), .p(Square));
    initial repeat(10)
    begin
        A = $random;
        check = A * A;
        #10
        $display($time, ": %d x %d = %d (%d) ", A, A, Square, check);
    end
endmodule
