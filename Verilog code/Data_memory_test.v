module Data_memory_test();
    reg clk;
    reg [31:0] addr;
    reg [31:0] data_in;
    reg MemRd;
    reg MemWr;
    wire [31:0] data_out;

    Data_memory dut (.clk(clk), .addr(addr),.data_in(data_in),.MemRd(MemRd),.MemWr(MemWr),.data_out(data_out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
	
    initial begin
        addr = 0;
        data_in = 0;
        MemRd = 0;
        MemWr = 0;

        #10ns;
        addr = 5;
        data_in = 0;
        MemRd = 1;
        MemWr = 0;
		#10ns
		$display("addr=%0d data_out=%0d",addr, data_out);
		
        $finish;
    end
  

endmodule
