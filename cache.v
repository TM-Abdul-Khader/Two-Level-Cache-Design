`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2018 11:25:14 AM
// Design Name: 
// Module Name: L1_comparator
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


module cache(tag1,set1,tag2,set2,clk,hit,strobe);
parameter tagwid1=3;
parameter setwid1=9;
parameter tagwid2=2;
parameter setwid2=10;
parameter setnum1=512;
parameter setnum2=1024;
input[tagwid1-1:0] tag1;                                                                   
input[setwid1-1:0] set1;
input[tagwid2-1:0] tag2;
input[setwid2-1:0] set2;
input clk;
input strobe;
output[1:0] hit;
reg [tagwid1-1:0]tag_1[setnum1-1:0][1:0];
reg [tagwid2-1:0]tag_2[setnum2-1:0][1:0];
reg[1:0] hit;
reg[setnum1-1:0] coun1;
reg[setnum2-1:0]coun2;
always @(posedge clk)
begin

if(tag_1[set1][0]==tag1[tagwid1-1:0])
hit=2'b01;
else if(tag_1[set1][1]==tag1[tagwid1-1:0])
hit=2'b01;
else
hit=2'b00;
if(hit==2'b00) 
  begin
  if(tag_2[set2][0]==tag2[tagwid2-1:0])
   begin
   hit=2'b11;  
   end
   else if(tag_2[set2][1]==tag2[tagwid2-1:0])
   hit=2'b11;
   else
   begin
   hit=2'b10; 
   end
   end
   end

always @(strobe or tag1 or tag2 or hit or set1 or set2)
begin
if(strobe==1)
begin
case(hit)
3: begin
   if(coun1[set1]==0)
   begin
   tag_1[set1][0]=tag1[tagwid1-1:0];
   coun1[set1]=1'b1;
   end
   else 
   begin
   tag_1[set1][1]=tag1[tagwid1-1:0];
   coun1[set1]=1'b0;
   end
   end
2: begin
      if(coun1[set1]==0)
      begin
      tag_1[set1][0]=tag1[tagwid1-1:0];
      coun1[set1]=1'b1;
      end
      else 
      begin
      tag_1[set1][1]=tag1[tagwid1-1:0];
      coun1[set1]=1'b0;
      end
      if(coun2[set2]==0)
      begin
      tag_2[set2][0]=tag2[tagwid2-1:0];
      coun2[set2]=1; 
      end
      else 
      begin
      tag_2[set2][1]=tag2[tagwid2-1:0];
      coun2[set2]=0; 
      end
      end 
  
 endcase
 end
 end
endmodule
