`timescale 1ns / 1ps

module magic1000_regfile (
    input        clk,
    input        rst,
    input        write_en,
    input  [1:0] write_addr,
    input  [3:0] write_data,
    input  [1:0] read_addr_a,
    input  [1:0] read_addr_b,
    output [3:0] read_data_a,
    output [3:0] read_data_b,
    output [3:0] reg0,
    output [3:0] reg1,
    output [3:0] reg2,
    output [3:0] reg3
);
    reg [3:0] regs [0:3];

    assign read_data_a = regs[read_addr_a];
    assign read_data_b = regs[read_addr_b];
    assign reg0 = regs[0];
    assign reg1 = regs[1];
    assign reg2 = regs[2];
    assign reg3 = regs[3];

    always @(posedge clk) begin
        if (rst) begin
            regs[0] <= 4'h0;
            regs[1] <= 4'h0;
            regs[2] <= 4'h0;
            regs[3] <= 4'h0;
        end else if (write_en) begin
            regs[write_addr] <= write_data;
        end
    end
endmodule
