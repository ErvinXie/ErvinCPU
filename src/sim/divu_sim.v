`timescale 1ns/1ps
 
module int_div_tb;
 
reg [31:0] a;
reg [31:0] b;
wire [31:0] yshang;
wire [31:0] yyushu;
 
always
begin
	
		
	a = ($random()%100+100)%100;
	b = ($random()%10+10)%10;	
		
	#10;
  end
 
divu div
(
.a (a),
.b (b),
 
.quotient (yshang),
.remainder(yyushu)
);
 

endmodule

