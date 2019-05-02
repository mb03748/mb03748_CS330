module mux(a, b, sel, data_out);

  input [63:0] a;
  input [63:0] b;
  input sel;
  output reg [63:0] data_out;
  
  always@(sel or a or b)
  begin
    if (sel)
      data_out <= b;
    else
      data_out <= a;
  end
  
endmodule