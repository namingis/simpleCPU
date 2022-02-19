`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/23 14:57:35
// Design Name: 
// Module Name: sim_for_instruction_rom
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


module sim_for_instruction_rom(

    );
    reg clk;
    reg [31:0]instr_address;
    wire [31:0]instr;
    initial begin
        clk=0;
        instr_address=0;
    end
    instruction_rom imem(        
                        .clka(clk),
                        .ena(1'b1),
                        .addra(instr_address),
                        .douta(instr)
                        );
    always #5 clk=~clk;
endmodule
