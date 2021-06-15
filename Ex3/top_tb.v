//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
    parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
    reg clk;
    reg rst;
    reg on_off;
    reg err;
    reg [7:0] counter_1;
    wire [7:0] counter_out;

//Todo: Clock generation
intial 
   begin 
      clk = 1'b0;
      forever
        #(CLK_PERIOD/2) clk=~clk;
    end

//Todo: User logic
    initial begin
          rst=1;
          change=0;
          err=0;
          on_off=1;
          counter_1=0;
       #(CLK_PERIOD*10);
if (counter_out != 0)
begin
$display("***Test failed!");
err=1;
end 
rst=0;

#(CLK_PERIOD*10);
if (counter_out != 0)
begin
$display("***Test failed!");
err=1;
end
change=1;
     forever begin
      #(CLK_PERIOD);
counter_1 = on_off ? counter_1 + 1: counter_1 -1;
if (counter_1 != counter_out)
begin
$display("***Test failed!");
err=1;
end

  if (counter_1 == 10)
on_off=~on_off;
  end
end
//Todo: Finish test, check for success
initial begin
    #50;
     if (err==0)
        $display("***Test Passed!");
     $finish;
    end



//Todo: Instantiate counter module
monitor top(
.rst (rst),
.clk (clk),
.change (change),
.counter_out (counter_out),
.on_off (on_off)
);
 
endmodule 
