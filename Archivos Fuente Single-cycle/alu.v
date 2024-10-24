`timescale 1ns / 1ps
module alu(
    input [31:0] A,          // Primer operando
    input [31:0] B,          // Segundo operando
    input [2:0] ALUControl,     // Señal de control para determinar la operación
    output reg [31:0] ALUResult, // Resultado de la operación ALU
    output Zero                // Señal que indica si el resultado es cero
);
    always @(*)
        case (ALUControl)
            3'b000: ALUResult =A + B;  // ADD
            3'b001: ALUResult =A - B;  // SUBTRACT
            3'b010: ALUResult =A & B;  // AND
            3'b011: ALUResult =A | B;  // OR
            3'b101: ALUResult =A < B;  // SLT
            3'b110: ALUResult =A ^ B;  // XOR
            default: ALUResult = 32'dx;       // Default: resultado en cero
        endcase
        
    // Asignar la señal Zero cuando el resultado es 0
    assign Zero = ((A - B) == 32'd0);
endmodule
