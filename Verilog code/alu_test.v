module test_alu();
reg [31:0]AT, BT;
reg [1:0]op;
wire [31:0] resultT;
wire [2:0]flags;
alu test (AT,BT,op,resultT,flags);
initial
begin	
 $monitor("Time %0d opc=%h A=%h B=%h result==%h,Zero_flag ==%b,Carry_flag ==%b,Overflow_flag ==%b ",$time,op,AT,BT,resultT,flags[0],flags[1],flags[2]);
     op = 2'b00; AT = 32'h00000002; BT = 32'h00000003;  
     #5ns op = 2'b01; AT = 32'h00000001; BT = 32'h00000003; 
	 #5ns op = 2'b10; AT = 32'h00000001; BT = 32'h00000001; 

																			 
end
endmodule
