Write a testbench using $time to display the current simulation time.

`timescale 1ns/1ps

module tb;
  
  initial begin
    #11;
    $display("Current Simulation Time : %0t", $time);
  end
endmodule