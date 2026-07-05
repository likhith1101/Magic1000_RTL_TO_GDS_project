`timescale 1ns / 1ps
`include "magic1000_defines.vh"

module magic1000_core #(
    parameter PROGRAM_DEPTH = 16,
    parameter DATA_DEPTH = 16
) (
    input         clk,
    input         rst,
    input         run,

    output [3:0]  data_addr,
    input  [3:0]  data_in,

    output [3:0]  pc,
    output [15:0] instr,
    output        halted,

    output reg [3:0] out_a,
    output reg [3:0] out_b,
    output reg       out_valid,

    output [3:0] reg0,
    output [3:0] reg1,
    output [3:0] reg2,
    output [3:0] reg3
);
    reg [15:0] program_mem [0:PROGRAM_DEPTH-1];
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

    assign pc = pc_reg;
    assign instr = program_mem[pc_reg];
    assign halted = halted_reg;
    assign data_addr = mem_addr;

    magic1000_decoder decoder (
        .instr(instr),
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
        .write_en(reg_write && run && !halted_reg),
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

    integer i;
    initial begin
        for (i = 0; i < PROGRAM_DEPTH; i = i + 1) begin
            program_mem[i] = 16'h0000;
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            pc_reg <= 4'h0;
            halted_reg <= 1'b0;
            out_a <= 4'h0;
            out_b <= 4'h0;
            out_valid <= 1'b0;
        end else if (run && !halted_reg) begin
            out_valid <= display_en;
            if (display_en) begin
                out_a <= reg_a;
                out_b <= reg_b;
            end

            if ((opcode == `MAGIC_OP_NOP) && (pc_reg == (PROGRAM_DEPTH - 1))) begin
                halted_reg <= 1'b1;
            end else begin
                pc_reg <= pc_reg + 4'h1;
            end
        end else begin
            out_valid <= 1'b0;
        end
    end
endmodule
