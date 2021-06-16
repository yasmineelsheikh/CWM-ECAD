//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
 
module AC (

//ports
input clk,
input [4:0] temperature,
output heating,
output cooling);


//registers & wires
reg heating;
reg cooling;


//user logic
always @(posedge clk) begin
   case({heating,cooling})
      2'b00: begin
         if (temperature >= 22)
             cooling = 1;
         if (temperature <= 18)
              heating = 1;
         end
       2'b01: begin
          if (temperature <= 20)
              cooling = 0;
           end 
       2'b10: begin
          if (temperature >= 20)
              heating = 0;
          end 
          default: begin
              heating = 0;
              cooling = 0;
          end
       endcase
    end
endmodule 
          

