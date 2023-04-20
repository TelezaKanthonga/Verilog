module counter
(
  input clk,
  input rst,
  input enable,
  output reg [3:0] out
);

always @(posedge clk)
begin
  if (rst)
    out <= 0;
  else if (enable)
    out <= out + 1;
end