"Assume the class consists of three 8-bit data members a, b, and c. Create 
a Custom Constructor that allows the user to update the value of these data 
members while adding a constructor to the class. Test your code by adding the 
value of 2, 4, and 56 to a, b and c respectively."

class first;

  bit [7:0] a;
  bit [7:0] b;
  bit [7:0] c;

  function new(input bit [7:0] a = 8'h00, input bit [7:0] b = 8'h00, input bit [7:0] c = 8'h00);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction

endclass

module tb;

  first f1;

  initial begin
    f1 = new(2, 4, 56);
    $display("a : %0d, b : %0d, c : %0d", f1.a, f1.b, f1.c);
  end

endmodule