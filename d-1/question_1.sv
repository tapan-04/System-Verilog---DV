"Assume a system consists of two global signals, resetn and clk. 
Use an initial block to initialize clk to '0 and resetn to '0. 
The user must maintain resetn in an active-low state for 60 ns at 
the start of the simulation and then make it active-high. Assume a 
timescale of 1 ns/1 ps"

`timescale 1ns / 1ps

module tb();

  reg rst = 0;

  initial begin
    rst = 1'b0;
    #60;
    rst = 1'b1;
  end
  
  initial begin
    $monitor ("rst = %0d : time = %0t", rst , $time);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    #100;
    $finish;
  end

endmodule



