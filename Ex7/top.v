//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module lights_selector(
input clk,
input sel,
input rst,
input button,
output [23:0] light
);

wire [23:0] rgb;
wire [2:0] colour;
wire [23:0] white;
wire enable;

assign white = 24'hFFFFFF;
assign enable = ~rst;

//instantiate modules

mux mymux(
.rgb(rgb),
.white(white),
.sel(sel),
.light(light)
);

RGB myrgb(
.clk(clk),
.colour(colour),
.enable(enable),
.rgb(rgb)
);

LED myled(
.clk(clk),
.rst(rst),
.button(button),
.colour(colour)
);

endmodule
