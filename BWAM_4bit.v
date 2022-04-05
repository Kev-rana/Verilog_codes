    `timescale 1ns / 1ps
    
    module BWAM_4bit(
        input  signed[3:0] a,
        input  signed[3:0] b,
        output signed[7:0] p
        );
        wire[18:1]w;
        supply0 Zero; supply1 One;
        assign p[0] = a[0] & b[0];
        FullAdder_hierarchical fa1 ((a[1]&b[0]),(a[0]&b[1]),Zero,p[1],w[1]);
        FullAdder_hierarchical fa2 ((a[2]&b[0]),(a[1]&b[1]),Zero,w[2],w[3]);
        FullAdder_hierarchical fa3 ((~(a[3]&b[0])),(a[2]&b[1]),Zero,w[4],w[5]);
        FullAdder_hierarchical fa4 (w[2],(a[0]&b[2]),w[1],p[2],w[6]);
        FullAdder_hierarchical fa5 (w[4],(a[1]&b[2]),w[3],w[7],w[8]);
        FullAdder_hierarchical fa6 ((~(a[3]&b[1])),(a[2]&b[2]),w[5],w[9],w[10]);
        FullAdder_hierarchical fa7 ((~(a[0]&b[3])),w[6], w[7], p[3],w[11]);
        FullAdder_hierarchical fa8 ((~(a[1]&b[3])),w[9],w[8],w[12],w[13]);
        FullAdder_hierarchical fa9 ((~(a[3]&b[2])),(~(a[2]&b[3])),w[10],w[14],w[15]);
        FullAdder_hierarchical fa10 (w[11],One,w[12],p[4],w[16]);
        FullAdder_hierarchical fa11 (w[14],w[13],w[16],p[5],w[17]);
        FullAdder_hierarchical fa12 ((a[3]&b[3]),w[15],w[17],p[6],w[18]);
        assign p[7]=~w[18];
    endmodule
