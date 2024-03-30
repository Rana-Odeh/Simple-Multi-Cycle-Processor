// alu module
module alu(a,b,op,result,flags);
    input [31:0] a,b;
    input [1:0] op;
    output reg [31:0] result;
	output reg [2:0]flags;
    always @(*) begin
        case (op)
            2'b00:result = a + b;
            2'b01: begin 
                result = a - b;
                flags[2] = (a[31] ^ b[31]) & (a[31] ^ result[31]); // Overflow 
                flags[1]= (a < b); // Carry 
            end
            2'b10:result = a & b;
        endcase
		if (result == 32'b0 )
			flags[0]=1; // Zero 
		else
			 flags[0]=0;
    end
endmodule