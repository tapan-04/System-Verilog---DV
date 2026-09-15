class first;

  int data = 12;

  function void display();
    $display("value of data : %0d", data);
  endfunction

endclass


class second extends first;

  int temp = 34;

  function void add();
    $display("value after process : %0d", temp+4);
  endfunction

endclass


module tb;

  second s;

  initial begin
    s = new();

    $display("value of data : %0d", s.data);
    s.display();

    $display("value of temp : %0d", s.temp);
    s.add();

  end

endmodule