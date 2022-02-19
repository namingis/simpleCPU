`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 15:21:30
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
	input wire clk,rst,
	//ID
	input wire[5:0] opD,functD,
	output wire pcsrcD,branchD,zeroD,jumpD,
	
	//EX
	input wire flushE,
	output wire memtoregE,alusrcE,
	output wire regdstE,regwriteE,	
	output wire[2:0] alucontrolE,

	//MEM
	output wire memtoregM,memwriteM,
				regwriteM,
	//WB
	output wire memtoregW,regwriteW

    );
	
	//ID
	wire[1:0] aluopD;
	wire memtoregD,memwriteD,alusrcD,
		regdstD,regwriteD;
	wire[2:0] alucontrolD;

	//EX
	wire memwriteE;

//控制信号
	maindec md(opD,memtoregD,memwriteD,branchD,alusrcD,regdstD,regwriteD,jumpD,aluopD);
	aludec ad(functD,aluopD,alucontrolD);
	assign pcsrcD = branchD & zeroD;

//流水线寄存器，将控制信号传递给下个周期的寄存器
    //ID/EX寄存器
	floprc #(8) regE(
		clk,rst,flushE,
		{memtoregD,memwriteD,alusrcD,regdstD,regwriteD,alucontrolD},
		{memtoregE,memwriteE,alusrcE,regdstE,regwriteE,alucontrolE}
		);
	//EX/MEM寄存器
	flopr #(8) regM(
		clk,rst,
		{memtoregE,memwriteE,regwriteE},
		{memtoregM,memwriteM,regwriteM}
		);
	//MEM/WB寄存器
	flopr #(8) regW(
		clk,rst,
		{memtoregM,regwriteM},
		{memtoregW,regwriteW}
		);
endmodule
