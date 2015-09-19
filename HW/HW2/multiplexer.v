module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire[3:0] inputs = {in3, in2, in1, in0};
wire[1:0] address = {address1, address0};
assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire naddress0, naddress1, out0, out1, out2, out3;
parameter delay = 50;

not #delay (naddress0, address0);
not #delay (naddress1, address1);
and #delay (out0, in0, naddress1, naddress0);
and #delay (out1, in1, naddress1, address0);
and #delay (out2, in2, address1, naddress0);
and #delay (out3, in3, address1, address0);
or #delay (out, out0, out1, out2, out3);
endmodule


module testMultiplexer;
reg address0, address1, in0, in1, in2, in3;
wire out;

// One of the following two lines must be commented out
behavioralMultiplexer multiplexer(out, address0, address1, in0, in1, in2, in3);
//structuralMultiplexer multiplexer(out, address0, address1, in0, in1, in2, in3);

initial begin
$display("Addr Input | Out | Expected Output");
address1=0;address0=0;in3=0;in2=0;in1=0;in0=0; #1000 
$display(" %b%b  %b%b%b%b  |  %b  | 0", address0, address1, in3, in2, in1, in0, out);
address1=0;address0=0;in3=0;in2=0;in1=0;in0=1; #1000 
$display(" %b%b  %b%b%b%b  |  %b  | 1", address0, address1, in3, in2, in1, in0, out);
address1=0;address0=1;in3=0;in2=0;in1=0;in0=0; #1000 
$display(" %b%b  %b%b%b%b  |  %b  | 0", address0, address1, in3, in2, in1, in0, out);
address1=0;address0=1;in3=0;in2=0;in1=1;in0=0; #1000 
$display(" %b%b  %b%b%b%b  |  %b  | 1", address0, address1, in3, in2, in1, in0, out);
address1=1;address0=0;in3=0;in2=0;in1=0;in0=0; #1000 
$display(" %b%b  %b%b%b%b  |  %b  | 0", address0, address1, in3, in2, in1, in0, out);
address1=1;address0=0;in3=0;in2=1;in1=0;in0=0; #1000 
$display(" %b%b  %b%b%b%b  |  %b  | 1", address0, address1, in3, in2, in1, in0, out);
address1=1;address0=1;in3=0;in2=0;in1=0;in0=0; #1000 
$display(" %b%b  %b%b%b%b  |  %b  | 0", address0, address1, in3, in2, in1, in0, out);
address1=1;address0=1;in3=1;in2=0;in1=0;in0=0; #1000 
$display(" %b%b  %b%b%b%b  |  %b  | 1", address0, address1, in3, in2, in1, in0, out);
end
endmodule
