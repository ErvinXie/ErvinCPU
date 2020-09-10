`timescale 1ns / 1ps

module imem(input clk,
            input rst,
            input[31:0] iaddr,
            output [31:0] idata);
    
    reg[7:0] mem[255:0];
    
    wire[7:0] addr;
    assign addr  = iaddr[7:0];
    assign idata = {mem[addr+3],mem[addr+2],mem[addr+1],mem[addr]};
    
    // initial begin
        // $readmemb("",mem);
    // end
    
endmodule
