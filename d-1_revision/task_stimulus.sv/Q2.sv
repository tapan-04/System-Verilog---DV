Write a task to subtract two numbers.

module tb;
  
  int a;
  int b;
  int y;
  
  task sub();
    y = b - a;
    $display("Value : %0d", y);
  endtask
  
  initial begin
    a = 3;
    b = 10;
    sub();
    #10;
  end
endmodule