`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/09/09 15:01:55
// Design Name:
// Module Name: full_adder
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




module full_adder(input[31:0] a,
                  input[31:0] b,
                  input cin,
                  output cout,output[31:0] s);
    
    wire[8:0] c;
    assign c[0] = cin;
    assign cout = c[8];

    genvar i;
    generate 
        for (i=0;i<8;i=i+1)
        begin
            para4_full_adder add(
                .a(a[i*4+3:i*4]),
                .b(b[i*4+3:i*4]),
                .cin(c[i]),
                .cout(c[i+1]),
                .s(s[i*4+3:i*4])
            );
        end

    endgenerate


endmodule
    

