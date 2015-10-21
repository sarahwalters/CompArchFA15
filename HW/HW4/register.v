module register
(
output reg[31:0] q,
input[31:0]	d,
input wrenable,
input	clk
);

    integer i;
    always @(posedge clk) begin
        if(wrenable) begin
          for (i = 0; i < 32; i = i + 1) begin
            q[i] = d[i];
          end
        end
    end

endmodule
