`timescale 1ns / 1ps

module DCT_4point(
    input signed [3:0]  x0, x1, x2, x3,
    output signed [11:0] y0, y1, y2, y3
    );
    wire [11:0] p1, p0, m0, m1;
    // stage 1
    assign p0 = x0 + x3;
    assign m0 = x0 - x3;
    assign p1 = x1 + x2;
    assign m1 = x1 - x2;    
    
    parameter c1 = 1; // 0.9239;
    parameter c2 = 2; // 0.7071;
    parameter c3 = 3; // 0.3827;
    
    // stage 2
    assign y0 = (p0 + p1) * c2;
    assign y1 = (m0 * c1) + (m1 * c3);
    assign y2 = (p0 - p1) * c2;
    assign y3 = (m0 * c3) - (m1 * c1);
endmodule

        