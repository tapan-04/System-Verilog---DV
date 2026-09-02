"Use an initial block to initialize clk to '0 and resetn to '0. 
The user must maintain resetn in an active-low state for 100 ns at
the start of the simulation, then toggle resetn to active-high ('1) 
and back to active-low ('0) every 50 ns thereafter. 
Assume a timescale of 1 ns/1 ps."



`timescale 1ns / 1ps

module tb();

  reg clk;
  reg resetn;

  initial begin
    clk = 1'b0;
    resetn = 1'b0;

    #100;
    resetn = 1'b1;
  end

  initial begin
    #100;
    forever begin
      #50 resetn = ~resetn;
    end
  end

  initial begin 
  $dumpfile("dump.vcd");
  $dumpvars;
  end
  
  initial begin
    $monitor("Time = %0t : resetn = %0d", $time, resetn);
  end

  initial begin
    #400;
    $finish;
  end

endmodule