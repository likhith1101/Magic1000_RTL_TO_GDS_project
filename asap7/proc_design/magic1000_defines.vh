`ifndef MAGIC1000_DEFINES_VH
`define MAGIC1000_DEFINES_VH

// Paper-level MAGIC-1000 instruction set. The paper references the
// exact pin/code table in supplementary material, so this RTL uses a
// compact 16-bit encoding that preserves the published operations.
`define MAGIC_OP_NOP   4'h0
`define MAGIC_OP_LD    4'h1
`define MAGIC_OP_MOV   4'h2
`define MAGIC_OP_DISP  4'h3
`define MAGIC_OP_XOR   4'h4
`define MAGIC_OP_AND   4'h5
`define MAGIC_OP_OR    4'h6
`define MAGIC_OP_ADD   4'h7

`endif
