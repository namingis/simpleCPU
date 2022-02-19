`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/22 19:17:03
// Design Name: 
// Module Name: topsim
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


module testsim();
reg clk,rst;
wire[31:0] mem_wdata,dataadr;
wire memWrite;
wire[2:0] alucontrolE;
wire[31:0] pc,instruct;
wire zeroD,branchD,jumpD,flushE,regwriteE,memtoregE,alusrcE,regdstE;
always #5 clk=~clk;
initial begin
clk=1'b0;
rst=1'b1;
#20
rst=1'b0;
#1000
rst=1'b1;
end

top test(clk,rst,mem_wdata,dataadr,memWrite,zeroD,branchD,jumpD,flushE,regwriteE,memtoregE,alusrcE,regdstE,alucontrolE,pc,instruct);
endmodule
