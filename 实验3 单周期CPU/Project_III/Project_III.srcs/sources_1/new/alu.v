`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/22 20:21:52
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] num_1,
    input [31:0] num_2,
    input [2:0] op,
    output reg [31:0] out,
    output reg zero
    );
    always @(*)
    case(op)
        0:begin
            out<=num_1&num_2;
        end
        1:begin
            out<=num_1|num_2;
        end
        2:begin
            out<=num_1+num_2;
        end
        6:begin
            out<=num_1-num_2;
        end
        7:begin
            if(num_1<num_2)
                out<=32'h1;
            else
                out<=32'h0;
        end
        default:
            out<=32'h0;
    endcase
    always @(*)
    begin
        if(out==0)
            zero<=1;
        else
            zero<=0;
    end
endmodule
