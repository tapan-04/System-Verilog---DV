"Assume a system consists of two global signals, resetn and clk. 
Use an initial block to initialize clk to '0 and resetn to '0. 
Generate a 25 MHz square wave waveform for the Signal clk. Assume a 
timescale of 1 ns/1 ps."

`timescale 1ns / 1ps

module tb();

  reg clk;
  reg resetn;

  initial begin
    clk = 0;
    resetn = 0;
  end

  always #20 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    $monitor("clk = %0d : time = %0t", clk , $time);
  end
  
  initial begin
    #200;
    $finish();
  end
  
endmodule

