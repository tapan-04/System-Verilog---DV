Write a testbench that prints the simulation time whenever posedge clk occurs.

`timescale 1ns/1ps

module tb;
  
  reg clk = 0;
  
  always #11 clk = ~clk;
  
  initial begin
    forever begin
      @(posedge clk);
    $display("Time : %0t", $time);
    end
  end
  
  initial begin
    #100;
    $finish();
  end
endmodule