"For the Generator code mentioned in the Instruction tab, expected values for 
variable a ranges from 0 to 8, variable b ranges from 0 to 5. Also, add logic 
to store the number of times randomization failed. Print values of variables 
during each iteration and error count after generating 20 random values for a 
and b. Add Constraint Code and Testbench top code to  the Design.

class generator;
  
  rand bit [4:0] a;
  rand bit [5:0] b;
  
 
  
endclass
 
 
//////////////////Add constraint and TB top code"

class generator;
  
  rand bit [4:0] a;
  rand bit [5:0] b;
  
  constraint data {
    a inside {[0:8]};
    b inside {[0:5]};
  }
  
endclass

module tb;
  
  generator g;
  int error_count = 0;
  
  initial begin
    
    g = new();
    
    for( int i=0; i<20; i++) begin
      if(g.randomize()) begin
        $display("Iteration : %0d | a : %0d, b | %0d", i, g.a, g.b);
      end
      else begin
        error_count++;
        $display("Iteration : %0d | Randomization Failed", i);
      end
    end
  end
endmodule