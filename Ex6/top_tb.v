//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
 
module top_tb(
   );
//Parameters 
parameter CLK_PERIOD = 10;
reg clk;
reg err;
reg [2:0] colour;
reg enable;
reg [23:0] rgb_1;
wire [23:0] rgb;

//Clock generation
initial 
   begin
      clk = 1'b0;
      forever
         #(CLK_PERIOD/2) clk=~clk;
      end
 

//Logic
initial 
begin
err = 0;
colour = 3'b000;
enable = 0;

#CLK_PERIOD
if (rgb != 24'b0) begin
  $display("***Test failed!");
  err=1;
end

forever begin 
enable=1;
rgb_1 = rgb;
colour <= (colour + 3'd1);

#(10*CLK_PERIOD)
if (rgb_1 == rgb) begin
   $display("***Test failed!");
   err=1;
end
end

end 
//finish test, check for success
initial begin
  #500
     if (err == 0) begin
     $display("***Test passed!");
   $finish;
  end
end

//instantiate module
RGB top (
  .clk (clk),
  .colour (colour),
  .enable (enable),
  .rgb (rgb)
);
endmodule 

    
