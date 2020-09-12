`timescale 1ns / 1ps

module dmem(input clk,
            input rst,
            input we,
            input[31:0] daddr,
            input[31:0] wdata,
            output[31:0] rdata);
    
    reg[7:0] mem[255:0];
    
    wire[7:0] addr;
    assign addr  = daddr[7:0];
    assign rdata = {mem[addr+3],mem[addr+2],mem[addr+1],mem[addr]};
    
    always @(posedge clk)begin
        if (we)begin
            mem[addr] <= wdata[7:0];
            mem[addr+1] <= wdata[15:8];
            mem[addr+2] <= wdata[23:16];
            mem[addr+3] <= wdata[31:24];
        end
    end
    initial begin
         $readmemb("D:/ErvinCPU/test/dmem.txt",mem);
    end
    
    
endmodule
