module behavioralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder(out, carryout, a, b, carryin);
output out, carryout;
input a, b, carryin;
wire aXorB, _aXorB_andCarryin, aAndB;
parameter delay = 50;

xor #delay xor0(aXorB, a, b);
xor #delay xor1(out, aXorB, carryin);
and #delay and0(_aXorB_andCarryin, aXorB, carryin);
and #delay and1(aAndB, a, b);
or #delay or0(carryout, _aXorB_andCarryin, aAndB);
endmodule

module testFullAdder;
reg a, b, carryin;
wire sum, carryout;

// One of the following two lines must be commented out
behavioralFullAdder adder(sum, carryout, a, b, carryin);
//structuralFullAdder adder(sum, carryout, a, b, carryin);

initial begin
$display("A B Cin | S Cout | Expected Output");
a=0;b=0;carryin=0; #1000 
$display("%b  %b  %b |  %b  %b | Both 0", a, b, carryin, sum, carryout);
a=1;b=0;carryin=0; #1000 
$display("%b  %b  %b |  %b  %b | S=1, Cout=0", a, b, carryin, sum, carryout);
a=0;b=1;carryin=0; #1000 
$display("%b  %b  %b |  %b  %b | S=1, Cout=0", a, b, carryin, sum, carryout);
a=1;b=1;carryin=0; #1000 
$display("%b  %b  %b |  %b  %b | S=0, Cout=1", a, b, carryin, sum, carryout);
a=0;b=0;carryin=1; #1000 
$display("%b  %b  %b |  %b  %b | S=1, Cout=0", a, b, carryin, sum, carryout);
a=1;b=0;carryin=1; #1000 
$display("%b  %b  %b |  %b  %b | S=0, Cout=1", a, b, carryin, sum, carryout);
a=0;b=1;carryin=1; #1000 
$display("%b  %b  %b |  %b  %b | S=0, Cout=1", a, b, carryin, sum, carryout);
a=1;b=1;carryin=1; #1000 
$display("%b  %b  %b |  %b  %b | Both 1", a, b, carryin, sum, carryout);
end
endmodule
