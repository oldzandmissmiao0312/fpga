`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/14 20:02:19
// Design Name: 
// Module Name: sim
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


module sim(

    );
reg clk1=0,clk2=0,clk3=0,clk4=0,clk5=0,clk6=0,clk7=0,clk8=0;
always #100 clk1=~clk1;
always #200 clk2=~clk2;
always #300 clk3=~clk3;
always #400 clk4=~clk4;
always #500 clk5=~clk5;
always #600 clk6=~clk6;
always #700 clk7=~clk7;
always #800 clk8=~clk8;


wire[7:0] in1 = clk1;
wire[7:0] in2 = clk2;
wire[7:0] in3 = clk3;
wire[7:0] in4 = clk4;
wire[7:0] in5 = clk5;
wire[7:0] in6 = clk6;
wire[7:0] in7 = clk7;
wire[7:0] in8 = clk8;

wire[7:0] out = 8'h0;
reg[2:0] addr = 3'b011;
reg nCS = 0;

mux mymux(.addr(addr),.in1(in1),.in2(in2),.in3(in3),.in4(in4),.in5(in5),.in6(in6),.in7(in7),.in8(in8),.nCS(nCS),.Mout(out));

endmodule
