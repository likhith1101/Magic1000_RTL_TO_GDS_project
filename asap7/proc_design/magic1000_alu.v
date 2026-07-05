`timescale 1ns / 1ps
`include "magic1000_defines.vh"

module magic1000_alu (
    input  [3:0] op,
    input  [3:0] a,
    input  [3:0] b,
    output reg [3:0] y,
    output reg       carry
);
    always @(*) begin
        carry = 1'b0;
        case (op)
            `MAGIC_OP_XOR: y = a ^ b;
            `MAGIC_OP_AND: y = a & b;
            `MAGIC_OP_OR:  y = a | b;
            `MAGIC_OP_ADD: {carry, y} = a + b;
            default:       y = 4'h0;
        endcase
    end
endmodule
