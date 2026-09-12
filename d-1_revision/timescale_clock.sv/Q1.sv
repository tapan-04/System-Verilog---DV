Write a testbench to generate a 16 MHz clock.

`timescale 1ns/1ps;

module tb;
  
  bit clk;
  
  always #31.25 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    #100;
    $finish();
  end
endmodule