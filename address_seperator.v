`timescale 1ns / 1ps


module add_seperator(add,tag1,set1,tag2,set2,strobe,clk);
parameter tagwid1=3;
parameter setwid1=9;
parameter tagwid2=2;
parameter setwid2=10;
parameter setnum1=512;
parameter setnum2=1024;
input[15:0] add;                                                         
input clk,strobe;
output[tagwid1-1:0] tag1;
output[setwid1-1:0] set1;
output[tagwid2-1:0] tag2;
output[setwid2-1:0] set2;
reg[tagwid1-1:0] tag1;
reg[setwid1-1:0] set1;
reg[tagwid2-1:0] tag2;
reg[setwid2-1:0] set2;
always @(posedge clk)
begin
if(strobe)
begin
 tag1[tagwid1-1:0]=add[15:(15-tagwid1+1)];
 set1[setwid1-1:0]=add[15-tagwid1:(15-tagwid1-setwid1+1)];
 set2[setwid2-1:0]=add[15-tagwid2:(15-tagwid2-setwid2+1)];
 tag2[tagwid2-1:0]=add[15:(15-tagwid2+1)];
end
else
 begin
  tag1[tagwid1-1:0]=7'bz;
  set1[setwid1-1:0]=5'bz;
  set2[setwid2-1:0]=7'bz;
  tag2[tagwid2-1:0]=7'bz; 
  end
end  
endmodule
