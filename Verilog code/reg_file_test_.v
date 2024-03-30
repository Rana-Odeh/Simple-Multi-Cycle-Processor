module reg_file_test();
    reg clk;
    reg [3:0] RA, RB, RWD;
    reg [31:0] WB1, WB2;
    reg RegWr1, RegWr2;
    wire [31:0] A, B;

 reg_file r1 (.clk(clk),.RA(RA),.RB(RB), .RWD(RWD), .WB1(WB1), .WB2(WB2), .RegWr1(RegWr1), .RegWr2(RegWr2), .A(A), .B(B));


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        RA = 4;
        RB = 2;
        RWD = 3;
        WB1 = 32'h12345678;
        WB2 = 32'hABCDEF01;
        RegWr1 = 1;
        RegWr2 = 1;
    	#10ns;
        $display("Test 1");
        $display("A = %h, B = %h", A, B);

        RA = 6;
        RB = 4;
        RWD = 5;
        WB1 = 32'h00000001;
        WB2 = 0;
        RegWr1 = 1;
        RegWr2 = 0;
        #10ns;
        $display("Test2");
        $display("A = %h, B = %h", A, B);

        $finish;
    end
endmodule
