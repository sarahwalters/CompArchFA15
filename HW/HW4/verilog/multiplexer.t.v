module multiplexer_testbench;
  wire out;
  reg[4:0]  address;
  reg[31:0] inputs;
  mux32to1by1 r(out, address, inputs);

  initial begin
    $display(" ");
    $display("  addr   inputs                            | out | expected out");
    address=4'b0000; inputs=32'b1; #1000
    $display("  %b  %b  |  %b  |  %b", address, inputs, out, 1'b1);

    address=4'b0100; inputs=32'b1; #1000
    $display("  %b  %b  |  %b  |  %b", address, inputs, out, 1'b0);

    address=4'b0001; inputs=32'b10; #1000
    $display("  %b  %b  |  %b  |  %b", address, inputs, out, 1'b1);

    address=4'b0100; inputs=32'b10; #1000
    $display("  %b  %b  |  %b  |  %b", address, inputs, out, 1'b0);

    $display(" ");

  end

endmodule
