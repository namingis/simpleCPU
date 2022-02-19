`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/23 10:48:59
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
	output wire [31:0] WriteData,ALUOut,
	output wire MemWrite,
	output wire [31:0] test_instr,
	output wire [31:0] test_ram_read_data,
	output wire [31:0] test_address,
	output test_memtoreg,test_alusrc,test_regdst,test_regwrite,test_jump,test_pcsrc,test_zero,
    output [2:0]test_alucontrol,
    output [31:0]test_jump_address,
    output [31:0]test_plus_4_address,
    output [31:0]test_branch_address,
    output [31:0]test_shifted_address,
        output [31:0]test_immea,
    output [31:0]test_reg_out_1
    );
    reg [2:0]count=2'h0;
    reg clk0=0;
    always @(posedge clk)
    begin
        if(count==7)
        begin
            count<=0;
            clk0<=~clk0;
        end
        else
        begin
            count<=count+1;
        end
    end
	wire[31:0] instr_address,instr,ram_read_data;
	mips mips(clk0,
	          rst,
              instr,
              ram_read_data,
              MemWrite,
              instr_address,
              ALUOut,
              WriteData,
              test_memtoreg,test_alusrc,test_regdst,test_regwrite,test_jump,test_pcsrc,test_zero,
              test_alucontrol,
              test_jump_address,
              test_plus_4_address,
              test_branch_address,
              test_shifted_address,
              test_immea,
              test_reg_out_1
              );
    instruction_rom imem(.clka(clk),
                         .ena(1'b1),
                         .addra(instr_address),
                         .douta(instr)
                         );
	data_ram dmem(.clka(clk),
                  .ena(MemWrite),
                  .addra(ALUOut),
                  .dina(WriteData),
                  .douta(ram_read_data)
                  );
	assign test_instr=instr;
	assign test_ram_read_data=ram_read_data;
	assign test_address=instr_address;
endmodule

