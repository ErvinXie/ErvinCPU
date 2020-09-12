//alu sel
`define ALU_SEL_WIDTH 5

`define direct1 1
`define direct2 2
`define add_op 3
`define sub_op 4
`define and_op 5
`define or_op 6
`define xor_op 7
`define sll_op 8
`define srl_op 9
`define div_op 10

//inst_type
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
`define noinst 14
// reg w addr 
`define reg_wa_rt 0
`define reg_wa_rd 1

// reg w data 
`define reg_wd_alu 0
`define reg_wd_dmem 1

// alu in 1
`define alu_in1_rd1 0
`define alu_in1_imm 1
`define alu_in1_sa 2
`define alu_in1_16 3

// alu in 2
`define alu_in2_rd2 0
`define alu_in2_imm 1
`define alu_in2_null 2
`define alu_in2_null 3

// br 
`define nojump 0
`define br_beq 1
`define br_j 2