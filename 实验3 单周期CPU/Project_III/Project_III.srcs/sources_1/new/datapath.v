`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/22 21:22:10
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
    input clk,
    input rst,
    input [31:0]instr,
    input [31:0]ram_read_data,
    input MemtoReg,
    input MemWrite,
    input ALUSrc,
    input RegDst,
    input RegWrite,
    input PCSrc,
    input Jump,
    input [2:0]ALUControl,
    output [31:0] ALUOut,
    output [31:0] WriteData,
    output [31:0] address,
    output zero,
    output [31:0]test_jump_address,
    output [31:0]test_plus_4_address,
    output [31:0]test_branch_address,
    output [31:0]test_shifted_address,
    output [31:0]test_immea,
    output [31:0]test_reg_out_1
    );
    
    wire [4:0]rs;
    wire [4:0]rt;
    wire [4:0]rd;
    wire [15:0]immeadiate;
    wire [25:0]jump_immea;
    assign rs=instr[25:21];
    assign rt=instr[20:16];
    assign rd=instr[15:11];
    assign immeadiate=instr[15:0];
    assign jump_immea=instr[25:0];
    wire [4:0]reg_write_destination;
    wire [31:0]reg_data_1;
    wire [31:0]reg_data_2;
    mux2 #(5)regdst(rt,rd,RegDst,reg_write_destination);
    wire [31:0]reg_write_data;
    mux2 #(32) memtoreg(ALUOut,ram_read_data,MemtoReg,reg_write_data);
    regfile regfile(
        .clk(clk),
        .we3(RegWrite),
        .ra1(rs),.ra2(rt),.wa3(reg_write_destination),
        .wd3(reg_write_data),
        .rd1(reg_data_1),.rd2(reg_data_2)
    );
    assign WriteData=reg_data_2;
    wire [31:0]extented_immea;
    signext signext(immeadiate,extented_immea);
    wire [31:0] alu_datain_2;
    mux2 #(32) alusrc(reg_data_2,extented_immea,ALUSrc,alu_datain_2);
    alu alu(reg_data_1,alu_datain_2,ALUControl,ALUOut,zero);
    assign test_immea=extented_immea;
    assign test_reg_out_1=reg_data_1;
    wire [31:0] shifted_extented_immea;
    sl2 sl2_0(extented_immea,shifted_extented_immea);
    wire [31:0] next_address; 
    pc pc(
        .next_address(next_address),
        .clk(clk),
        .rst(rst),
        .address(address)
        );
    wire [31:0] plus_4_address;
    adder plus_4_adder(address,32'h4,plus_4_address);
    wire [31:0] branch_address;
    adder branch_adder(shifted_extented_immea, plus_4_address,branch_address);
    wire [31:0] tmp_address;
    mux2 #(32)pcsrc(plus_4_address,branch_address,PCSrc,tmp_address);
    wire [31:0] shifted_jump_immea;
    sl2 sl2_1({6'h0,jump_immea},shifted_jump_immea);
    wire [31:0] jump_address;
    assign jump_address={plus_4_address[31:28],shifted_jump_immea[27:0]};
    assign test_jump_address=jump_address;
    mux2 #(32)jump(tmp_address,jump_address,Jump,next_address);
    assign test_plus_4_address=plus_4_address;
    assign test_branch_address=branch_address;
    assign test_shifted_address=shifted_extented_immea;
endmodule
