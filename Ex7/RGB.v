`timescale 1ns / 100ps

module RGB (


input clk,
input [2:0] colour,
input enable,
output[23:0] rgb
);





mybram your_instance_name (
  .clka(clk),    // input wire clka
  .ena(enable),      // input wire ena
  .wea(1'b0),      // input wire [0 : 0] wea
  .addra(colour),  // input wire [2 : 0] addra
  .dina(24'b0),    // input wire [23 : 0] dina
  .douta(rgb)  // output wire [23 : 0] douta
);
endmodule
