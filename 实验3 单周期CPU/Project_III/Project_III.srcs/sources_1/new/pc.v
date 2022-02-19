`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/22 20:25:01
// Design Name: 
// Module Name: pc
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


module pc(
    input [31:0] next_address,
    input clk,
    input rst,
    output reg [31:0] address=32'h0
    );
    always @(posedge clk)
    begin
        if(!rst)
            address<=next_address;
        else
            address<=0;
    end
endmodule
