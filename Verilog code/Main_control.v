module main_control(stage,op,aluOp,aluSrc1,aluSrc2,extOp,regWr1,regWr2,regSrc,memSrc1,memSrc2,memRd,memWr,wbData,pcWrite);
input [5:0] op;	
input [2:0]stage;	 //aluop
output reg [1:0] aluOp,aluSrc1,aluSrc2;
output reg extOp,regWr1,regWr2,memSrc1,memSrc2,memRd,memWr,wbData,regSrc,pcWrite;
//stage 1----------
assign pcWrite = (stage==3'b001);	  	  
assign extOp=((stage==3'b010 && ((op==6'b001000)||(op==6'b001001)|| (op==6'b001010) 
|| (op==6'b001011)))  || (stage==3'b011 && (op==6'b000100 || op==6'b000101 || op==6'b000110 || op==6'b000111  )) )  ;  //branch or addi	or lw or sw or lw poi
assign memRd= (stage==3'b100 && (op==6'b000101 || op==6'b000110 || op==6'b001110 || op==6'b010000));
assign memWr= (stage==3'b100 && (op==6'b000111 || op==6'b001101|| op==6'b001111 )); 
assign regWr1= (stage==3'b101 && (op==6'b000101 || op==6'b000110||op==6'b000000|| op==6'b000001|| op==6'b000010 || op==6'b000011|| op==6'b000100 ));	
assign regWr2= (stage==3'b101 && (op==6'b000110));
assign memSrc1=(stage==3'b100 && (op==6'b000101 || op==6'b000110|| op==6'b000111 )); 
assign memSrc2=(stage==3'b100 && (op==6'b001111 || op==6'b000111)); 
assign regSrc=(stage==3'b010 && (op==6'b001111 || op==6'b000111 || op==6'b001000||op==6'b001001|| op==6'b001010 || op==6'b001011  )); 
assign wbData= (stage == 3'b101 && (op==6'b000101 || op==6'b000110 || op==6'b010000 ));
always @(op,stage)begin
	if((stage == 3'b100 && op==6'b001101) || (stage == 3'b001 )|| 
		(stage == 3'b010 && (op==6'b001000||op==6'b001001|| op==6'b001010 || op==6'b001011 )) )
		   aluSrc1 = 2'b00;
	else if ((stage == 3'b100 && op==6'b000110) || stage == 3'b011 && (op==6'b000000 || op==6'b000001 || op==6'b000010 || 
		op==6'b000011 || op==6'b000100 || op==6'b000101 || op==6'b000110 ||  op==6'b000111 || op==6'b001000|| op==6'b001001 || op==6'b001010 || op==6'b001011 ))
		   aluSrc1=2'b01;  
	  else if (stage == 3'b011  && (op==6'b001101 || op==6'b001110 || op==6'b001111||op==6'b010000 ))
		  aluSrc1 = 2'b10;    
	end  
always @(op,stage)begin
	if((stage == 3'b001) || (stage == 3'b011 && (op==6'b001101 ||
		op==6'b001110 || op==6'b001111||op==6'b010000)) ||( stage == 3'b100 && op==6'b000110)) 
		   aluSrc2 = 2'b00;
	    else if (stage == 3'b011 && (op==6'b000000 || op==6'b000001 ||op==6'b000010 || op==6'b001000|| op==6'b001001 || op==6'b001010 || op==6'b001011))
		   aluSrc2=2'b01;  
	  else if ((stage == 3'b010 && (op==6'b001000||op==6'b001001||
		  op==6'b001010 || op==6'b001011))  || (stage == 3'b011 && (op==6'b000011||op==6'b000100|| op==6'b000101 || op==6'b000110 || op==6'b000111)) )
		  aluSrc2=2'b10;    
	end 
always @(op,stage)begin
	if((stage == 3'b001) || (stage == 3'b010 && (op==6'b001000 || 
		op==6'b001001 || op==6'b001010||op==6'b001011)) ||
		(stage == 3'b011 && (op==6'b000001 || op==6'b000011 ||
		op==6'b000101||op==6'b000110 ||op==6'b000111 ||op==6'b001101 ||op==6'b001111)) || (stage == 3'b100 && (op==6'b000110))) 
		   aluOp = 2'b00;
	    else if ((stage == 3'b011 && (op==6'b000010 || op==6'b001110 ||op==6'b010000 ||op==6'b001000|| op==6'b001001 || op==6'b001010 || op==6'b001011 )))
		   aluOp=2'b01;  
	  else if ((stage == 3'b011 && (op==6'b000000)))
		  aluOp=2'b10;    
	end   
		
endmodule