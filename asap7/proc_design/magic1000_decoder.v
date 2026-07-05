`timescale 1ns / 1ps
`include "magic1000_defines.vh"

module magic1000_decoder (
    input  [15:0] instr,
    output [3:0]  opcode,
    output [1:0]  rd,
    output [1:0]  ra,
    output [1:0]  rb,
    output [3:0]  mem_addr,
    output        reg_write,
    output        load_en,
    output        move_en,
    output        display_en,
    output        alu_en
);
    assign opcode   = instr[15:12];
    assign rd       = instr[11:10];
    assign ra       = instr[9:8];
    assign rb       = instr[7:6];
    assign mem_addr = instr[3:0];

    assign load_en    = (opcode == `MAGIC_OP_LD);
    assign move_en    = (opcode == `MAGIC_OP_MOV);
    assign display_en = (opcode == `MAGIC_OP_DISP);
    assign alu_en     = (opcode == `MAGIC_OP_XOR) ||
                        (opcode == `MAGIC_OP_AND) ||
                        (opcode == `MAGIC_OP_OR)  ||
                        (opcode == `MAGIC_OP_ADD);
    assign reg_write  = load_en || move_en || alu_en;
endmodule
