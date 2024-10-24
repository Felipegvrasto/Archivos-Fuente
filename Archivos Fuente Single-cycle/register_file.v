`timescale 1ns / 1ps
module register_file(
    input clk,                   // Reloj para sincronizaci�n
    input RegWrite,              // Se�al de control para habilitar la escritura
    input [4:0] A1,              // Direcci�n del primer registro a leer
    input [4:0] A2,              // Direcci�n del segundo registro a leer
    input [4:0] A3,              // Direcci�n del registro a escribir
    input [31:0] WD3,            // Datos que se escribir�n en el registro A3
    output [31:0] RD1,           // Datos le�dos del registro A1
    output [31:0] RD2            // Datos le�dos del registro A2
);
    // Definir los registros
    reg [31:0] registers [0:(2**5)-1];

integer i;
initial begin
    for (i = 0; i <= 31; i = i + 1)
        registers[i] <= 0;
    end
    
    // Escritura de registros (sincronizado con el reloj)
    always @(posedge clk)
       if (RegWrite)
        registers[A3] <= WD3;
        
assign RD1 = registers[A1];
assign RD2 = registers[A2];

endmodule
