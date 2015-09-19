module behavioralDecoder(out0,out1,out2,out3, address0,address1, enable);
output out0, out1, out2, out3;
input address0, address1;
input enable;
assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule

module structuralDecoder(out0,out1,out2,out3, addr0,addr1, enable);
output out0, out1, out2, out3;
input addr0, addr1;
input enable;
parameter delay = 50;

// Set up address inverse wires
wire naddr0, naddr1;
not #delay inv0(naddr0, addr0);
not #delay inv1(naddr1, addr1);

// And gate for each output
and #delay and0(out0, naddr1, naddr0, enable); 
and #delay and1(out1, naddr1, addr0, enable);
and #delay and2(out2, addr1, naddr0, enable);
and #delay and3(out3, addr1, addr0, enable);
endmodule

module testDecoder; 
reg addr0, addr1;
reg enable;
wire out0,out1,out2,out3;

// One of the following two lines must be commented out
behavioralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable);
//structuralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable);

initial begin
$display("En A0 A1| O0 O1 O2 O3 | Expected Output");
enable=0;addr0=0;addr1=0; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
enable=0;addr0=1;addr1=0; #1000
$display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
enable=0;addr0=0;addr1=1; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
enable=0;addr0=1;addr1=1; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
enable=1;addr0=0;addr1=0; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | O0 Only", enable, addr0, addr1, out0, out1, out2, out3);
enable=1;addr0=1;addr1=0; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | O1 Only", enable, addr0, addr1, out0, out1, out2, out3);
enable=1;addr0=0;addr1=1; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | O2 Only", enable, addr0, addr1, out0, out1, out2, out3);
enable=1;addr0=1;addr1=1; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | O3 Only", enable, addr0, addr1, out0, out1, out2, out3);
end
endmodule
