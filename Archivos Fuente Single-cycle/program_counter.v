`timescale 1ns / 1ps
module program_counter #(parameter n=7)(
    input clk,
    input reset,
    input [n-1:0] D,
    output reg [n-1:0] Q=0
);
    always @(posedge clk)
        if (reset)
            Q <= {n{1'b0}}; //
        else
            Q <= D; // 
endmodule

