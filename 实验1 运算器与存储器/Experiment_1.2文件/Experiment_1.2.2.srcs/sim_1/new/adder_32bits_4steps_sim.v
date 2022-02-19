`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/26 20:33:36
// Design Name: 
// Module Name: adder_32bits_4steps_sim
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


module adder_32bits_4steps_sim();
reg clk,reset,cin,pause;
reg [31:0]A;
reg [31:0]B;
wire [31:0]C;
wire cout;

always #5 clk=~clk;

initial begin
    clk=1'b0;
    reset=1'b0;
    pause=1'b0;
    cin=1'b0;
    A=32'h12345678;
    B=32'h3;
    #80
    A=32'h87654321;
    B=32'h3;
    #20
    pause=1'b1;
    #20
    pause=1'b0;
    A=32'h11111111;
    B=32'h3;
    #30
    reset=1'b1;
    #10
    reset=1'b0;
    
end

adder_32bits_4steps t1(clk,reset,pause,A,B,cin,C,cout);
endmodule
