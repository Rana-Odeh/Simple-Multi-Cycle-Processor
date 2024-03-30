module Pc_control_test();
  reg [5:0] op;
  reg [2:0] flags;
  reg [2:0] state;
  wire [1:0] pc_src;

  pc_control pc_control_inst (.op(op),.flags(flags),.state(state),.pc_src(pc_src));

  // initialize signals
  initial begin
    op = 6'b0;
    flags = 3'b0;
    state = 3'b000;

    //branch case
    op = 6'b001010;
    flags = 3'b001;
    #10ns;
    $display("(branch)pc_src = %b", pc_src);

    // jump case
    op = 6'b001100;
    #10ns;
    $display("(jump)pc_src = %b", pc_src);

    //ret case
    op = 6'b001110;
    #10ns;
    $display("(ret)pc_src = %b", pc_src);

    // pc+1
    op = 6'b000000;
    state = 3'b001;
    #10ns;
    $display("(pc+1)pc_src = %b", pc_src);

    $finish; 
  end
endmodule
