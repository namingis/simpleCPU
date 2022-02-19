`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/07 13:50:53
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
	input wire clk,rst,
	output wire[31:0] writedata,dataadr,
	output wire memwrite
    );
    wire equalD,branchD,jumpD,flushE,regwriteE,memtoregE,alusrcE,regdstE;
	wire[2:0] alucontrolE;
	wire[31:0] pc,instruct;
	wire[31:0] readdata;

	mips mips(clk,rst,pc,instruct,memwrite,dataadr,writedata,readdata,equalD,branchD,jumpD,flushE,regwriteE,memtoregE,alusrcE,regdstE,alucontrolE);
	inst_mem imem(.clka(~clk),.addra(pc[7:2]),.douta(instruct));
	data_mem dmem(.clka(~clk),.wea(memwrite),.addra(dataadr),.dina(writedata),.douta(readdata));
endmodule
