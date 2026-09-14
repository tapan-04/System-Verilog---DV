Write a task to add two 4-bit numbers.

module tb;
  
  bit [3:0] a;
  bit [3:0] b;
  bit [3:0] y;
  
  task add();
    y = a + b;
    $display("Value of a + b : %0d", y);
  endtask
  
  initial begin
    a = 1;
    b = 2;
    add();
    #10;
    a = 3;
    b = 2;
    add();
    #10;
  end
endmodule