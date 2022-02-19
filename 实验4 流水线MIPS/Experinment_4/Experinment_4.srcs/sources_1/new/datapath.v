`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/02 15:12:22
// Design Name: 
// Module Name: datapath
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


module datapath(
	input wire clk,rst,
	//IF
	output wire[31:0] pcF,
	input wire[31:0] instrF,
	//ID
	input wire pcsrcD,branchD,
	input wire jumpD,
	output wire equalD,
	output wire[5:0] opD,functD,
	//EX
	input wire memtoregE,
	input wire alusrcE,regdstE,
	input wire regwriteE,
	input wire[2:0] alucontrolE,
	output wire flushE,
	//MEM
	input wire memtoregM,
	input wire regwriteM,
	output wire[31:0] aluoutM,writedataM,
	input wire[31:0] readdataM,
	//WB
	input wire memtoregW,
	input wire regwriteW
    );
	
	//IF
	wire stallF;
	wire [31:0] pcnextFD,pcnextbrFD,pcplus4F,pcbranchD;
	//ID
	wire [31:0] pcplus4D,instrD;
	wire forwardaD,forwardbD;
	wire [4:0] rsD,rtD,rdD;
	wire flushD,stallD; 
	wire [31:0] signimmD,signimmshD;
	wire [31:0] srcaD,srca2D,srcbD,srcb2D;
	//EX
	wire [1:0] forwardaE,forwardbE;
	wire [4:0] rsE,rtE,rdE;
	wire [4:0] writeregE;
	wire [31:0] signimmE;
	wire [31:0] srcaE,srca2E,srcbE,srcb2E,srcb3E;
	wire [31:0] aluoutE;
	//MEM
	wire [4:0] writeregM;
	//WB
	wire [4:0] writeregW;
	wire [31:0] aluoutW,readdataW,resultW;

	//����ð�գ�hazardģ��
	hazard h(
		//IF
		stallF,		
		//ID
		rsD,rtD,branchD,forwardaD,forwardbD,stallD,		
		//EX
		rsE,rtE,writeregE,regwriteE,memtoregE,forwardaE,forwardbE,flushE,
		//MEM
		writeregM,regwriteM,memtoregM,
		//WB
		writeregW,regwriteW);

	//pcSrc��jump�����ź�
	mux2 #(32) pcbrmux(pcplus4F,pcbranchD,pcsrcD,pcnextbrFD);//branch
	mux2 #(32) pcmux(pcnextbrFD,                             //jump
		{pcplus4D[31:28],instrD[25:0],2'b00},
		jumpD,pcnextFD);

	//Register FIle
	regfile rf(clk,regwriteW,rsD,rtD,writeregW,resultW,srcaD,srcbD);

	//IF
	pc #(32) pcreg(clk,rst,~stallF,pcnextFD,pcF);
	
	adder pcadd1(pcF,32'h4,pcplus4F);//pc+4
	
	//IF-ID
	flopenr #(32) r1D(clk,rst,~stallD,pcplus4F,pcplus4D);
	flopenrc #(32) r2D(clk,rst,~stallD,flushD,instrF,instrD);
	signext se(instrD[15:0],signimmD);
	sl2 immsh(signimmD,signimmshD);
	adder pcadd2(pcplus4D,signimmshD,pcbranchD);//pc_branch
	//����ð�գ���ǰ�жϣ�beq
	mux2 #(32) forwardamux(srcaD,aluoutM,forwardaD,srca2D);
	mux2 #(32) forwardbmux(srcbD,aluoutM,forwardbD,srcb2D);
	eqcmp comp(srca2D,srcb2D,equalD);//�Ƿ����

	assign opD = instrD[31:26];
	assign functD = instrD[5:0];
	assign rsD = instrD[25:21];
	assign rtD = instrD[20:16];
	assign rdD = instrD[15:11];

	//ID-EX
	floprc #(32) r1E(clk,rst,flushE,srcaD,srcaE);
	floprc #(32) r2E(clk,rst,flushE,srcbD,srcbE);
	floprc #(32) r3E(clk,rst,flushE,signimmD,signimmE);
	floprc #(5) r4E(clk,rst,flushE,rsD,rsE);
	floprc #(5) r5E(clk,rst,flushE,rtD,rtE);
	floprc #(5) r6E(clk,rst,flushE,rdD,rdE);
    //����ð��
	mux3 #(32) forwardaemux(srcaE,resultW,aluoutM,forwardaE,srca2E);
	mux3 #(32) forwardbemux(srcbE,resultW,aluoutM,forwardbE,srcb2E);
	mux2 #(32) srcbmux(srcb2E,signimmE,alusrcE,srcb3E);//�Ƿ�ѡ��������
	
	alu alu(srca2E,srcb3E,alucontrolE,aluoutE);//alu����
	
	mux2 #(5) wrmux(rtE,rdE,regdstE,writeregE);//ѡ��д��RF�ĵ�ַ

	//MEM
	flopr #(32) r1M(clk,rst,srcb2E,writedataM);//д���ڴ����
	flopr #(32) r2M(clk,rst,aluoutE,aluoutM);//alu������
	flopr #(5) r3M(clk,rst,writeregE,writeregM);//д��RF�ĵ�ַ

	//WB
	flopr #(32) r1W(clk,rst,aluoutM,aluoutW);//alu������
	flopr #(32) r2W(clk,rst,readdataM,readdataW);//MEM����������
	flopr #(5) r3W(clk,rst,writeregM,writeregW);//д��RF�ĵ�ַ
	mux2 #(32) resmux(aluoutW,readdataW,memtoregW,resultW);//д��RF������
endmodule
