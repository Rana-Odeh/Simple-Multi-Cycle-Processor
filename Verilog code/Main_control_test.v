				`timescale 1ns/1ns
module main_control_tb;
    reg [5:0] op;
    reg [2:0] stage;
    wire [1:0] aluOp,aluSrc1, aluSrc2;
    wire extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite;

    // Instantiate the main_control module
    main_control uut (.op(op),.stage(stage),.aluOp(aluOp),.aluSrc1(aluSrc1),.aluSrc2(aluSrc2),.extOp(extOp), .regWr1(regWr1), .regWr2(regWr2),
        .memSrc1(memSrc1),.memSrc2(memSrc2),.memRd(memRd), .memWr(memWr), .wbData(wbData), .regSrc(regSrc),
        .pcWrite(pcWrite)
    );


    initial begin  
		$display("------------------ADD--------------------") ;
        op = 6'b000001;	  // Add
        stage = 3'b001;
        #10;
        $display("Cycle 1 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b", aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);

      
        stage = 3'b010;
        #10;
        $display("Cycle 2 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);

        stage = 3'b011;
        #10;
        $display("Cycle 3 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc,  pcWrite);	  
		 stage = 3'b100;
        #10;
        $display("Cycle 4 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc,  pcWrite);	  
				
		 stage = 3'b101;
        #10;
        $display("Cycle 5 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);	  
				

		$display("------------------BEQ--------------------")  ;
		  op = 6'b001010;	 // beq
        stage = 3'b001;
        #10;
        $display("Cycle 1 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b", aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);

        stage = 3'b010;
        #10;
        $display("Cycle 2 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc,pcWrite);

     
        stage = 3'b011;
        #10;
        $display("Cycle 3 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);	  
		 stage = 3'b100;
        #10;
        $display("Cycle 4 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);	  
				
		 stage = 3'b101;
        #10;
        $display("Cycle 5 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);	  
		$display("------------------STORE--------------------")	;
		op = 6'b000111;	  // store
        stage = 3'b001;
        #10;
        $display("Cycle 1 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b", aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);

        stage = 3'b010;
        #10;
        $display("Cycle 2 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc,pcWrite);

        stage = 3'b011;
        #10;
        $display("Cycle 3 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);	  
		 stage = 3'b100;
        #10;
        $display("Cycle 4 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);	  
				
		 stage = 3'b101;
        #10;
        $display("Cycle 5 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);	
			$display("------------------PUSH--------------------");
		op = 6'b001111;	   // push
        stage = 3'b001;
        #10;
        $display("Cycle 1 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b", aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);

        stage = 3'b010;
        #10;
        $display("Cycle 2 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc,pcWrite);

        stage = 3'b011;
        #10;
        $display("Cycle 3 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);	  
		 stage = 3'b100;
        #10;
        $display("Cycle 4 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);	  
				
		 stage = 3'b101;
        #10;
        $display("Cycle 4 : aluOp=%b, aluSrc1=%b, aluSrc2=%b, extOp=%b, regWr1=%b, regWr2=%b, memSrc1=%b, memSrc2=%b, memRd=%b, memWr=%b, wbData=%b, regSrc=%b, pcWrite=%b",
            aluOp, aluSrc1, aluSrc2, extOp, regWr1, regWr2, memSrc1, memSrc2, memRd, memWr, wbData, regSrc, pcWrite);	
			
        $finish;
    end
endmodule