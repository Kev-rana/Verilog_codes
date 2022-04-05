`timescale 1ns / 1ps

module CLA_4bit_test;
    reg [3:0] A,B;
    reg Cin;
    wire [3:0]Sum;
    wire Cout;
    reg [4:0]check;
    CLA_4bit UUT(.a(A), .b(B), .cin(Cin), .s(Sum), .cout(Cout));
    initial repeat(10)
    begin
        A = $random;
        B = $random;
        Cin = 1'b0;
        check = A + B + Cin;
        #10
        $display($time, ": %d + %d + %d = %d(%d)", A, B, Cin ,{Cout, Sum}, check);
    end

endmodule
