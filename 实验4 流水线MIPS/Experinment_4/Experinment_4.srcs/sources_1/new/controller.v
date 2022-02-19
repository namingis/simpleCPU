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

//�����ź�
	maindec md(opD,memtoregD,memwriteD,branchD,alusrcD,regdstD,regwriteD,jumpD,aluopD);
	aludec ad(functD,aluopD,alucontrolD);
	assign pcsrcD = branchD & zeroD;

//��ˮ�߼Ĵ������������źŴ��ݸ��¸����ڵļĴ���
    //ID/EX�Ĵ���
	floprc #(8) regE(
		clk,rst,flushE,
		{memtoregD,memwriteD,alusrcD,regdstD,regwriteD,alucontrolD},
		{memtoregE,memwriteE,alusrcE,regdstE,regwriteE,alucontrolE}
		);
	//EX/MEM�Ĵ���
	flopr #(8) regM(
		clk,rst,
		{memtoregE,memwriteE,regwriteE},
		{memtoregM,memwriteM,regwriteM}
		);
	//MEM/WB�Ĵ���
	flopr #(8) regW(
		clk,rst,
		{memtoregM,regwriteM},
		{memtoregW,regwriteW}
		);
endmodule
