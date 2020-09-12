`timescale 1ns/1ps
`define reserved 0

`define lui 1
`define addiu 2
`define add 3
`define sub 4
`define lw 5
`define sw 6
`define beq 7
`define j 8
`define ori 9
`define divu 10
`define addu 11
`define sll 12
`define srl 13

module ctrl(
    input[5:0] opcode,
    input[5:0] func
);

    wire [3:0] inst_type;
  
    assign inst_type = 
    (opcode==6'b001111)?`lui:
    (opcode==6'b001001)?`addiu:
    (opcode==6'b000000)?`add:
    (opcode==6'b100011)?`lw:
    (opcode==6'b101011)?`sw:
    (opcode==6'b000100)?`beq:
    (opcode==6'b000010)?`j:
    (opcode==6'b001101)?`ori:
    

    (opcode==6'b000000)?(
        (func==6'b011011)?`divu:
        (func==6'b100010)?`sub:
        (func==6'b100001)?`addu:
        (func==6'b000010)?`srl:
        (func==6'b000000)?`sll:`reserved
    ):`reserved;


endmodule