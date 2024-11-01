`timescale 1ns / 1ps

module PWM_TOP_tb;

// Testbench signals
reg clk;
reg reset;
reg start;
reg stop;
reg [15:0] Duty;
wire PWM_OUT;

// Instantiate the PWM_TOP module
PWM_TOP uut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .stop(stop),
    .Duty(Duty),
    .PWM_OUT(PWM_OUT)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns clock period (100 MHz)
end

// Test sequence for 50% duty cycle
initial begin
    // Initialize all inputs
    reset = 1;
    start = 0;
    stop = 0;

    // Apply reset
    #10 reset = 0;
        start = 1;
        //Duty = 16'd49151;  // foe 25% duty cycle
       // Duty = 16'd32768;  // 50% duty cycle
       Duty = 16'd16384;   // 75% duty cycle
    // Stop PWM generation after some time
    #1000 stop = 0;
    #20 stop = 0;      // Release stop signal

    // End simulation
   // #100 $finish;
end

// Monitor signals for debugging
initial begin
    $monitor("Time=%0dns, clk=%b, reset=%b, start=%b, stop=%b, Duty=%d, PWM_OUT=%b",
             $time, clk, reset, start, stop, Duty, PWM_OUT);
end

endmodule
