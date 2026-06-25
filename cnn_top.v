module cnn_top(
    input clk,
    output reg out_signal
);

wire signed [15:0] conv_out;
wire signed [15:0] relu_out;

// Sample pixel inputs (simulate image patch)
wire signed [7:0] p0=45, p1=60, p2=30;
wire signed [7:0] p3=70, p4=90, p5=20;
wire signed [7:0] p6=10, p7=50, p8=80;

// ? TRAINED WEIGHTS (REPLACE WITH YOUR VALUES)
wire signed [7:0] w0 = 23;
wire signed [7:0] w1 = -11;
wire signed [7:0] w2 = 45;
wire signed [7:0] w3 = 5;
wire signed [7:0] w4 = 78;
wire signed [7:0] w5 = -32;
wire signed [7:0] w6 = 60;
wire signed [7:0] w7 = -21;
wire signed [7:0] w8 = 14;

// Convolution
conv3x3 conv(
    clk,
    p0,p1,p2,p3,p4,p5,p6,p7,p8,
    w0,w1,w2,w3,w4,w5,w6,w7,w8,
    conv_out
);

// Activation
relu r1(conv_out, relu_out);

// Simple classification output
always @(posedge clk) begin
    if (relu_out > 50)
        out_signal <= 1;   // Diseased
    else
        out_signal <= 0;   // Healthy
end

endmodule