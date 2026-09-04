module tb;

  bit a = 0;

  byte b = 0;       // 2-state
  shortint c = 0;
  int d = 0;
  longint e = 0;

  bit [7:0] f = 8'b00000000;
  bit [15:0] g = 16'h0000;

  real h = 0;

  initial begin

    a = 1'b0;

    b = 10;
    c = 100;
    d = 1000;
    e = 10000;

    f = 8'b10101010;
    g = 16'hABCD;

    h = 10.5;

    $display("a = %0d", a);
    $display("b = %0d", b);
    $display("c = %0d", c);
    $display("d = %0d", d);
    $display("e = %0d", e);
    $display("f = %0b", f);
    $display("g = %0h", g);
    $display("h = %0f", h);

  end

endmodule