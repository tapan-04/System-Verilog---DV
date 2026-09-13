Write code to measure DUT response time:
start_time = ...;
// apply input
// wait for DUT output
end_time = ...;


`timescale 1ns/1ps

module tb;

  reg clk;
  reg [3:0] a, b;
  wire [4:0] sum;

  realtime start_time;
  realtime end_time;
  realtime response_time;

  assign sum = a + b;

  initial begin
    a = 0;
    b = 0;

    #10;
    start_time = $realtime;

    a = 5;
    b = 3;

    #1;
    wait(sum == 8);

    end_time = $realtime;

    response_time = end_time - start_time;

    $display("DUT Response Time : %0t", response_time);

    $finish();
  end

endmodule