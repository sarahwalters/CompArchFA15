module registertestbench;
  reg[31:0] d;
  reg wrenable, clk;
  wire[31:0] q;
  register r(q, d, wrenable, clk);

  initial begin
    // Initial conditions
    $display(" ");
    $display("Initial conditions");
    $display(" wrenable  clk                d                  |                 q                  |             Expected q");
    wrenable=1'b1; d=32'b0; clk=1'b0; #5
    clk=1'b1; #5 // trigger first clk posedge
    clk=1'b0; #5
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b0);

    // Write enabled cases
    $display(" ");
    $display("Write enabled cases");
    $display(" wrenable  clk                d                  |                 q                  |             Expected q");
    d=32'b1; #5 // won't change yet -- waiting for clk posedge
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b0);

    clk=1'b1; #5 // clk posedge
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b1);

    d=32'b0; clk=0'b0; #5 // won't change yet -- waiting for clk posedge
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b1);

    clk=1'b1; #5 // clk posedge
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b0);

    // Write disabled cases
    $display(" ");
    $display("Write disabled cases");
    $display(" wrenable  clk                d                  |                 q                  |             Expected q");
    wrenable=1'b0;
    d=32'b1; clk=1'b0; #5
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b0);

    clk=1'b1; #5 // Won't change even though clk posedge -- wrenable 0
    $display("    %b       %b  %b  |  %b  |  %b", wrenable, clk, d, q, 32'b0);

    $display(" ");
  end

endmodule
