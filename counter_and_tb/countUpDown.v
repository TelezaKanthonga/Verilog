//This is a Verilog module for a simple up/down counter with a 7-bit output.
// The counter increments or decrements based on the direction input and is enabled by the enable input.
//  The reset input sets the output to 0.
module counterUpDown
(
 input clk,
 input rst,

 input enable,
 input direction,

 output reg [6:0] out
);

always@(posedge clk)
begin
  if(rst)
      out <= 0;
  else
   begin
     if(enable)
      begin
        if(direction)  
     	    out <= out + 1;
        else 
	 if(!direction)
	    out <= out - 1;	 
      end
   end
end

endmodule


