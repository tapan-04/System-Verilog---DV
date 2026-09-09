module tb;
  
  bit [1:0] a;
  bit [1:0] b;
  bit [1:0] temp;
  
  task swap_value(input [1:0] a, input [1:0] b);
    bit [1:0] temp;
    
    temp = a;
    a = b;
    b = temp;
    
    $display("Value a : %0d and b : %0d", a,b);
  endtask
  
  task automatic swap_ref(ref bit [1:0] a,ref bit[1:0] b);
    bit [1:0] temp;
    
    temp = a;
    a = b;
    b = temp;
    
    $display("Value a : %0d and b : %0d", a,b);
  endtask
  
  task automatic swap_const_ref(const ref bit [1:0] a, ref bit [1:0] b);
    bit [1:0] temp;

    temp = a;
    b = temp;

    $display("CONST REF: a=%0d b=%0d", a, b);
  endtask


  initial begin

    a = 1;
    b = 2;

    $display("\nBefore swap_value: a=%0d b=%0d", a, b);
    swap_value(a, b);
    $display("After swap_value : a=%0d b=%0d", a, b);

    a = 1;
    b = 2;

    $display("\nBefore swap_ref: a=%0d b=%0d", a, b);
    swap_ref(a, b);
    $display("After swap_ref : a=%0d b=%0d", a, b);

    a = 1;
    b = 2;

    $display("\nBefore swap_const_ref: a=%0d b=%0d", a, b);
    swap_const_ref(a, b);
    $display("After swap_const_ref : a=%0d b=%0d", a, b);

  end

endmodule