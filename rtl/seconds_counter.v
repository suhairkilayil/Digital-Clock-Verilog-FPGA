`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2026 05:29:40 PM
// Design Name: 
// Module Name: seconds_counter
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


module seconds_counter(
input clk,
input reset,
input set_time,
input [5:0] set_sec,
output reg[5:0] sec

    );
always@( posedge clk or posedge reset) begin 
  if (reset ) begin 
   sec <= 6'd0;
  end
  else if (set_time) begin
    sec <= (set_sec <= 6'd59) ? set_sec : 6'd0;
   end
  else if( sec == 6'd59) begin 
    sec <= 6'b0;
    
  end
  
  else begin 
    sec <= sec + 1'b1;
  end
  
end
endmodule
