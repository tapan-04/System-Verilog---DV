Write code to store simulation time in a time variable and realtime variable.

`timescale 1ns/1ps

module tb;
  
  time a;
  realtime b;
  
  initial begin
    #11;
    a = $time();
    $display("Value of a : %0t", a);
    #11.67;  //floating value
    b = $realtime();
    $display("Value of b : %0t", b);
    
  end
endmodule