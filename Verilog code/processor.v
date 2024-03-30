//This is a Verilog code for a multicycle MIPS processor that can execute a subset of the MIPS instruction set.
module processor(clk,reset,pc_src,opcode,alu_result,state ,pc, ir_out,data,aluSrc1,aluSrc2,aluOp,ext_op,regWr1,regWr2,regSrc,memSrc1,memSrc2,memRd,memWr,wbData,pcWrite,a_out,b_out,sp);
	input clk,reset;
    output reg [2:0] state; // state variable
	output reg [5:0] opcode; // opcode
	output reg [31:0] pc; // program counter 
	output reg [31:0]alu_result; 
    output reg [31:0] a_out; // first operand output
    output reg [31:0] b_out; // second operand output	
	output reg [31:0] data; // data to be written back to register file
	output reg [31:0] ir_out; 
	output reg [1:0] pc_src; // pc source	
    output reg regSrc; // register source
    output reg regWr1,regWr2; // register write
    output reg ext_op; // extend operation
    output reg [1:0] aluSrc1,aluSrc2,aluOp; // alu sources and opration
    output reg memRd; // memory read
    output reg memWr; // memory write
    output reg wbData; // write back source
	output reg memSrc1,memSrc2; // addr,data_in source
	output reg pcWrite;	
	output reg [31:0] sp; // stack pointer
	
    reg [2:0] next_state; // next state variable
    reg [31:0] next_pc; // next program counter
	reg [31:0] out_pc;
    reg [31:0] JA; // jump and call address 
    // define the ir fields 
    reg [3:0] rs1; // rs
    reg [3:0] rs2; // rt
    reg [3:0] rd; // rd
    reg [15:0] immediate; // immediate 
	reg  [25:0] imm26;
	
	reg[31:0] WB1,WB2;
	reg [2:0]flags; // zero signal
	
	wire [31:0] extended_immediate; //extended immediate
	wire [31:0] ir; // instruction register
    wire [31:0] a; // first operand
    wire [31:0] b; // second operand
    wire [31:0] alu_out; // output of ALU
    wire [31:0] RA; // return address
    wire next_sp = 0; // next stack pointer	
	wire [31:0]result1,result2;
	wire [31:0]address,data_in,data_out;
	
	//R-type
	parameter AND = 6'b000000;
    parameter ADD = 6'b000001;
    parameter SUB = 6'b000010;
    // I type
    parameter ANDI = 6'b000011;
    parameter ADDI = 6'b000100;
    parameter LW = 6'b000101;
	parameter LW_POI = 6'b000110;
    parameter SW = 6'b000111;
	parameter BGT = 6'b001000;
	parameter BLT = 6'b001001;
	parameter BEQ = 6'b001010;
    parameter BNE = 6'b001011;
	// J type 
    parameter JMP = 6'b001100;
    parameter CALL = 6'b001101;
	parameter RET = 6'b001110;
    // S-type
    parameter PUSH = 6'b001111;
	parameter POP = 6'b010000;

    // define the states
    parameter IF = 3'b001;
    parameter ID = 3'b010;
    parameter EX = 3'b011;
    parameter MEM = 3'b100;
    parameter WB = 3'b101;
	
	assign JA = {pc[31:28],imm26};
    
	mux4_1 PC_Src (JA,alu_out,alu_result,data,pc_src,out_pc);	
	
    instruction_memory C1(clk,pc,ir); 
	
	reg_file C2 (clk,rs1,rs2,rd,a,b,regWr1,regWr2,WB1,WB2);
	
	main_control C3 (state,opcode,aluOp,aluSrc1,aluSrc2,ext_op,regWr1,regWr2,regSrc,memSrc1,memSrc2,memRd,memWr,wbData,pcWrite);
	
	pc_control C4 (state,opcode,flags,pc_src); 

	mux4_1 a_src (pc,a_out,sp,32'b0,aluSrc1, result1); 
	
	extender imm (immediate,ext_op,extended_immediate)	;
	
	mux4_1 b_srs (32'd1, b_out,extended_immediate,32'b0,aluSrc2,result2);  
	
	alu C5 (result1,result2,aluOp,alu_out,flags);
	
	mux2_1 addSrc (sp,alu_out,memSrc1,address);	
	
	mux2_1 dataSrc (b_out,alu_out,memSrc2,data_in);	 
	
	Data_memory C6 (clk,address,data_in,memRd,memWr,data_out);
	
	mux2_1 writeBack (alu_result,data,wbData,WB1); 
	
	 always @(posedge clk or posedge reset) begin
        if(reset) begin
            next_state = IF;
            // reset all the registers
            data = 32'h0;
            alu_result =32'h0;
			a_out=32'h0;
			b_out=32'h0;
			next_pc=32'h0;
			opcode = 6'b0;	
		    rd = 4'b0;
            rs1 = 4'b0;
            rs2 = 4'b0;
            immediate = 16'b0;
			sp =32'b0;
          
        end	
		//// The processor has five stages: IF (instruction fetch), ID (instruction decode), EX (execute), MEM (memory access), and WB (write back).
        else begin
			state <= next_state; 
            case(state)
            IF: begin  
				if (pcWrite)begin  
					pc <= next_pc; 	
					ir_out <= ir;
				end		
				
            end
            ID: begin
			  next_pc <= out_pc;	
                opcode = ir[31:26];	
			  rd = ir[25:22];
                rs1 = ir[21:18];
                rs2 = ir[17:14];
                immediate = ir[17:2];
				imm26 = ir[25:0];
				
			  #2;
			  if (opcode == BGT||opcode == BLT) 	begin
                   a_out = b;
                   b_out = a; 
					end
			  else 	 begin
                a_out = a;
                b_out = b;
				end
            end
            EX: begin 
				
              	alu_result=alu_out;
                end
            MEM: begin
               data= data_out;    
            end
            WB: begin
				WB2 = alu_result;
            end
        endcase 

        case(state)
            IF: begin 
                next_state = ID;
            end
            ID: begin
                if (opcode == JMP) begin 
					next_state = IF;
                end
                else begin
                    next_state = EX;
                end
            end
            EX: begin
                if (opcode == ADD ||opcode == ADDI || opcode == AND||opcode == ANDI|| opcode == SUB ) 

                       next_state = WB; 
                    
				else if(opcode == BEQ ||opcode == BNE || opcode == BGT||opcode == BLT) 	begin
                    next_state = IF; 
					end
                   
					else 
					 next_state = MEM;	
                end
            MEM: begin
                if (opcode == LW || opcode==LW_POI) begin
                    next_state = WB;
                end
			else begin	
				next_state = IF;
                end
            end
            WB: begin
                next_state = IF;  
				
            end
        endcase 
       
        end
    end
endmodule