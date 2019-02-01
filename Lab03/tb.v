module tb
(


);


   reg [63:0] x;
   reg [63:0] y;
   reg z;
   wire [63:0] try;
   
   mux m1
   (
       .a(x),
       .b(y),
       .sel(z),
       .data_out(try)
       
   );
    
    
    initial 
    begin
    x = 64'b0;
    y = 64'hff;
    z = 1'b0;
    end
    
    always
    begin
    #50 z = ~z;
    #15 x[0] = ~x[0];
    end
  
    initial
    $monitor("Time = ", $time, "---> Output = %d", try);

endmodule