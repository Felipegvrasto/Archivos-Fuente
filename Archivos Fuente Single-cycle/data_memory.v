`timescale 1ns / 1ps

module data_memory #(parameter N=32, M=7)(
    input CLK,
    input WE,
    input [N-1:0] A,
    input [N-1:0] WD,
    output reg [N-1:0] RD
    );

reg [N-1:0] my_mem [2**M-1:0];

always @ (posedge CLK)
    if (WE) begin
        my_mem[A] <= WD;
        RD <= WD;
    end else
        RD <= my_mem[A];

endmodule


