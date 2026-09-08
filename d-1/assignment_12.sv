"Create a function that will perform the multiplication of the two unsigned 
integer variables. Compare values return by function with the expected result 
and if both values match send "Test Passed" to Console else send "Test Failed"."

module tb;

  function int unsigned multiply(input int unsigned a, b);
    return a * b;
  endfunction

  int unsigned res;
  int unsigned expected = 2;

  initial begin

    res = multiply(1, 2);

    $display("Result : %0d", res);

    if (res == expected)
      $display("Test Passed");
    else
      $display("Test Failed");

  end

endmodule