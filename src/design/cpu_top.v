`timescale 1ns / 1ps


module cpu_top(input clk,
               input rst);
    
    
    //pc
    
    wire[31:0]
    pc_in,
    pc_out,
    inst;
    
    
    wire
    pc_we;
    
    
    pc u_pc(
    .clk(clk),
    .rst(rst),
    .we(pc_we),
    .in(pc_in),
    .out(pc_out)
    );
    
    // inst part
    imem u_imem(
    .clk(clk),
    .rst(rst),
    .iaddr(pc_out),
    .idata(inst)
    );
    
    wire[4:0]
    rs,
    rt,
    rd,
    sa;
    
    assign rs = inst[25:21];
    assign rt = inst[20:16];
    assign rd = inst[15:11];
    assign sa = inst[10:6];
    
    wire[5:0]
    opcode,
    func;
    assign opcode = inst[31:26];
    assign func   = inst[5:0];
    
    wire[15:0] immediate;
    assign immediate = inst[15:0];
    
    wire[25:0] instr_index;
    assign instr_index = inst[25:0];

    wire[31:0] sign_extend;
    assign sign_extend = {16'b0,immediate};
    

    // regfile
    wire 
    reg_we;

    wire[4:0]
    r_r1_addr,
    r_r2_addr,
    r_w_addr;

    wire[31:0]
    r_r1_data,
    r_r2_data,
    r_w_data;

    regfile u_regfile(
        .clk(clk),
        .rst(rst),
        .we(reg_we),
        .r1_addr(r_r1_addr),
        .r2_addr(r_r2_addr),
        .w_addr(r_w_addr),

        .r1_data(r_r1_data),
        .r2_data(r_r2_data),
        .w_data(r_w_data)
    );
    
    
endmodule
