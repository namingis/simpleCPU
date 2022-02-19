`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/21 10:40:48
// Design Name: 
// Module Name: maindec
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


module maindec(
    input [5:0]opcode,
    output wire [8:0]sigs
    );
    reg [8:0] signals;
    always @(*) 
    begin
        case(opcode)
            6'b000000:
            begin
                signals<=9'b000110010;
            end
            6'b100011:
            begin
                signals<=9'b101010000;
            end            
            6'b101011:
            begin
                signals<=9'b011000000; //x11x00000
            end            
            6'b000100:
            begin
                signals<=9'b000001001; //x00x01001
            end            
            6'b001000:
            begin
                signals<=9'b001010000;
            end            
            6'b000010:
            begin
                signals<=9'b000000100; //x0xx0x1xx
            end
            default:
                signals<=9'h0;
        endcase   
    end
    assign sigs=signals;
endmodule
