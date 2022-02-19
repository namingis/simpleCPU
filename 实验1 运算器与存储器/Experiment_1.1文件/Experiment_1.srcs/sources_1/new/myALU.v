`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/24 20:53:19
// Design Name: 
// Module Name: myALU
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

module myALU(clk,reset,B,control,seg,ans);
parameter WIDTH=32;
input clk;
input [7:0]B;
input [2:0]control;
input reset;
output wire[6:0]seg;
output wire[7:0]ans; 

wire [WIDTH - 1:0]C;
wire [WIDTH - 1:0]A;
wire [WIDTH - 1:0]B_extended;

assign A=32'h01;
assign B_extended={24'h000000,B[7:0]};
assign C=(control==3'b000)?(A + B_extended):
         (control==3'b001)?(A - B_extended):
         (control==3'b010)?(A & B_extended):
         (control==3'b011)?(A | B_extended):
         (control==3'b100)?(~A):
         (control==3'b101)?(A<B?32'b1:32'b0):32'h00000000;
         
display t1(clk,reset,C,seg,ans);

endmodule
