`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 00:44:42
// Design Name: 
// Module Name: sequence_detector_tb
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

module sequence_detector_tb;

    reg clk;
    reg reset;
    reg in;
    wire detected;

    sequence_detector uut(
        .clk(clk),
        .reset(reset),
        .in(in),
        .detected(detected)
    );

    // Clock generation
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

        // Pattern: 1011
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;   // detected should pulse

        // Another pattern
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;   // detected should pulse

        #20 $finish;
    end

    initial
    begin
        $monitor("Time=%0t Reset=%b In=%b State=%d Detected=%b",
                 $time, reset, in, uut.state, detected);
    end

endmodule
