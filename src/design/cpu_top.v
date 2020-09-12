`timescale 1ns / 1ps
`include "marco.v"

module cpu_top(input clk,
               input rst);
    
    wire[3:0] cb;

    wire[15:0] 
    offset;

    wire[25:0] 
    instr_index;

    wire[31:0] 
    reg_rd1,
    reg_rd2,
    pc_in;

    //pc
    reg[31:0] pc;

    br u_br(
        reg_rd1,
        reg_rd2,
        offset,
        instr_index,
        pc,
        cb,
        pc_in
    );

    always @(posedge clk)begin
        pc<=pc_in;
    end
    always@(negedge rst) begin
        pc<=32'b0;

    end
    
   
    // inst part
    wire[31:0] inst;
    imem u_imem(
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
    wire reg_we,mwa_sel,mwd_sel;

    wire[4:0] reg_wa;

    wire[31:0] 
    alu_c,
    dmem_rdata,
    reg_wd;
    

    mux2#(5) mreg_wa(
        rt,
        rd,
        mwa_sel,
        reg_wa
    );

    mux2 mreg_wd(
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
    wire[1:0]
    malu1sel,
    malu2sel;

    wire[31:0]
    alu_a,
    alu_b;
    
    mux4 maluin1(
        reg_rd1,
        imm_ext,
        sa_ext,
        16,
        malu1sel,
        alu_a
    );

    mux4 maluin2(
        reg_rd2,
        imm_ext,
        0,
        0,
        malu2sel,
        alu_b
    );


    wire [31:0] hi,lo;
    wire [`ALU_SEL_WIDTH-1:0] alu_sel;
    alu u_alu(
        .clk(clk),
        .rst(rst),
        .a(alu_a),
        .b(alu_b),
        .s(alu_sel),
        .c(alu_c),
        .hi(hi),
        .lo(lo)
    );

    // dmem
    wire dmem_we;
    wire[31:0] 
    dmem_addr,
    dmem_wdata;
    assign dmem_addr = alu_c;
    assign dmem_wdata = reg_rd2;

    
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

        alu_sel,
        malu1sel,
        malu2sel
    );

    
    
endmodule
