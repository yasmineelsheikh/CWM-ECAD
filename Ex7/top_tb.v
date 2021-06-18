//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
 
module top__tb(
);

parameter CLK_PERIOD=10;

reg clk;
reg sel;
reg button;
reg err;
reg rst;
reg [23:0] light_1;
wire [23:0] light;

//clock generation
initial 
   begin
      clk = 1'b0;
      forever
         #(CLK_PERIOD/2) clk=~clk;
      end

//logic
initial 
begin
sel=0;         //check for white light
button=0;
err=0;
rst=1;  
 
 #(10*CLK_PERIOD)
 if(light != 24'hFFFFFF) begin
  $display("***Test Failed!");
  err=1;
 end

rst=0;        
button=0;         //button test

#(10*CLK_PERIOD);
 if (light != light_1) begin
  $display("***Test Failed!");
  err=1;
 end

forever begin
  sel=1;
  button=1;
 #(10*CLK_PERIOD);
if (light==light_1) begin
   $display("***Test failed!");
   err=1;
  end
end
end

//finish test and check for success
initial 
begin
#500
if (err==0)
  $display("***Test passed!");
 $finish;
end

//instantiate module
lights_selector top(
.clk (clk),
.rst (rst),
.sel (sel),
.button (button),
.light (light)
);

endmodule





