"Assume you have four variables ( a, b,c, and d )  in 
your testbench top. a and b are of the 8-bit reg type, 
while c and d are of the integer type. initialize a,b,c, 
and d to values of 12, 34, 67, and 255 respectively. 
Add a code to print the values of all the variables after 12 nSec"  


`timescale 1ns/1ps

module top();
  reg [7:0] a = 12;
  reg [7:0] b = 34;
  integer c = 67;
  integer d = 255;
  
  initial begin
    #12;
    $display ("a : %0d, b : %0d, c : %0d, d : %0d", a, b, c, d);
  end
  
endmodule