`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 00:33:26
// Design Name: 
// Module Name: moore_fsm_tb
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


module moore_fsm_tb;

    reg clk;
    reg reset;
    wire [1:0] state;

    // Instantiate the DUT
    moore_fsm uut (
        .clk(clk),
        .reset(reset),
        .state(state)
    );

    // Clock Generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        reset = 1;     // Apply reset
        #12;
        reset = 0;     // Release reset

        #60;           // Run simulation

        $finish;
    end

    // Monitor values
    initial begin
        $monitor("Time=%0t | Reset=%b | State=%b",
                 $time, reset, state);
    end

endmodule
