`timescale 1ns / 100ps

module doorbell(
    //Todo: define inputs here
      input a,
      input b,
      input sel,
      output out
    );
    
    //Todo: define registers and wires here
      wire out;


    //Todo: define your logic here    
      assign #5 out = sel? b : a;         
      
endmodule  
