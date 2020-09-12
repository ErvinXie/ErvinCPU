`timescale 1ns/1ps
`include "marco.v"


module alu(
    input clk,
    input rst,
    input[31:0] a,
    input[31:0] b,
    input[`ALU_SEL_WIDTH-1:0] s,
    output[31:0] c,

    output reg [31:0]  hi,
    output reg [31:0]  lo
);
    

    wire add_cout;
    wire[31:0] add_out;
    full_adder u_full_adder(
        .a(a),
        .b(b),
        .cin(0),
        .cout(add_cout),
        .s(add_out)
    );

    wire sub_cout;
    wire[31:0] sub_out;
    full_adder u_full_adder_sub(
        .a(a),
        .b(~b+1),
        .cin(0),
        .cout(sub_cout),
        .s(sub_out)
    );


    wire[31:0] or_out;
    assign or_out = a | b;

    wire[31:0] xor_out;
    assign xor_out = a ^ b;

    wire[31:0] and_out;
    assign and_out = a & b;

    wire[31:0] sll_out;
    assign sll_out = b << a;

    wire[31:0] srl_out;
    assign srl_out = b >> a;
    
    assign c =  (s==`direct1) ? a :
                (s==`direct2) ? b :
                (s==`add_op) ? add_out :
                (s==`sub_op) ? sub_out :
                (s==`and_op) ? and_out :
                (s==`or_op) ? or_out :
                (s==`xor_op) ? xor_out :
                (s==`sll_op) ? sll_out :
                (s==`srl_op) ? srl_out :
                8'b0;

    wire[31:0] divu_out_hi,divu_out_lo;
    divu u_divu(
        .a(a),
        .b(b),
        .quotient(divu_out_lo),
        .remainder(divu_out_hi)
    );
    

    always@(posedge clk) begin
        if(s==`div_op)begin
            hi<= divu_out_hi;
            lo<=divu_out_lo;
        end
        
        
    end


endmodule
