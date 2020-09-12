`timescale 1ns / 1ps
`include "marco.v"

module imem(input clk,
            input rst,
            input[31:0] iaddr,
            output [31:0] idata);
    
    reg[31:0] mem[`IMEM_SIZE-1:0];
    
    wire[`IMEM_ADDR_WIDTH-1:0] addr;
    assign addr  = iaddr[`IMEM_ADDR_WIDTH-1:0];
    assign idata = mem[(addr>>2)];
    
    initial begin
        $readmemh("D:/ErvinCPU/test/imem.txt",mem);
    end
    
endmodule
