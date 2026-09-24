////////////// Design
module design (
    input clk,
    input rst,
    input [7:0] din,
    output reg [7:0] dout
);

    reg [7:0] data;

    always @(posedge clk) begin
        if (rst)
            data <= 8'b0;
        else
            data <= din;
    end

    always @(*) begin
        dout = data + 8'b00000001;
    end

endmodule

/////////////Testbench
module testbench;

    reg clk;
    reg rst;
    reg [7:0] din;

    wire [7:0] dout;

    design dut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .dout(dout)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);
    end

    initial begin
        rst = 1;
        din = 8'b00000000;

        #10;
        rst = 0;

        #10;
        din = 8'b00000101;

        #10;
        din = 8'b00001010;

        #10;
        din = 8'b00001111;

        #20;
        $finish;
    end

    initial begin
        $monitor("Time=%0t clk=%b rst=%b din=%d dout=%d",
                 $time, clk, rst, din, dout);
    end

endmodule