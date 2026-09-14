Write a task that applies inputs and then calls another task.

module tb;
  
  int a;
  int b;
  
  task display_values();
    $display("Value of a and b : %0d and %0d", a,b);
  endtask
  
  task insert_values();
    a = $urandom;
    b = $urandom;
    #10;
    display_values();
  endtask
  
  initial begin
    insert_values();
  end
endmodule