`timescale 1ns / 1ps
module DCT_4point_test;
    reg signed [3:0] x0, x1, x2, x3;
    wire signed [11:0] y0, y1, y2, y3;
    
    DCT_4point UUT(x0, x1, x2, x3, y0, y1, y2, y3);
    
    initial
    begin
        x0 = 1; // $random;
        x1 = 2; //$random;
        x2 = 3; //$random;
        x3 = 4; //$random;
        #10

        $display($time, "  : x = [ %d %d %d %d ] --> X = [ %d %d %d %d ] ", x0, x1, x2, x3, y0, y1, y2, y3);
    end 
endmodule