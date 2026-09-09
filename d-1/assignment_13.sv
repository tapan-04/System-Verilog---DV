"Create a task that will generate stimulus for addr , wr, and en signal as 
mentioned in a waveform of the Instruction tab. Assume address is 6-bit wide 
while en and wr both are 1-bit wide. The stimulus should be sent on a positive 
edge of 25 MHz clock signal."

module tb;
  
  bit [5:0] addr;
  bit wr;
  bit en;
  
  bit clk = 0;
  
  always #20 clk = ~clk;
  
  task generate_stimulus();
    @(posedge clk);
    en =1;
    wr =1;
    addr = 6'd12;
    
    @(posedge clk);
    addr = 6'd14;
    
    @(posedge clk);
    wr =0;
    addr = 6'd23;
    
    @(posedge clk);
    wr =0;
    addr = 6'd48;
    
    @(posedge clk);
    en =0;
    wr =0;
    addr = 6'd56;
    
  endtask
  
  initial begin
    
    generate_stimulus();
    #10;
    $finish();
  end
  
  initial begin 
  $dumpfile("dump.vcd");
  $dumpvars;
  end  
  
endmodule