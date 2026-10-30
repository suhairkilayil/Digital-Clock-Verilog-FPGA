`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2026 05:36:39 PM
// Design Name: 
// Module Name: minutes_counter
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


module minutes_counter(
input clk,
input reset,
input enable,
input set_time,
input [5:0] set_min,
output reg[5:0] min

    );
    
always @ ( posedge clk or posedge reset ) begin 
   if (reset) begin
     min <= 6'd0;
   end
  else if (set_time) begin
        min <= (set_min <= 6'd59) ? set_min : 6'd0;
  end   
  else if (enable) begin
    if ( min == 6'd59 ) begin 
     min <= 6'd0;
   end
    else begin 
      min <= min + 1'b1;   
    end
    
   end
end   
endmodule
