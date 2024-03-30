module reg_file(clk,RA,RB,RWD,A,B,RegWr1,RegWr2,WB1,WB2);
    input clk;
    input [3:0] RA, RB,RWD; 
    input [31:0] WB1,WB2;
    input RegWr1,RegWr2;
    output reg [31:0] A;
    output reg [31:0] B;
    reg [31:0] registers [0:15];

    always @(posedge clk) begin
        if (RegWr1) begin
            registers[RWD] <= WB1;
        end	
		if (RegWr2) begin
            registers[RA] <= WB2;
        end
        A = registers[RA];
        B = registers[RB];
    end	  
	// Initial values for the registers
	 initial begin
        registers[0] = 32'h00000000;
        registers[1] = 32'h00000001;
        registers[2] = 32'h00000002;
        registers[3] = 32'h00000003;
        registers[4] = 32'h00000004;
        registers[5] = 32'h00000005;
        registers[6] = 32'h00000006;
        registers[7] = 32'h00000007;
        registers[8] = 32'h00000008;
        registers[9] = 32'h00000009;
        registers[10] = 32'h0000000A;
    end
    
endmodule