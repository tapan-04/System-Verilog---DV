Write a testbench using $realtime to display simulation time with fractional precision.

`timescale 1ns/1ps

module tb;
  
  initial begin
    #11.67
    $display("Value : %0t", $realtime);
  end
endmodule