module extender (in,op,out);
    input [15:0] in;
    input op;
    output reg [31:0] out; 
	
    always @(*) begin
        case (op)
            1'b0: out = {18'b0, in[13:0]}; // unsigned 
            1'b1: out = {{18{in[13]}}, in[13:0]}; // signed 
        endcase
    end
endmodule
