Write a task get_high_low_times that calculates the high time and low time for a square waveform given:
Period (in nSec): Total time for one cycle of the waveform.
Duty Cycle (0 to 1): The proportion of time the signal remains high in one cycle.
The task should return two values:
The high time of the signal.
The low time of the signal.
You are required to:
Use these high and low times to generate a clock signal.
Assume Period = 50 and Duty Cycle = 0.6 for computation of magic number.
Use variables mentioned in edaplayground project to build your logic. 
Don't modify variable name else code will break.

`timescale 1ns / 1ps

module tb();
  
  reg clk = 0;
  
  real period;
  real duty_cycle;
  real high_time;
  real low_time;
  
  task get_high_low_times( input real period, input real duty_cycle, output real high_time, output real low_time );
    
    high_time = period * duty_cycle;
    low_time = period - high_time;
    
  endtask
  
  initial begin
    period = 50;
    duty_cycle = 0.6;
    
    get_high_low_times(period, duty_cycle, high_time, low_time);
    
    while(1) begin
      clk = 1;
      #high_time;
      
      clk = 0;
      #low_time;
    end
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end
  
  initial begin
    #200;
    $finish();
  end
  
endmodule
  