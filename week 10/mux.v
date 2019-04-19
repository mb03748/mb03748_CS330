module mux
(
   input [63:0] a, 
   input [63:0] b,
   input sel,
   output reg [63: 0] data_out
   
);

     always @ (sel or a or b)
          begin
               case({sel})
                 1'b0: data_out <= a;
                 default : data_out <= b;
               endcase
          end
endmodule