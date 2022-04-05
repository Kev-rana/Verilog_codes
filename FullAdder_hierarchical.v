`timescale 1ns / 1ps

module FullAdder_hierarchical(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );
    wire w1, w2, w3;
    HalfAdder_dataflow HA1(a, b, w1, w2);
    HalfAdder_dataflow HA2(w1, cin, sum, w3);
    or o1(cout, w2, w3);
endmodule
