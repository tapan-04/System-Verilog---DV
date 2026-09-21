"Create Monitor and Scoreboard Code for Synchronous 4-bit Multiplier. Stimulus 
is generated in Testbench top so do not add Transaction, Generator, or Driver 
Code. Also, add the Scoreboard model to compare the response with an expected 
result.

module tb;
  
  top_if vif();
  
  top dut (vif.clk, vif.a, vif.b, vif.mul);
  
  initial begin
    vif.clk <= 0;
  end
  
  always #5 vif.clk <= ~vif.clk;
  
  initial begin
    for(int i = 0; i<20; i++) begin
      @(posedge vif.clk);
      vif.a <= $urandom_range(1,15);
      vif.b <= $urandom_range(1,15);
    end
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
     $dumpvars;    
    #300;
    $finish();
  end
  
endmodule"

--------------------

module top (
    input  clk,
    input  [3:0] a,
    input  [3:0] b,
    output reg [7:0] mul
);

    always @(posedge clk) begin
        mul <= a * b;
    end

endmodule

class transaction;

    bit [3:0] a;
    bit [3:0] b;
    bit [7:0] mul;

    function void display();
        $display("a : %0d \t b : %0d \t mul : %0d",
                 a, b, mul);
    endfunction

endclass


interface top_if;

    logic clk;
    logic [3:0] a;
    logic [3:0] b;
    logic [7:0] mul;

endinterface


class monitor;

    virtual top_if vif;
    mailbox #(transaction) mbx;
    transaction trans;

    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction

    task run();

        forever begin

            @(posedge vif.clk);

            trans = new();

            trans.a   = vif.a;
            trans.b   = vif.b;
            trans.mul = vif.mul;

            $display("[MON] : DATA SENT TO SCOREBOARD");

            trans.display();

            mbx.put(trans);

        end

    endtask

endclass


class scoreboard;

    mailbox #(transaction) mbx;
    transaction trans;

    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction

    task run();

        forever begin

            mbx.get(trans);

            $display("[SCO] : DATA RECEIVED FROM MONITOR");

            if (trans.mul == (trans.a * trans.b)) begin

                $display("[SCO] : PASS");
                $display("       A        = %0d", trans.a);
                $display("       B        = %0d", trans.b);
                $display("       Expected = %0d", trans.a * trans.b);
                $display("       Actual   = %0d", trans.mul);

            end

            else begin

                $display("[SCO] : FAIL");
                $display("       A        = %0d", trans.a);
                $display("       B        = %0d", trans.b);
                $display("       Expected = %0d", trans.a * trans.b);
                $display("       Actual   = %0d", trans.mul);

            end

            $display("-------------------------------------");

        end

    endtask

endclass


module tb;

    top_if vif();

    top dut (
        vif.clk,
        vif.a,
        vif.b,
        vif.mul
    );

    monitor mon;
    scoreboard sco;

    mailbox #(transaction) mbx;


    // Clock generation
    initial begin
        vif.clk <= 0;
    end

    always #5 vif.clk <= ~vif.clk;


    // Stimulus generation
    initial begin

        for(int i = 0; i < 20; i++) begin

            @(posedge vif.clk);

            vif.a <= $urandom_range(1,15);
            vif.b <= $urandom_range(1,15);

        end

    end


    // Create monitor and scoreboard
    initial begin

        mbx = new();

        mon = new(mbx);
        sco = new(mbx);

        mon.vif = vif;

    end


    // Run monitor and scoreboard
    initial begin

        fork

            mon.run();
            sco.run();

        join

    end


    // Waveform and simulation control
    initial begin

        $dumpfile("dump.vcd");
        $dumpvars;

        #300;

        $finish();

    end

endmodule
