`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/21 17:21:49
// Design Name: 
// Module Name: sim_for_Project_II
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


module sim_for_Project_II(

    );
    reg clk;
    reg rst;
    wire MemtoReg, MemWrite, ALUSrc, RegDst, RegWrite, Branch, Jump; 
    wire [2:0]ALUControl;
    wire [6:0]seg;
    wire [7:0]ans;
    wire [31:0] test_instruction;
    wire [5:0] test_op;
    wire [5:0] test_funct;
    wire [1:0] test_aluop;
    initial begin
       clk=1'b0;
       rst=1'b0;
    end
    top top(clk, rst, MemtoReg, MemWrite, ALUSrc, RegDst, RegWrite, 
        Branch, Jump, ALUControl, seg, ans,test_instruction,test_op,test_funct,test_aluop);
    always #5 clk=~clk;
endmodule
