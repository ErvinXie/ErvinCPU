`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/09/09 19:03:50
// Design Name:
// Module Name: regfile
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module regfile(input clk,
               input rst,
               input we,
               input[4:0] r1_addr,
               input[4:0] r2_addr,
               input[4:0] w_addr,
               output [31:0] r1_data,
               output [31:0] r2_data,
               input [31:0] w_data);

    reg[31:0] regs[31:0];
    assign r1_data = regs[r1_addr];
    assign r2_data = regs[r2_addr];
    
    integer i = 0;
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            for(i = 0;i <= 31;i = i+1)
                regs[i] <= 32'b0;
        end
        // for register $0
        else if (we) begin
            if (w_addr != 4'b0)begin
                regs[w_addr] <= w_data;
            end
        end
    end
endmodule
