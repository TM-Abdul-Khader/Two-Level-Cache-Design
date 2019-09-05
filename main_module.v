module main_module(Add,Clk,Strobe,Hit);
parameter tagwid1=3;
parameter setwid1=9;
parameter tagwid2=2;
parameter setwid2=10;
parameter setnum1=512;
parameter setnum2=1024;
input[15:0] Add;
input Clk,Strobe;
output[1:0] Hit;
wire[1:0] Hit;
wire[tagwid1-1:0] Tag1;
wire[setwid2-1:0] Set2;
wire[setwid1-1:0] Set1;
wire[tagwid2-1:0] Tag2;
add_seperator m1(.add(Add),.strobe(Strobe),.tag1(Tag1),.set1(Set1),.set2(Set2),.tag2(Tag2),.clk(Clk));
cache m2(.tag1(Tag1),.set1(Set1),.tag2(Tag2),.set2(Set2),.hit(Hit),.clk(Clk),.strobe(Strobe));
endmodule