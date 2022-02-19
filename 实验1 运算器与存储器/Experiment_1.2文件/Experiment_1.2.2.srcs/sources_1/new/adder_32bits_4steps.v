`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/26 20:11:53
// Design Name: 
// Module Name: adder_32bits_4steps
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


module adder_32bits_4steps(clk,reset,pause,A,B,cin,C,cout);
input clk,reset,cin,pause;
input [31:0]A;
input [31:0]B;
output reg [31:0]C;
output reg cout;

reg cout1,cout2,cout3;

reg [7:0]C1;
reg [15:0]C2;
reg [23:0]C3;
//step1
always @(posedge clk)begin
    if(!pause)begin
        if(reset)begin 
        C1=8'b0;
        cout1=1'b0;
        end
        else begin
        {cout1,C1}<={1'b0,A[7:0]}+{1'b0,B[7:0]}+cin;
        end
    end
end
//step2
always @(posedge clk)begin
    if(!pause)begin
        if(reset)begin 
        C2=16'b0;
        cout2=1'b0;
        end
        else begin
        {cout2,C2}<={{1'b0,A[15:8]}+{1'b0,B[15:8]}+cout1,C1};
        end
    end
end
//step3
always @(posedge clk)begin
    if(!pause)begin
        if(reset)begin 
        C3=24'b0;
        cout3=1'b0;
        end
        else begin
        {cout3,C3}<={{1'b0,A[23:16]}+{1'b0,B[23:16]}+cout2,C2};
        end
    end
end
//step4
always @(posedge clk)begin
    if(!pause)begin
        if(reset)begin 
        C=32'b0;
        cout=1'b0;
        end
        else begin
        {cout,C}<={{1'b0,A[31:24]}+{1'b0,B[31:24]}+cout3,C3};
        end
    end
end

endmodule
