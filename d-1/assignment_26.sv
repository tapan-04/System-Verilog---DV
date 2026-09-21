"Create Transaction, Generator and Driver code for Synchronus 4-bit Multiplier.

module top
(
  input clk,
  input [3:0] a,b,
  output reg [7:0] mul
);
  
  always@(posedge clk)
    begin
     mul <= a * b;
    end
  
endmodule"

----------------

module top (
  input clk,
  input [3:0] a,
  input [3:0] b,
  output reg [7:0] mul
);

  always @(posedge clk) begin
    mul <= a * b;
  end

endmodule

class transaction;

  rand bit [3:0] a;
  rand bit [3:0] b;
  bit [7:0] mul;

  function void display();
    $display("a : %0d \t b : %0d \t mul : %0d", a, b, mul);
  endfunction

  function transaction copy();
    copy = new();

    copy.a   = this.a;
    copy.b   = this.b;
    copy.mul = this.mul;
  endfunction

endclass


class generator;

  transaction trans;
  mailbox #(transaction) mbx;

  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
    trans = new();
  endfunction

  task run();

    for (int i = 0; i < 10; i++) begin

      assert(trans.randomize())
        else $display("Randomization Failed");

      $display("[GEN] : DATA SENT TO DRIVER");
      trans.display();

      mbx.put(trans.copy());

      #10;

    end

  endtask

endclass


interface mul_if;

  logic clk;
  logic [3:0] a;
  logic [3:0] b;
  logic [7:0] mul;

endinterface


class driver;

  virtual mul_if vif;
  mailbox #(transaction) mbx;
  transaction data;

  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction

  task run();

    forever begin

      mbx.get(data);

      @(posedge vif.clk);

      vif.a <= data.a;
      vif.b <= data.b;

      $display("[DRV] : DATA DRIVEN");
      data.display();

    end

  endtask

endclass


module tb;

  mul_if mif();

  generator gen;
  driver drv;

  mailbox #(transaction) mbx;


  // DUT

  top dut (
    .clk(mif.clk),
    .a(mif.a),
    .b(mif.b),
    .mul(mif.mul)
  );


  // Clock

  initial begin
    mif.clk = 0;
  end

  always #5 mif.clk = ~mif.clk;


  // Create objects

  initial begin

    mbx = new();

    gen = new(mbx);
    drv = new(mbx);

    drv.vif = mif;

  end


  // Run generator and driver

  initial begin

    fork
      gen.run();
      drv.run();
    join_none

    #120;

    $finish();

  end


  // Waveform

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule