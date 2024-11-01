`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2024 03:20:36 PM
// Design Name: 
// Module Name: PWM_TOP
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


module PWM_TOP(
               input clk,
               input reset,
               input start,
               input stop, 
               input [15:0] Duty,
               output PWM_OUT 
     );
 
wire load0_0, load1_1, clear0_0;
wire PWM;

//instantiation the Control UNIT;
Contro_Unit CNTU ( start,
                     stop,
                     load0_0,
                     load1_1,
                     clear0_0
                     );

///// instantiatting the Data PATH
Data_PATH DP ( clk,
              reset,
              load0_0,
              load1_1,
              clear0_0,
              Duty,
              PWM);
              
              
assign PWM_OUT = PWM;
 
endmodule

