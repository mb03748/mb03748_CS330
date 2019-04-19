module adder
  (
    input [63:0] a,
    input [63:0] b,
    output reg [63:0] c
  );
  
  always@(*)
  begin
    c = a + b;
  end
  
endmodule

