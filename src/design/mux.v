`timescale 1ns / 1ps

module mux2
#(WIDTH = 32)
(
  input [WIDTH-1:0] in0,
  input [WIDTH-1:0] in1,
  input  sel,
  output [WIDTH-1:0]  out
);

assign out = (sel==1'b0) ? in0 : in1;            
                        
endmodule

module mux4
#(WIDTH = 32)
(
  input [WIDTH-1:0] in0,
  input [WIDTH-1:0] in1,
  input [WIDTH-1:0] in2,
  input [WIDTH-1:0] in3,
  input  [1:0] sel,
  output [WIDTH-1:0]  out
);

assign out = (sel==2'd0) ? in0 :
             (sel==2'd1) ? in1 :
             (sel==2'd2) ? in2 : in3 ;
                        
endmodule

module mux8
#(WIDTH = 32)
(
  input [WIDTH-1:0] in0,
  input [WIDTH-1:0] in1,
  input [WIDTH-1:0] in2,
  input [WIDTH-1:0] in3,
  input [WIDTH-1:0] in4,
  input [WIDTH-1:0] in5,
  input [WIDTH-1:0] in6,
  input [WIDTH-1:0] in7,

  
  input  [2:0] sel,
  output [WIDTH-1:0]  out
);

assign out = (sel==3'd0) ? in0 :
             (sel==3'd1) ? in1 :
             (sel==3'd2) ? in2 :
             (sel==3'd3) ? in3 :
             (sel==3'd4) ? in4 :
             (sel==3'd5) ? in5 :
             (sel==3'd6) ? in6 :
              in7 ;
                        
endmodule
