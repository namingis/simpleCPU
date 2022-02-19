`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/22 09:57:41
// Design Name: 
// Module Name: sim_for_display
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


module sim_for_display(

    );
    reg clk;
    reg rst;
    reg [31:0]data;
    wire [6:0]seg;
    wire [7:0]ans;
    display display(clk,rst,data,seg,ans);
    initial begin
        clk=0;
        rst=0;
        data=1;
    end
    always #5 begin clk<=~clk; data<=data+1; end
endmodule
