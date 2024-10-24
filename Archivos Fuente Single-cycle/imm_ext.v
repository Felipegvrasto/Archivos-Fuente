`timescale 1ns / 1ps
module imm_ext(
    input [24:0] Instr,
    input [2:0] ImmSrc,   // Ahora de 3 bits para soportar más tipos de inmediato
    output reg [31:0] ImmExt
);
    always @(*)
        case (ImmSrc)
            3'b000: ImmExt <= {{20{Instr[24]}}, Instr[24:20]}; // Tipo I
            3'b001: ImmExt <= {{20{Instr[24]}}, Instr[24:25], Instr[11:7]}; // Tipo S
            3'b010: ImmExt <= {{20{Instr[24]}}, Instr[0], Instr[23:18], Instr[4:1], 1'b0}; // Tipo B
            3'b011: ImmExt <= {{12{Instr[24]}}, Instr[12:5], Instr[13], Instr[23:14], 1'b0}; // Tipo J
            3'b101: ImmExt <= {Instr[24:5], 12'b0}; // Tipo U (lui)
            default: ImmExt <= 32'bx;
        endcase
endmodule
