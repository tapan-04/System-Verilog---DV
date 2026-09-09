"Create a function that generate and return 32 values of multiple of 
8 (0, 8, 16, 24, 32, 40 .... 248). Store this value in the local array of 
the testbench top and also print the value of each element of this array 
on the console."

module tb;
  
  bit[7:0] store[32];
  
  function automatic void init_arr(ref bit[7:0] a[32]);
    for (int i = 0; i < 32; i++) begin
      a[i] = 8 * i;
    end
   
  endfunction
  
  initial begin
    init_arr(store);
    for (int i = 0; i < 32; i++) begin
      $display("Value[%0d] : %0d", i, store[i]);
    end
  end
endmodule