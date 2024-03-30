module pc_control(state,op,flags,pc_src);
	input [5:0] op;
	input [2:0] flags;// [0]-->zero, [1]--> carry ,[2]-->overFlow.	
	input [2:0] state;
	output reg [1:0] pc_src	;
	wire branch, jump,ret,next;
	assign branch = ((op== 6'b001010 && flags[0]) || (op ==6'b 001011 && !flags[0])||
	(op == 6'b001000 && !flags[1]  && !flags[2])|| (op == 6'b001001 && flags[1] ) )	;
	assign jump = (op==6'b001100 ||op==6'b001101 ) ; //jump or call
	assign ret=(op==6'b001110) ;
	assign next = (state == 3'b001);
	
	always @(*)begin
	   if(branch) 
		   pc_src=2'b10;
	    else if (jump)
		   pc_src=2'b00;
	  else if (ret)
		 pc_src=2'b11;  
	   else 
		 pc_src=2'b01; 
	  
	end  
endmodule
