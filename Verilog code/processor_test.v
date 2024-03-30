module Processor_test();
    reg clk,reset;
	wire [31:0] pc,alu_result, ir_out,data,a_out,b_out,sp;
	wire [5:0] opcode;
	wire [1:0] pc_src;
	wire [2:0] state;
	wire [1:0] aluSrc1,aluSrc2,aluOp;
	wire ext_op,regWr1,regWr2,regSrc,memSrc1,memSrc2,memRd,memWr,wbData,pcWrite;
    // instantiate the module
processor test (clk,reset,pc_src,opcode,alu_result,state ,pc, ir_out,data,aluSrc1,aluSrc2,aluOp,ext_op,regWr1,regWr2,regSrc,memSrc1,memSrc2,memRd,memWr,wbData,pcWrite,a_out,b_out,sp);

    initial begin
        clk = 0;
        reset = 1;
        #30ns reset = 0;
		
    end

    always begin
        #20ns clk = ~clk;
    end

 initial begin
	    $monitor("Time = %0d pc_src = %b, opcode = %b , alu_result = %b, state= %d ,pc= %b ,ir_out = %b, data = %b ,aluSrc1 = %b aluSrc2 = %b ,aluOp = %b, ext_op =%b,regWr1 =%b,regWr2 =%b,regSrc =%b,memSrc1 = %b,memSrc2 = %b,memRd = %b,memWr = %b,wbData = %b,pcWrite = %b a_out = %b, b_out = %b, sp = %b \n",$time,pc_src,opcode, alu_result,state,pc,ir_out,data,aluSrc1,aluSrc2,aluOp,ext_op,regWr1,regWr2,regSrc,memSrc1,memSrc2,memRd,memWr,wbData,pcWrite,a_out,b_out,sp);
	end
endmodule  
	