`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/21 11:32:45
// Design Name: 
// Module Name: aludec
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


module aludec(
    input [1:0]ALUOp,
    input [5:0]funct,
    output reg [2:0]ALUControl
    );
    always @ (*)
    begin
        case({ALUOp,funct})
            8'b10100000:
            begin
                ALUControl<=3'b010;
            end
            8'b10100010:
            begin
                ALUControl<=3'b110;
            end
            8'b10100100:
            begin
                ALUControl<=3'b000;
            end
            8'b10100101:
            begin
                ALUControl<=3'b001;    
            end
            8'b10101010:
            begin
                ALUControl<=3'b111;
            end
            default:
                case(ALUOp)
                    2'b00:
                    begin
                        ALUControl<=3'b010;
                    end
                    2'b01:
                    begin
                        ALUControl<=3'b110;
                    end
                    default:
                        ALUControl<=3'b000;
                endcase
        endcase
    end
endmodule
/*
module aludec(
    input [1:0]ALUOp,
    input [5:0]funct,
    output reg [2:0]ALUControl
    );
    always @ (*)
    begin
        case({ALUOp,funct})
            8'b00xxxxxx:
            begin
                ALUControl<=3'b010;
            end
            8'b01xxxxxx:
            begin
                ALUControl<=3'b110;
            end
            8'b10100000:
            begin
                ALUControl<=3'b010;
            end
            8'b10100010:
            begin
                ALUControl<=3'b110;
            end
            8'b10100100:
            begin
                ALUControl<=3'b000;
            end
            8'b10100101:
            begin
                ALUControl<=3'b001;    
            end
            8'b10101010:
            begin
                ALUControl<=3'b111;
            end
        endcase                                                                           
    end
endmodule
*/
/*
module aludec(
    input [1:0]ALUOp,
    input [5:0]funct,
    output reg [2:0]ALUControl
    );
    always @ (*)
    begin
        case({ALUOp,funct})
            8'b10100000:
            begin
                ALUControl<=3'b010;
            end
            8'b10100010:
            begin
                ALUControl<=3'b110;
            end
            8'b10100100:
            begin
                ALUControl<=3'b000;
            end
            8'b10100101:
            begin
                ALUControl<=3'b001;    
            end
            8'b10101010:
            begin
                ALUControl<=3'b111;
            end
            default:
                case(ALUOp)
                    2'b00:
                    begin
                        ALUControl<=3'b010;
                    end
                    2'b01:
                    begin
                        ALUControl<=3'b110;
                    end
                endcase
        endcase
    end
endmodule
*/