module hw1test;
// Declarations
// ...for all
reg A; // the input A
reg B; // the input B
wire nA;
wire nB;
not Ainv(nA, A); // create not gate called Ainv; takes A and produces nA
not Binv(nB, B);

// ...1: ~(AB)
wire AandB;
wire n_AandB_;
and andgate1(AandB, A, B); // create and gate called andgate1; takes A and B and produces AandB
not inv1(n_AandB_, AandB);

// ...2: ~A+~B
wire nAornB;
or orgate2(nAornB, nA, nB);

// ...3: ~(A+B)
wire AorB;
wire n_AorB_;
or orgate3(AorB, A, B);
not inv3(n_AorB_, AorB);

// ...4: ~A~B
wire nAandnB;
and andgate4(nAandnB, nA, nB);


// Display truth table
initial begin
$display("A B | ~A ~B | ~(AB) ~A+~B | ~(A+B) ~A~B"); // header for truth table

A=0;B=0; #1 // set A and B; wait for update (#1)
$display("%b %b |  %b  %b |    %b      %b |     %b     %b", A, B, nA, nB, n_AandB_, nAornB, n_AorB_, nAandnB); // string interpolation

A=0;B=1; #1
$display("%b %b |  %b  %b |    %b      %b |     %b     %b", A, B, nA, nB, n_AandB_, nAornB, n_AorB_, nAandnB);

A=1;B=0; #1
$display("%b %b |  %b  %b |    %b      %b |     %b     %b", A, B, nA, nB, n_AandB_, nAornB, n_AorB_, nAandnB);

A=1;B=1; #1
$display("%b %b |  %b  %b |    %b      %b |     %b     %b", A, B, nA, nB, n_AandB_, nAornB, n_AorB_, nAandnB);
end

endmodule