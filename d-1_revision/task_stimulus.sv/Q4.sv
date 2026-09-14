Write a testbench that repeatedly calls a stimulus task.

module tb;
  int a;
  int b;
  
  task stimu();
    a = $urandom;
    b = $urandom;
    #10;
    $display("Value of a and b : %0d %0d", a, b);
  endtask
  
  initial begin
    #100;
    $finish();
  end
  
  initial begin
    forever begin
      stimu();
    end
  end
endmodule