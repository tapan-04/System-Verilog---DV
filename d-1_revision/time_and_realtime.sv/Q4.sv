Write a testbench that measures the delay between two events using $time.

`timescale 1ns/1ps

module tb;
  
  time start_time;
  time end_time;
  time delay;
  
  initial begin
    #10;
    start_time = $time;
    $display("Value at Start : %0t", start_time);
  
    #35;
    end_time = $time;
    $display("Value at End : %0t", end_time);
  
    delay = end_time - start_time;
  
    $display("Delay between two events : %0t", delay);
    
  end
endmodule