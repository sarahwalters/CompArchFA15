module multiplexer_testbench;
  // 32 to 1x1 mux
  wire out;
  reg[4:0] address;
  reg[31:0] inputs;
  mux32to1by1 m(out, address, inputs);

  // 32 to 1x32 mux
  wire[31:0] out_32;
  reg[4:0] address_32;
  reg[31:0] inputs_32[31:0];
  mux32to1by32 m_32(out_32, address_32, inputs_32[0], inputs_32[1], inputs_32[2], inputs_32[3], inputs_32[4], inputs_32[5], inputs_32[6], inputs_32[7], inputs_32[8], inputs_32[9], inputs_32[10], inputs_32[11], inputs_32[12], inputs_32[13], inputs_32[14], inputs_32[15], inputs_32[16], inputs_32[17], inputs_32[18], inputs_32[19], inputs_32[20], inputs_32[21], inputs_32[22], inputs_32[23], inputs_32[24], inputs_32[25], inputs_32[26], inputs_32[27], inputs_32[28], inputs_32[29], inputs_32[30], inputs_32[31]);

  integer i;

  initial begin
    $display(" ");
    $display("32 to 1x1 mux");
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
    $display("32 to 1x32 mux");
    $display("  addr  | out                              | expected out");

    // Initialize 32 to 1x32 inputs
    for (i = 0; i < 32; i = i + 1) begin
      inputs_32[i] = 32'b0;
    end

    address_32=4'b0000; inputs_32[0]=32'b1; #1000
    $display("  %b | %b | %b", address_32, out_32, 32'b1);

    address_32=4'b0100; #1000
    $display("  %b | %b | %b", address_32, out_32, 32'b0);

    inputs_32[0]=32'b0;
    address_32=4'b0001; inputs_32[1]=32'b1; #1000
    $display("  %b | %b | %b", address_32, out_32, 32'b1);

    address_32=4'b0100; #1000
    $display("  %b | %b | %b", address_32, out_32, 32'b0);

    $display(" ");

  end

endmodule
