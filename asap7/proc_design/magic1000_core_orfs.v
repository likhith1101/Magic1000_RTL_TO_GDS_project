`timescale 1ns / 1ps
`include "magic1000_defines.vh"

// ASIC/ORFS-friendly MAGIC-1000 top.
//
// Program storage is intentionally outside this module. OpenROAD-flow-scripts
// handles this style more predictably than a simulation-loaded internal memory.
module magic1000_core_orfs (
    input         clk,
    input         rst,
    input         run,
    input         halt_on_nop,

    output [3:0]  instr_addr,
    input  [15:0] instr_in,

    output [3:0]  data_addr,
    input  [3:0]  data_in,

    output        halted,
    output reg [3:0] out_a,
    output reg [3:0] out_b,
    output reg       out_valid,

    output [3:0] reg0,
    output [3:0] reg1,
    output [3:0] reg2,
    output [3:0] reg3
);
    reg [3:0] pc_reg;
    reg halted_reg;

    wire [3:0] opcode;
    wire [1:0] rd;
    wire [1:0] ra;
    wire [1:0] rb;
    wire [3:0] mem_addr;
    wire reg_write;
    wire load_en;
    wire move_en;
    wire display_en;
    wire alu_en;
    wire [3:0] reg_a;
    wire [3:0] reg_b;
    wire [3:0] alu_y;
    wire alu_carry;
    wire [3:0] write_data;
    wire active;

    assign instr_addr = pc_reg;
    assign halted = halted_reg;
    assign data_addr = mem_addr;
    assign active = run && !halted_reg;

    magic1000_decoder decoder (
        .instr(instr_in),
        .opcode(opcode),
        .rd(rd),
        .ra(ra),
        .rb(rb),
        .mem_addr(mem_addr),
        .reg_write(reg_write),
        .load_en(load_en),
        .move_en(move_en),
        .display_en(display_en),
        .alu_en(alu_en)
    );

    magic1000_regfile register_file (
        .clk(clk),
        .rst(rst),
        .write_en(reg_write && active),
        .write_addr(rd),
        .write_data(write_data),
        .read_addr_a(ra),
        .read_addr_b(rb),
        .read_data_a(reg_a),
        .read_data_b(reg_b),
        .reg0(reg0),
        .reg1(reg1),
        .reg2(reg2),
        .reg3(reg3)
    );

    magic1000_alu alu (
        .op(opcode),
        .a(reg_a),
        .b(reg_b),
        .y(alu_y),
        .carry(alu_carry)
    );

    assign write_data = load_en ? data_in :
                        move_en ? reg_a :
                        alu_en  ? alu_y :
                        4'h0;

    always @(posedge clk) begin
        if (rst) begin
            pc_reg <= 4'h0;
            halted_reg <= 1'b0;
            out_a <= 4'h0;
            out_b <= 4'h0;
            out_valid <= 1'b0;
        end else if (active) begin
            out_valid <= display_en;
            if (display_en) begin
                out_a <= reg_a;
                out_b <= reg_b;
            end

            if (halt_on_nop && (opcode == `MAGIC_OP_NOP)) begin
                halted_reg <= 1'b1;
            end else begin
                pc_reg <= pc_reg + 4'h1;
            end
        end else begin
            out_valid <= 1'b0;
        end
    end
endmodule
