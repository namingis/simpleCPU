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
    
    //����ǰ��
    //��һ��������
    assign forwardAE = ((rsE!=0) && (rsE==writeRegM) && regWriteM) ? 2'b10 : //����EX/MEM
                        ((rsE!=0) && (rsE==writeRegW) && regWriteW) ? 2'b01: //����MEM/MB
                        2'b00;  //������ð��
   
    //�ڶ���������         
    assign forwardBE = ((rtE!=0) && (rtE==writeRegM) && regWriteM) ? 2'b10 : 
                        ((rtE!=0) && (rtE==writeRegW) && regWriteW) ? 2'b01:
                        2'b00;
    //��ͣ��ˮ��
    wire lwStall;
    assign lwStall = ((rsD==rtE) || (rtD==rtE)) && memToRegE;//��ǰָ���õ��������Ĵ�������ǰһ��ָ���rt��lwָ����ֵ�����ð�գ�
    
    
    //����ð��ǰ��
    assign forwardAD = (rsD!=0) && (rsD==writeRegM) && regWriteM;//�������ж���ǰ��ID��beq
    assign forwardBD = (rtD!=0) && (rtD==writeRegM) && regWriteM;
    
    //����ð����ͣ���ֲ���������ð��
    wire branchStall;
    assign branchStall = (branchD && regWriteE && (writeRegE==rsD || writeRegE==rtD))
                        | (branchD && memToRegM && (writeRegM==rsD || writeRegM==rtD));
    
    assign stallD = (lwStall | branchStall);//IF/ID
    assign stallF = (lwStall | branchStall);//IF
    assign flushE = (lwStall | branchStall);//ID/EX
endmodule


