`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/09/09 16:51:47
// Design Name:
// Module Name: para4_full_adder
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module para4_full_adder(input[3:0] a,
                  input[3:0] b,
                  input cin,
                  output cout,
                  output[3:0] s);
    
    wire[3:0] p,g;
    wire[4:0] c;
    
    genvar i;
    generate
    for(i = 0; i<4; i = i+1) 
    begin
        assign p[i] = a[i]^b[i];
        assign g[i] = a[i]&b[i];
        assign s[i] = p[i]^c[i];
    end
    endgenerate
    assign c[0] = cin;
    assign c[1] = g[0] | (c[0]&p[0]);
    assign c[2] = g[1] | (g[0]&p[1]) | (c[0]&(&p[1:0]));
    assign c[3] = g[2] | (g[1]&p[2]) | (g[0]&(&p[2:1])) | (c[0]&(&p[2:0]));
    assign c[4] = g[3] | (g[2]&p[3]) | (g[1]&(&p[3:2])) | (g[0]&(&p[3:1])) | (c[0]&(&p[3:0]));
    assign cout = c[4];

endmodule
    
