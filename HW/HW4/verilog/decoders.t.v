module decoder_testbench;
  wire[31:0] out;
  reg enable;
  reg[4:0] address;
  decoder1to32 d(out, enable, address);

  initial begin
    // Enabled cases
    $display(" ");
    $display("Enabled cases");
    enable=1'b1;

    address=5'b00000; #1000
    $display("  %b  |  %b", out, 32'b1);

    address=5'b00001; #1000
    $display("  %b  |  %b", out, 32'b10);

    // Non-enabled cases
    $display(" ");
    $display("Non-enabled cases");
    enable=1'b0;

    address=5'b00000; #1000
    $display("  %b  |  %b", out, 32'b0);

    address=5'b00001; #1000
    $display("  %b  |  %b", out, 32'b0);

    $display(" ");

  end

endmodule
