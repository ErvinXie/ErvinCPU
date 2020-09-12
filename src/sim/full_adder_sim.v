`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/09/09 15:09:22
// Design Name:
// Module Name: full_adder_sim
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


module full_adder_sim();
    reg[31:0] a,b;
    reg cin;
    wire[31:0] s;
    wire cout;
    full_adder U_full_adder(
    .a(a),
    .b(~b+1),
    .cin(cin),
    .cout(cout),
    .s(s)
    );
    wire[31:0] re,test;
    assign re = a-b+cin;
    assign test = re^s;
    always begin
        a   = $random %100;
        b   = $random %100;
        cin = $random %2;

        #(50);
        
    end
    
    
endmodule
