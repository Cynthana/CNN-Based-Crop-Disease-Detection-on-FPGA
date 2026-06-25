module tb_top;

reg clk;
wire out_signal;

cnn_top uut (
    .clk(clk),
    .out_signal(out_signal)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;

    #100;

    // DISPLAY OUTPUT
    if(out_signal == 1)
        $display("Crop Condition: Diseased");
    else
        $display("Crop Condition: Healthy");

    $finish;
end

endmodule