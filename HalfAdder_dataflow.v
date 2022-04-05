`timescale 1ns / 1ps

module HalfAdder_dataflow(
    input A, B,
    output Sum, Cout
    );
    assign Sum  = A ^ B;
    assign Cout = A & B;
endmodule
