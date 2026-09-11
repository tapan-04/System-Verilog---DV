Write code to change a 4-bit signal every 10 ns.

`timescale 1ns/1ps

module tb;
  
  reg [3:0] signal;
  
  initial begin
    signal = 4'b0001;
    
  end
  
  initial begin
    forever begin
      #10;
      signal = ~signal;
    end
  end
  
  initial begin
    #100;
    $finish();
  end
endmodule

