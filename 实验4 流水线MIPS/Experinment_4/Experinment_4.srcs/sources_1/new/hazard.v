`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/23 11:59:28
// Design Name: 
// Module Name: hazard
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


module hazard(
    //IF
    output stallF,
    
    //ID
    input [4:0] rsD, rtD,
    input branchD,
    output forwardAD, forwardBD,
    output stallD,

    //EX
    input [4:0] rsE, rtE,
    input [4:0] writeRegE,
    input regWriteE,
    input memToRegE,
    output [1:0] forwardAE, forwardBE,
    output flushE,

    //MEM
    input [4:0] writeRegM,
    input regWriteM,
    input memToRegM,

    //WB
    input [4:0] writeRegW,
    input regWriteW
    );
    
    //数据前推
    //第一个操作数
    assign forwardAE = ((rsE!=0) && (rsE==writeRegM) && regWriteM) ? 2'b10 : //来自EX/MEM
                        ((rsE!=0) && (rsE==writeRegW) && regWriteW) ? 2'b01: //来自MEM/MB
                        2'b00;  //无数据冒险
   
    //第二个操作数         
    assign forwardBE = ((rtE!=0) && (rtE==writeRegM) && regWriteM) ? 2'b10 : 
                        ((rtE!=0) && (rtE==writeRegW) && regWriteW) ? 2'b01:
                        2'b00;
    //暂停流水线
    wire lwStall;
    assign lwStall = ((rsD==rtE) || (rtD==rtE)) && memToRegE;//当前指令用到的两个寄存器等于前一条指令的rt（lw指令出现的数据冒险）
    
    
    //控制冒险前推
    assign forwardAD = (rsD!=0) && (rsD==writeRegM) && regWriteM;//将条件判断提前至ID。beq
    assign forwardBD = (rtD!=0) && (rtD==writeRegM) && regWriteM;
    
    //控制冒险暂停，又产生了数据冒险
    wire branchStall;
    assign branchStall = (branchD && regWriteE && (writeRegE==rsD || writeRegE==rtD))
                        | (branchD && memToRegM && (writeRegM==rsD || writeRegM==rtD));
    
    assign stallD = (lwStall | branchStall);//IF/ID
    assign stallF = (lwStall | branchStall);//IF
    assign flushE = (lwStall | branchStall);//ID/EX
endmodule


