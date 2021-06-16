//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );

// Parameters
parameter CLK_PERIOD = 10;
reg clk;
reg err;
reg [4:0] temperature;
wire heating;
wire cooling;

//clock generation
initial 
   begin 
      clk = 1'b0;
      forever 
        #(CLK_PERIOD/2) clk=~clk;
      end

//user logic
initial begin
   err=0;
   temperature = 5'd16;

   forever begin
   #(CLK_PERIOD)
   if((temperature<=5'd18)&(!heating)&(cooling)) begin
       err=1;
      $display("***Test failed");
   end 
   if ((temperature>=5'd22)&(heating)&(!cooling)) begin
   err=1;
   $display("***Test failed");
   end
   if ((heating)&(cooling)) begin
   err=1;
   $display("***Test failed");
   end
  
   temperature <= temperature + 5'd1;
  end
end
//finish test, check for success
initial begin
   #500;
   if (err==0)
       $display("***Test Passed!");
     $finish;
   end

//Instantiate counter module
AC top (
  .temperature (temperature),
  .clk (clk),
  .heating (heating), 
  .cooling (cooling)
);
endmodule

