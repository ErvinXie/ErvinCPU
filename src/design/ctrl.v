`timescale 1ns/1ps
`include "marco.v"



module ctrl(
    input[5:0] opcode,
    input[5:0] func,

    output[3:0] cb,
    
    output dmem_we,

    output mwa_sel,
    output mwd_sel,
    output reg_we,

    output[`ALU_SEL_WIDTH-1:0] alu_sel,
    output[1:0] alu1_sel,
    output[1:0] alu2_sel
    

);

    wire [10:0] inst_type;
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

    assign dmem_we = (inst_type==`sw)?1:0;

    assign alu_sel = (inst_type==`lui)?`sll_op:
                     (inst_type==`addiu)?`add_op:
                     (inst_type==`add)?`add_op:
                     (inst_type==`sub)?`sub_op:
                     (inst_type==`lw)?`add_op:
                     (inst_type==`sw)?`add_op:
                     (inst_type==`ori)?`or_op:
                     (inst_type==`divu)?`div_op:
                     (inst_type==`addu)?`add_op:
                     (inst_type==`sll)?`sll_op:
                     (inst_type==`srl)?`srl_op:

                     `direct1;
   
    assign alu1_sel =(inst_type==`lui)?`alu_in1_16:
                     (inst_type==`addiu)?`alu_in1_rd1:
                     (inst_type==`add)?`alu_in1_rd1:
                     (inst_type==`sub)?`alu_in1_rd1:
                     (inst_type==`lw)?`alu_in1_rd1:
                     (inst_type==`sw)?`alu_in1_rd1:
                     (inst_type==`ori)?`alu_in1_rd1:
                     (inst_type==`divu)?`alu_in1_rd1:
                     (inst_type==`addu)?`alu_in1_rd1:
                     (inst_type==`sll)?`alu_in1_sa:
                     (inst_type==`srl)?`alu_in1_sa:

                     0;

    assign alu2_sel =(inst_type==`lui)?`alu_in2_imm:
                     (inst_type==`addiu)?`alu_in2_imm:
                     (inst_type==`add)?`alu_in2_rd2:
                     (inst_type==`sub)?`alu_in2_rd2:
                     (inst_type==`lw)?`alu_in2_imm:
                     (inst_type==`sw)?`alu_in2_imm:
                     (inst_type==`ori)?`alu_in2_imm:
                     (inst_type==`divu)?`alu_in2_rd2:
                     (inst_type==`addu)?`alu_in2_rd2:
                     (inst_type==`sll)?`alu_in2_rd2:
                     (inst_type==`srl)?`alu_in2_rd2:
                     0;

    assign mwd_sel = (inst_type==`lui)?`reg_wd_alu:
                     (inst_type==`addiu)?`reg_wd_alu:
                     (inst_type==`add)?`reg_wd_alu:
                     (inst_type==`sub)?`reg_wd_alu:
                     (inst_type==`lw)?`reg_wd_dmem:
                     (inst_type==`ori)?`reg_wd_alu:
                     (inst_type==`addu)?`reg_wd_alu:
                     (inst_type==`sll)?`reg_wd_alu:
                     (inst_type==`srl)?`reg_wd_alu:
                     0;

    assign mwa_sel = (inst_type==`lui)?`reg_wa_rt:
                     (inst_type==`addiu)?`reg_wa_rt:
                     (inst_type==`add)?`reg_wa_rd:
                     (inst_type==`sub)?`reg_wa_rd:
                     (inst_type==`lw)?`reg_wa_rt:
                     (inst_type==`ori)?`reg_wa_rt:
                     (inst_type==`addu)?`reg_wa_rd:
                     (inst_type==`sll)?`reg_wa_rd:
                     (inst_type==`srl)?`reg_wa_rd:
                     0;
     assign reg_we = (inst_type==`lui
                    ||inst_type==`addiu
                    ||inst_type==`add
                    ||inst_type==`sub
                    ||inst_type==`lw
                    ||inst_type==`ori
                    ||inst_type==`addu
                    ||inst_type==`sll
                    ||inst_type==`srl
                    )?1:0;
        
        
    assign cb = (inst_type==`beq)? `br_beq:
                (inst_type==`j)? `br_j:
                `nojump;



endmodule

