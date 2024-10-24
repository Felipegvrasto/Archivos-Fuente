`timescale 1ns / 1ps
module instruction_memory #(parameter bdata = 32, parameter baddr=7)(

    input [baddr-1:0] A,
    output [bdata-1:0] Instr
);
    reg [7:0] memory [0:(2**baddr)-1]; // Memoria de instrucciones (256 palabras)

 initial
     $readmemh("datos_memory.mem", memory, 0,	(2**baddr)-1);           


assign  Instr = {memory[A], memory[A+1], memory[A+2], memory[A+3]};
endmodule

