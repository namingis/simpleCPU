`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/21 10:10:50
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
    output reg [31:0] address=32'h0,
    output ena
    
    );
    always @(posedge clk)
    begin
        if(!rst)
            address<=next_address;
        else
            address<=0;
    end
    assign ena=1'b1;
endmodule
