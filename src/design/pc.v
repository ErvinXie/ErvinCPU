`timescale 1ns / 1ps

module pc(input clk,
          input rst,
          input we,
          input[31:0] in,
          output[31:0] out);
    
    reg[31:0] data;
    assign out = data;
    always @(posedge clk)begin
        if(we)begin
            data <= in;
        end
    end     
    
    
    
endmodule
