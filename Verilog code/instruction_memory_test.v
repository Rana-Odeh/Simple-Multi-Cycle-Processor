module instruction_memory_test();
  reg [31:0] addr;
  reg clk ;
  wire [31:0] out;

  instruction_memory dut (.clk(clk),.addr(addr), .out(out));

  initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
	

  initial begin
    addr = 0;
    $monitor("Instruction = %b", out);
    #10 addr = 0; 
    #10 addr = 1; 
    #10 addr = 2; 
    #10 addr = 3; 
    #10 addr = 4; 
    #10 addr = 5; 
    $finish;
  end

endmodule
