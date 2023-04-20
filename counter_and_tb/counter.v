// This module is a simple counter that increments its output on each positive edge of the clock signal
// The output is reset to zero on a positive edge of the reset signal
// The counter can be enabled or disabled by the enable signal

module counter (
  input clk,      // Clock input signal
  input rst,      // Reset input signal
  input enable,   // Enable input signal
  output reg [3:0] out   // Output of the counter, a 4-bit binary value
);

  always @(posedge clk) // The always block executes on each positive edge of the clock signal
  begin
    if (rst)  // Reset the output to zero on a positive edge of the reset signal
      out <= 0;
    else if (enable)  // If the counter is enabled, increment the output by one
      out <= out + 1;
  end

endmodule

