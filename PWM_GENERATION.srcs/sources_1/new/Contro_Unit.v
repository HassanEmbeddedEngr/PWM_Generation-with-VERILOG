`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2024 03:21:17 PM
// Design Name: 
// Module Name: Contro_Unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Contro_Unit(
     input start,
     input stop,
     output reg load0,
     output reg load1,
     output reg clear
    );
    
always@(*)
   begin 
   if (start == 1'b1 && stop == 1'b0)
   begin 
        load0 <= 1'b1;
        load1 <= 1'b1;
        clear <= 1'b0;
    end 
    else if (stop == 1'b1)
    begin 
            load0 <= 1'b0;
            load1 <= 1'b0;
            clear <= 1'b1;
    end 
    end
endmodule
