`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/14 20:03:11
// Design Name: 
// Module Name: mux
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


module mux(
    addr,in1,in2,in3,in4,in5,in6,in7,in8,nCS,mode,range,Mout
    );
   /*mode input a 2 bits signal to choose 2/4/8 mode 
   //00 - 2
   //01 - 4
   //10 - 8
   */
   input[1:0] mode;
   input[127:0] addr;
   input[7:0] in1,in2,in3,in4,in5,in6,in7,in8;
   //chose the range of selector,first bit number is 1
   //000:8-16
   //001:17-32
   //010:33-48
   //011:49-64
   //100:100-128
   input[2:0] range;
   input nCS;
   output reg [7:0] Mout;
   //store the result of selector
   reg [28:0] result;
   reg [28:0] selector = 8'h00;;
   
    always @ (*)
    begin
        if(!nCS)  
            begin
            //choose range
            case(range)
            3'b000:selector[8:0] = addr[15:7];
            3'b001:selector[15:0] = addr[31:16];
            3'b010:selector[16:0] = addr[47:32];
            3'b011:selector[15:0] = addr[63:48];
            3'b100:selector[28:0] = addr[127:99];
            default:selector[28:0] = 8'h00;
            endcase
            
            
            //chose mode
            case(mode)
            2'b00:result <= selector & 8'h01;
            2'b01:result <= selector & 8'h03;
            2'b10:result <= selector & 8'h07;
            default:result <= selector & 8'hxx;
            endcase   
            
            
            
            
            //get output     
            case(result)
            8'h00: Mout = in1;
            8'h01: Mout = in2;
            8'h02: Mout = in3;
            8'h04: Mout = in4;
            8'h05: Mout = in5;
            8'h06: Mout = in6;
            8'h07: Mout = in7;
            8'h08: Mout = in8;
            default: Mout = 0;
            endcase
            end
        else
            Mout = 0;
    end 
    
endmodule
