module immediate_extender_test();
    reg [15:0] in;
    reg op;
    wire [31:0] out;

    immediate_extender extender(in, op, out);

    initial begin
        in = 0;
        op = 0;
        #10ns;
        in = 16'b1011111011101111;
        op = 0;
        #10ns;
        $display("out = %b", out);
        #10ns;
        op = 1;
        #10ns;
        $display("out = %b",out);
        $finish;
    end
endmodule