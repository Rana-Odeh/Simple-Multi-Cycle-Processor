module Data_memory (clk,addr,data_in,MemRd,MemWr,data_out);	 
	input clk;
    input  [31:0] addr;
    input  [31:0] data_in;
    input  MemRd;
    input  MemWr;
    output reg [31:0] data_out;
    reg [31:0] mem [0:1023];

    always @(posedge clk) begin
        if (MemWr) begin
            mem[addr] <= data_in;
        end
        else if (MemRd) begin
            data_out <= mem[addr];
        end
    end
    // Initialize memory with some random values
    initial begin
        integer i;
        for (i = 0; i < 1024; i = i + 1) begin
            mem[i] = i;
        end
    end
endmodule