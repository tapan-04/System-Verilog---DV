Write a task that applies different values to a and b with a 10 ns delay between each.

module tb;
  int a;
  int b;
  
  task diff();
    a = $urandom;
    b = $urandom;
    #10;
    $display("Value of a and b : %0d %0d", a, b);
  endtask
  
  initial begin
    for(int i = 0; i < 6; i++) begin
      diff();
    end
  end
endmodule