`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2026 05:16:24 PM
// Design Name: 
// Module Name: digital_clock
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


module digital_clock(
input clk,
//input reset,
output wire[5:0] sec,
output wire[5:0] min,
output wire[4:0] hr

    );
wire clk_div;
wire reset;

clock_divider clkdiv_inst(
.clk(clk),
.reset(reset),
.clk_div(clk_div)

);  

seconds_counter sec_inst(
.clk(clk_div),
.reset(reset),
.sec(sec)

); 

wire min_enable;
assign min_enable = ( sec == 6'd59 );

minutes_counter min_inst(
.clk(clk_div),
.reset(reset),
.enable(min_enable),
.min(min)

);

wire hr_enable;
assign hr_enable = (min ==6'd59) && ( sec == 6'd59 );

hour_counter hr_inst(
.clk(clk_div),
.reset(reset),
.enable(hr_enable),
.hr(hr)

);

ila_0 ila_inst(
	.clk(clk), // input wire clk


	.probe0(sec), // input wire [5:0]  probe0  
	.probe1(min), // input wire [5:0]  probe1 
	.probe2(hr) // input wire [4:0]  probe2
);
 
vio_1 vio1_inst (
  .clk(clk),                // input wire clk
  .probe_out0(reset)  // output wire [0 : 0] probe_out0
);
endmodule
