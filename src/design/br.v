`timescale 1ns/1ps
`include "marco.v"


module br(
    input[31:0] rd1,
    input[31:0] rd2,
    input[15:0] offset,
    input[25:0] instr_index,
    input[31:0] pc,
    input[3:0] cb,

    output[31:0] new_pc
);

    wire[31:0] rela,j_addr,delta,delta_new_pc;
    assign j_addr = {pc[31:28],instr_index,2'b00};
    assign rela = {14'b0,offset,2'b00};
    wire brsel,jumpsel;
    assign brsel = (cb==`br_beq)?((rd1==rd2)?1:0):
                    0;
    assign jumpsel = (cb==`br_j)?1:0;
    mux2 u_mux1(
        4,
        rela,
        brsel,
        delta
    );
    assign delta_new_pc = pc+delta;

    mux2 u_mux2( 
        delta_new_pc,
        j_addr,
        jumpsel,
        new_pc
    );

endmodule