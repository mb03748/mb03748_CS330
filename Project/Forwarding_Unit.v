module Forwarding_Unit
  (
  input [4:0] rs1,
  input [4:0] rs2,
  input [4:0] EXMEMrd, 
  input [4:0] MEMWBrd,
  input EXMEMregWrite,  input MEMWBregWrite,
  output reg [1:0] ForwardA,
  output reg [1:0] ForwardB 
  );
  
  always @ (*)
  begin
    //for rs1
    if (EXMEMregWrite && EXMEMrd != 5'b0 && EXMEMrd == rs1)
      begin
        ForwardA = 2'b10;
      end
      
    else if (MEMWBregWrite && MEMWBrd != 5'b0 && MEMWBrd == rs1)
      begin
       ForwardA = 2'b01;
      end 
    else 
      begin
      ForwardA = 2'b00; 
      end 
    
    //for rs2
    if (EXMEMregWrite && EXMEMrd != 5'b0 && EXMEMrd == rs2)
      begin
        ForwardB = 2'b10;
      end
      
    else if (MEMWBregWrite && MEMWBrd != 5'b0 && MEMWBrd == rs2)
      begin
       ForwardB = 2'b01;
      end 
    else 
      begin
      ForwardB = 2'b00; 
      end 
  end
endmodule
