`timescale 1ns / 1ps

module Data_PATH(
      input clk,
      input reset,
      input load0,
      input load1,
      input clear,
      input [15:0] Duty,
      output reg PWM_OUT
    );
    
reg [15:0] CNT = 16'd65535;
reg [15:0] COMP0;
reg [15:0] COMP1;
    
always@(posedge clk)
begin
    if (reset == 1'b1 || load0 == 1'b0 || load1 == 1'b0)
     begin 
        CNT <= 16'd65535;
      end
      else
      begin 
      CNT <= CNT - 1;
      end
end 

always@(posedge clk)
begin 
      if (load0 == 1'b1)
         begin 
           COMP0 <= CNT;
       end
     if (load1 == 1'b1)
         begin 
           COMP1 <= Duty;
        end
        
      if (clear == 1'b0)
         begin 
         if(COMP0 > COMP1) 
           begin 
                PWM_OUT <= 1'b1;
            end
         else 
            begin 
                PWM_OUT <= 1'b0;
            end 
         end
         else 
           begin 
             PWM_OUT <= 1'b0;
            end 
         end
endmodule

