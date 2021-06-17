`timescale 1ns / 100ps

module LED (
//Ports
input clk,
input rst,
input button,
output reg [2:0] colour
);

//registers and wires
always @ (posedge clk)

//user logic
begin

if (rst == 1)
   colour = 3'b0;

else begin
    if (button == 0)
    colour <= ((colour == 3'b000) || (colour == 3'b111)) ? 3'b001: colour;
    else
    colour <= (colour < 3'b110)? colour + 3'b001: 3'b001;

    end 

  end
endmodule 
