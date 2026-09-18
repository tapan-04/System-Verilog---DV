"Take the help of pseudo-random number generator to generate values for wr and 
rst signal. rst should be low for apprx. 30% of time whie wr should be high for 
apprx. 50% of time. Verify your code for 20 iterations by sending values of both 
wr and rst on a console. Generator code is mentioned in the Instruction tab.

class generator;
  
  rand bit rst;
  rand bit wr;
  
  /////////////////add constraint 
  
  
  
  
  
endclass
 
/////////////////Add testbench top code"

class generator;

  rand bit rst;
  rand bit wr;

  constraint rst_c {
    rst dist {0 := 30, 1 := 70};
  }

  constraint wr_c {
    wr dist {0 := 50, 1 := 50};
  }

endclass

module tb;

  generator g;

  initial begin

    g = new();
    for (int i = 0; i < 20; i++) begin
      assert(g.randomize());
      $display("Iteration : %0d | rst : %0d | wr : %0d", i, g.rst, g.wr);
    end
  end
endmodule