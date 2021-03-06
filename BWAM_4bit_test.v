`timescale 1ns / 1ps

module BWAM_4bit_test(
    );
    reg signed[3:0]a,b;
    wire signed[7:0]p;
    reg signed[7:0]check;
    BWAM_4bit dut(a,b,p);
    initial repeat(10)begin
    a=$random;
    b=$random;
    check=a*b;
    #10;
    $display($time,"%d*%d=%d(%d)",a,b,p,check);
    end    
endmodule
