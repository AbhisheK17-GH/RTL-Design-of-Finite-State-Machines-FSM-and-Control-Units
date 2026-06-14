`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 00:44:09
// Design Name: 
// Module Name: sequence_detector
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


module sequence_detector(
    input clk,
    input reset,
    input in,
    output reg detected
);

reg [2:0] state;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= 0;
        detected <= 0;
    end
    else
    begin
        detected <= 0;   // default

        case(state)

            0: state <= (in) ? 1 : 0;

            1: state <= (in) ? 1 : 2;

            2: state <= (in) ? 3 : 0;

            3:
            begin
                if(in)
                begin
                    detected <= 1;
                    state <= 1;   // overlap
                end
                else
                    state <= 2;
            end

            default:
            begin
                state <= 0;
                detected <= 0;
            end

        endcase
    end
end

endmodule