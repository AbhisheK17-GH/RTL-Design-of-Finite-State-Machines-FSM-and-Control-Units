`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 16:10:52
// Design Name: 
// Module Name: traffic_light
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


module traffic_light(
    input clk,
    input reset,
    output reg [2:0] light
);

parameter RED    = 3'b100,
          YELLOW = 3'b010,
          GREEN  = 3'b001;

reg [1:0] state;

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        state <= 2'd0;
        light <= RED;
    end
    else
    begin
        case(state)
            2'd0:
            begin
                state <= 2'd1;
                light <= GREEN;
            end
 
            2'd1:
            begin
                state <= 2'd2;
                light <= YELLOW;
            end

            2'd2:
            begin
                state <= 2'd0;
                light <= RED;
            end

            default:
            begin
                state <= 2'd0;
                light <= RED;
            end
        endcase
    end
end

endmodule

