module mux4_1 (
  input  [31:0] in0, in1, in2,in3,
  input  [1:0] sel,
  output reg [31:0] out
);
 always @(*)begin
if (sel == 2'b00) 
    out = in0;
  else if (sel == 2'b01) 
    out = in1;
  else if (sel == 2'b10) 
    out = in2;
  else
	out = in3;
 end 
endmodule