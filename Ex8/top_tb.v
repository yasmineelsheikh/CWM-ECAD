//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );

// Parameters
parameter CLK_PERIOD = 10;
reg clk_p;
reg err;
reg [4:0] temperature;
reg rst_n;
wire heating;
wire cooling;
wire clk_n;


//clock generation
initial 
   begin 
      clk_p = 1'b0;
      clk_n = 1'b1;
      forever 
        #(CLK_PERIOD/2) clk_p=~clk_p;
      end

assign clk_n=~clk_p;
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
  .clk_n (clk_n),
  .clk_p (clk_p),
  .rst_n (rst_n),
  .temperature_0 (temperature[0]),
  .temperature_1 (temperature[1]),
  .temperature_2 (temperature[2]),
  .temperature_3 (temperature[3]),
  .temperature_4 (temperature[4]),
  .heating (heating), 
  .cooling (cooling)
);
endmodule

