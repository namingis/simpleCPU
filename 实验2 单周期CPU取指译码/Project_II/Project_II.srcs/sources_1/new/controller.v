`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/21 10:32:45
// Design Name: 
// Module Name: controller
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


module controller(
    input [5:0] opcode,
    input [5:0] funct,
    output MemtoReg,
    output MemWrite,
    output ALUSrc,
    output RegDst,
    output RegWrite,
    output Branch,
    output Jump,
    output [2:0]ALUControl
   // ,output [1:0] test_aluop
    );
    wire [31:0] signals;
    wire [1:0]ALUOp;
    maindec u1(opcode,signals);
    assign ALUOp=signals[1:0];
    aludec u2(ALUOp,funct,ALUControl);
    assign MemtoReg=signals[8];
    assign MemWrite=signals[7];
    assign ALUSrc=signals[6];
    assign RegDst=signals[5];
    assign RegWrite=signals[4];
    assign Branch=signals[3];
    assign Jump=signals[2];
    //assign test_aluop=ALUOp;
endmodule
