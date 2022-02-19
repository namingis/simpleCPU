`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/23 11:54:03
// Design Name: 
// Module Name: sim_for_top
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


module sim_for_top(

    );
    reg clk,rst;
    wire [31:0] WriteData,ALUOut;
    wire MemWrite;
    wire [31:0] test_instr,test_ram_read_data;
    wire [31:0] test_address;
    wire test_memtoreg,test_alusrc,test_regdst,test_regwrite,test_jump,test_pcsrc,test_zero;
    wire [2:0]test_alucontrol;
    wire [31:0]test_jump_address;
    wire [31:0]test_plus_4_address;
    wire [31:0]test_branch_address;
    wire [31:0]test_shifted_address;
    wire [31:0]test_immea;
    wire [31:0]test_reg_out_1;
    top top(
        clk,rst,
        WriteData,ALUOut,
        MemWrite,
        test_instr,
        test_ram_read_data,
        test_address,
        test_memtoreg,test_alusrc,test_regdst,test_regwrite,test_jump,test_pcsrc,test_zero,
        test_alucontrol,
        test_jump_address,
        test_plus_4_address,
        test_branch_address,
        test_shifted_address,
        test_immea,
        test_reg_out_1
        );
    initial begin
        clk=0;
        rst=0;
    end
    always #5 clk=~clk;
endmodule
