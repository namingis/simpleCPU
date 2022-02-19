`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/07 10:58:03
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
	output wire[31:0] pcF,
	input wire[31:0] instrF,
	output wire memwriteM,
	output wire[31:0] aluoutM,writedataM,
	input wire[31:0] readdataM,
	output equalD,branchD,jumpD,flushE,regwriteE,memtoregE,alusrcE,regdstE,
	output[2:0] alucontrolE
    );
	
	wire [5:0] opD,functD;
	wire pcsrcD,memtoregM,memtoregW,regwriteM,regwriteW;
	
	controller c(
		clk,rst,
		//ID
		opD,functD,pcsrcD,branchD,equalD,jumpD,
		//EX
		flushE,memtoregE,alusrcE,regdstE,regwriteE,alucontrolE,
		//MEM
		memtoregM,memwriteM,regwriteM,
		//WB
		memtoregW,regwriteW);
		
	datapath dp(
		clk,rst,
		//IF
		pcF,instrF,
		//ID
		pcsrcD,branchD,jumpD,equalD,opD,functD,
		//EX
		memtoregE,alusrcE,regdstE,regwriteE,alucontrolE,flushE,
		//MEM
		memtoregM,regwriteM,aluoutM,writedataM,readdataM,
		//WB
		memtoregW,regwriteW);
	
endmodule
