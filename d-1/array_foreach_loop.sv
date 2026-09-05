module tb();
  
  int arr[10];
  
  initial begin 
    foreach(arr[j]) begin
      arr[j] = j;
      $display ("%0d", arr[j]);
    end
  end
endmodule