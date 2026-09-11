Write a $display statement to print a signal's value and simulation time.

module tb;
  
  int a = 11;
  
  initial begin
    $display("Value of a : %0d", a);
  end
endmodule