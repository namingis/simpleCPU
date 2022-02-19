`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/23 10:01:37
// Design Name: 
// Module Name: mips
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


module mips(
	input wire clk,rst,
	input wire[31:0] instr,
	input wire[31:0] ram_read_data,
	output wire MemWrite,
	output wire[31:0] instr_address,
	output wire[31:0] ALUOut,WriteData,
	output test_memtoreg,test_alusrc,test_regdst,test_regwrite,test_jump,test_pcsrc,test_zero,
	output [2:0]test_alucontrol,
	output [31:0]test_jump_address,
	output [31:0]test_plus_4_address,
    output [31:0]test_branch_address,
    output [31:0]test_shifted_address,
    output [31:0]test_immea,
    output [31:0]test_reg_out_1
	);
	wire MemtoReg,ALUSrc,RegDst,RegWrite,Jump,PCSrc,zero;
	assign test_memtoreg=MemtoReg;
	assign test_alusrc=ALUSrc;
	assign test_regdst=RegDst;
	assign test_regwrite=RegWrite;
	assign test_jump=Jump;
	assign test_pcsrc=PCSrc;
	assign test_zero=zero;
	assign test_alucontrol=ALUControl;
	
	wire[2:0] ALUControl;

	controller c(instr[31:26],
	             instr[5:0],
                 zero,
                 MemtoReg,
                 MemWrite,
                 ALUSrc,
                 RegDst,
                 RegWrite,
                 PCSrc,
                 Jump,
                 ALUControl
                 );
	datapath dp(clk,
                rst,
                instr,
                ram_read_data,
                MemtoReg,
                MemWrite,
                ALUSrc,
                RegDst,
                RegWrite,
                PCSrc,
                Jump,
                ALUControl,
                ALUOut,
                WriteData,
                instr_address,
                zero,
                test_jump_address,
                test_plus_4_address,
                test_branch_address,
                test_shifted_address,
                test_immea,
                test_reg_out_1
                );
endmodule
