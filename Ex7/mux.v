`timescale 1ns / 100ps

module mux(
    //Todo: define inputs here
      input [23:0] rgb,
      input [23:0] white,
      input sel,
      output [23:0] light
    );
    
    //Todo: define registers and wires here
      wire [23:0] light;


    //Todo: define your logic here    
      assign light = sel? rgb : white;         
      
endmodule  
