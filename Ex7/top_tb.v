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

parameter CLK__PERIOD=10;

reg clk;
reg sel;
reg button;
reg err;
reg rst;
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
sel=0;
button=0;
err=0;
rst=1;


 

