`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 00:37:19
// Design Name: 
// Module Name: mealy_fsm_tb
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


`timescale 1ns / 1ps

module mealy_fsm_tb;

    reg clk;
    reg reset;
    reg in;
    wire out;

    // Instantiate DUT
    mealy_fsm uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    // Clock generation (10 ns period)
    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial
    begin
        reset = 1;
        in = 0;

        #12 reset = 0;

        // Input sequence
        #10 in = 1;
        #10 in = 1;   // out should become 1

        #10 in = 0;

        #10 in = 1;
        #10 in = 1;   // out should become 1

        #10 in = 1;   // out remains 1

        #10 in = 0;

        #20 $finish;
    end

    // Monitor
    initial
    begin
        $monitor("Time=%0t Reset=%b In=%b State=%b Out=%b",
                  $time, reset, in, uut.state, out);
    end

endmodule
