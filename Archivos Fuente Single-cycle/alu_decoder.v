`timescale 1ns / 1ps
module alu_decoder(
    input [1:0] ALUOp,       
    input funct7,op5,      // Bits de funct7 de la instrucción (incluyendo op5 para diferenciar)
    input [2:0] funct3,         // Bits de funct3 de la instrucción
    output reg [2:0] ALUControl // Señal de control para la ALU
);
    always @(*) 
        case (ALUOp)
            2'b00: ALUControl = 3'b000; // ADD para operaciones tipo LOAD/STORE
            2'b01: ALUControl = 3'b001; // SUBTRACT para operaciones tipo BRANCH
            2'b10: case (funct3)
                    3'b000  : ALUControl <= ({op5, funct7} == 2'b11) ? 3'b001 : 3'b000;   // Subtract : Add
                    3'b010  : ALUControl <= 3'b101; // SLT (Set Less Than)
                    3'b111  : ALUControl <= 3'b010; // AND
                    3'b110  : ALUControl <= 3'b011; // OR
                    3'b100  : ALUControl <= 3'b110; // XOR
                    default : ALUControl <= 3'bxxx; // Default a ADD si no se reconoce otra operación
                endcase
           default : ALUControl <= 3'bxxx; // Default general a ADD
         endcase
endmodule