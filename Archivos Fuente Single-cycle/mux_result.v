`timescale 1ns / 1ps

module mux_result(
    input [31:0] ALUResult,  // Entrada 00
    input [31:0] ReadData,   // Entrada 01
    input [31:0] PCPlus4,    // Entrada 10
    input [31:0] ImmExt,     // Entrada 11 (para lui)
    input [1:0] ResultSrc,   // Selección del MUX
    output reg [31:0] Result // Resultado final
);
    always @(*) begin
        case (ResultSrc)
            2'b00: Result = ALUResult; // Resultado de la ALU
            2'b01: Result = ReadData;  // Datos leídos de la memoria
            2'b10: Result = PCPlus4;   // Valor de PC + 4
            2'b11: Result = ImmExt;    // Inmediato extendido (lui)
            default: Result = 32'b0;   // Valor por defecto (seguridad)
        endcase
    end
endmodule

