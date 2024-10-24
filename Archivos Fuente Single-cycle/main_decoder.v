`timescale 1ns / 1ps
module main_decoder(
    input [6:0] opc,
    output RegWrite,
    output [2:0] ImmSrc,   // Ahora de 3 bits para sopcrtar más tipos de inmediato
    output ALUSrc,
    output MemWrite,
    output [1:0] ResultSrc,
    output Branch, Jump,
    output [1:0] ALUop     // Se conecta con el ALU Control
);

reg [11:0] salida;

always @(*)
     case (opc)
        7'b0000011 : salida <= 12'b100010010000;  // lw
        7'b0100011 : salida <= 12'b000111xx0000;  // sw
        7'b0110011 : salida <= 12'b1xxx00000100;  // R-type // xor
        7'b1100011 : salida <= 12'b001000xx1010;  // beq
        7'b0010011 : salida <= 12'b100010000100;  // I-type ALU
        7'b1101111 : salida <= 12'b1011x0100xx1;  // jal
        7'b0110111 : salida <= 12'b1101x0110xx0;  // lui
        default    : salida <= 12'bxxxxxxxxxxxx;
     endcase
        
assign {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump} = salida;
endmodule

