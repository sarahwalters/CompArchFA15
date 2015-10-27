module register_testbench;
  // Regular register
  wire[31:0] q;
  reg[31:0] d;
  reg wrenable, clk;
  register32 r(q, d, wrenable, clk);

  // Zero register
  wire[31:0] q_z;
  reg wrenable_z, clk_z;
  register32zero r_z(q_z, wrenable_z, clk_z);

  initial begin
    // Initial conditions
    $display(" ");
    $display("Initial conditions");
    $display(" wrenable  clk                d                  |                 q                  |             expected q");

    wrenable=1'b1; d=32'b0; clk=1'b0; #5
    clk=1'b1; #5 // trigger first clk posedge
    clk=1'b0; #5
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b0);


    // Write enabled cases
    $display(" ");
    $display("Write enabled cases");
    $display(" wrenable  clk                d                  |                 q                  |             expected q");

    // q won't change yet -- waiting for clk posedge
    d=32'b1; #5
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b0);

    // q will change -- clk posedge
    clk=1'b1; #5
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b1);

    // q won't change yet -- waiting for clk posedge
    d=32'b0; clk=0'b0; #5
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b1);

    // q will change -- clk posedge
    clk=1'b1; #5
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b0);


    // Write disabled cases
    $display(" ");
    $display("Write disabled cases");
    $display(" wrenable  clk                d                  |                 q                  |             expected q");
    wrenable=1'b0;

    // Initial condition
    d=32'b1; clk=1'b0; #5
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b0);

    // q won't change even though clk posedge -- wrenable 0
    clk=1'b1; #5
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b0);


    // Zero register
    $display(" ");
    $display("Zero register");
    $display(" wrenable  clk |                 q                  |             expected q");

    // Initial condition
    // ...flip clock once to set initial q
    wrenable_z=1'b1; clk_z=1'b0; #5
    clk_z=1'b1; #5

    clk_z=1'b0; #5
    $display("    %b       %b  |  %b  |  %b", wrenable_z, clk_z, q_z, 32'b0);

    // q won't change even though clk posedge -- zero register
    clk_z=1'b1; #5
    $display("    %b       %b  |  %b  |  %b", wrenable_z, clk_z, q_z, 32'b0);

    $display(" ");
  end

endmodule
