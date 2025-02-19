`timescale 1ns / 1ps

module control_unit(
    input Zero, funct7,
    input [2:0] funct3,
    input [6:0] op,
    output PCSrc, MemWrite, ALUSrc, RegWrite, Branch,
    output [1:0] ResultSrc,
    output [2:0] ALUControl, ImmSrc
    );

wire Jump;
wire [1:0] ALUOp;

main_decoder MM(
    .opc(op),
    .Jump(Jump),
    .Branch(Branch),
    .ResultSrc(ResultSrc),
    .ImmSrc(ImmSrc),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .ALUOp(ALUOp)
);

assign PCSrc = (Zero & Branch) | Jump;

alu_decoder AA(
    .funct7(funct7),
    .op5(op[5]),
    .funct3(funct3),
    .ALUOp(ALUOp),
    .ALUControl(ALUControl)
    );

endmodule

