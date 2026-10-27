`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2026 05:19:11 PM
// Design Name: 
// Module Name: clock_divider
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



module clock_divider(
    input clk,
    input reset,
    output reg clk_div
);

    reg [26:0] divider;
    

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            divider <= 27'd0;
            clk_div <= 1'b0;
        end
        else if (divider == 27'd49_999_999) begin
            divider <= 27'd0;
            clk_div<= ~clk_div;
        end
        else begin
            divider <= divider + 1'b1;
        end
    end

endmodule
