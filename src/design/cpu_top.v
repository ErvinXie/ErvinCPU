`timescale 1ns / 1ps


module cpu_top(input clk,
               input rst);
    
    
    //pc
    reg[31:0] pc;
  
    br(
        reg_rd1,
        reg_rd2,
        offset,
        instr_index,
        pc,
        cb,
        pc_in,
    );

    always @(posedge clk)begin
        pc<=pc_in;
    end
    
   
    // inst part
    wire[31:0] inst;
    imem (
        clk,
        rst,
        pc,
        inst
    );
    
    wire[4:0] rs,rt,rd,sa;
    
    assign rs = inst[25:21];
    assign rt = inst[20:16];
    assign rd = inst[15:11];
    assign sa = inst[10:6];
    
    wire[5:0] opcode,func;
    assign opcode = inst[31:26];
    assign func   = inst[5:0];
    
    wire[15:0] immediate;
    assign immediate = inst[15:0];
    assign offset = inst[15:0];
    
    assign instr_index = inst[25:0];

    wire[31:0] imm_ext;
    assign imm_ext = {16'h0000,immediate};

    wire[31:0] sa_ext;
    assign sa_ext = {27'b0,sa};
    

    // regfile
    wire reg_we;

    wire[4:0] reg_wa;


    mux2#(5)(
        rt,
        rd,
        mwa_sel,
        reg_wa
    );

    mux2(
        alu_c,
        dmem_rdata,
        mwd_sel,
        reg_wd
    );

    regfile u_regfile(
        clk,
        rst,
        reg_we,
        rs,
        rt,
        reg_wa,
        reg_rd1,
        reg_rd2,
        reg_wd
    );

    // alu
    mux4(
        reg_rd1,
        imm_ext,
        sa_ext,
        16,
        malu1sel,
        alu_a
    );

    mux4(
        reg_rd2,
        imm_ext,
        0,
        0,
        malu2sel,
        alu_b
    );


    wire [31:0] hi,lo;
    alu u_alu(
        .clk(clk),
        .rst(rst),
        .a(alu_a),
        .b(alu_b),
        .s(alu_s),
        .c(alu_c),
        .hi(hi),
        .lo(lo)
    );

    // dmem

    dmem u_dmem(
        .clk(clk),
        .rst(rst),
        .we(dmem_we),
        .daddr(dmem_addr),
        .wdata(dmem_wdata),
        .rdata(dmem_rdata)
    );

    //ctrl

    ctrl u_ctrl(
        opcode,
        func,

        cb,
        dmem_we,

        mwa_sel,
        mwd_sel,
        reg_we,

        alu_s,
        malu1sel,
        malu2sel
    );

    
    
endmodule
