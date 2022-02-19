`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/21 15:46:54
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    output MemtoReg, MemWrite, ALUSrc, RegDst, RegWrite, Branch, Jump, 
    output wire [2:0]ALUControl,
    output wire [6:0]seg,
    output wire [7:0]ans
    /*,output wire [31:0]test_instruction,
    output wire [5:0]test_op,
    output wire [5:0]test_funct,
    output wire [1:0]test_aluop*/
    );
    reg [31:0]count=0;
    reg clk0=0;
    always @(posedge clk)
    begin
        if(count==32'd50000000)
        begin
            count<=0;
            clk0<=~clk0;
        end
        else
            count<=count+1;
    end
    wire [31:0] address;
    wire [31:0] next_address;
    pc_adder pc_adder(address,next_address);
    wire ena;
    pc pc(next_address,clk0,rst,address,ena);
    wire [31:0]instruction;
    instruction_rom instruction_rom(
        .clka(clk),
        .ena(ena),
        .addra(address),
        .douta(instruction)
    );
    controller controller(instruction[31:26],instruction[5:0], 
        MemtoReg, MemWrite, ALUSrc, RegDst, RegWrite, Branch, Jump,ALUControl/*,test_aluop*/); 
    display display(clk,rst,instruction,seg,ans);
    //assign test_instruction=instruction;
    //assign test_op=instruction[31:26];
    //assign test_funct=instruction[5:0];
    
endmodule
