Write a testbench that initializes clk to 0.

`timescale 1ns/1ps

module tb;
reg clk;

initial begin
  clk = 1'b0;
  $display("Clk : %0d", clk);
end

endmodule 