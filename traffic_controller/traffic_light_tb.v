`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 16:14:24
// Design Name: 
// Module Name: traffic_light_tb
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


module traffic_light_tb;

reg clk;
reg reset;
wire [2:0] light;

traffic_light uut (
    .clk(clk),
    .reset(reset),
    .light(light)
);


// Clock Generation
always #5 clk = ~clk;   // 10 ns clock period

initial
begin
    clk = 0;
    reset = 1;

    // Apply reset
    #10;
    reset = 0;

    // Run simulation
    #100;

    $finish;
end

endmodule


