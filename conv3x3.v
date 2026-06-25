module conv3x3(
    input clk,

    input signed [7:0] p0,p1,p2,p3,p4,p5,p6,p7,p8,
    input signed [7:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,

    output reg signed [15:0] result
);

always @(posedge clk) begin
    result <= 
        p0*w0 + p1*w1 + p2*w2 +
        p3*w3 + p4*w4 + p5*w5 +
        p6*w6 + p7*w7 + p8*w8;
end

endmodule