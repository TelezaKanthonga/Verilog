// Set the timescale to 1ns/1ps
timescale 1ns/1ps

// Define a testbench module named "counter_tb"
module counter_tb;

// Define a local parameter named PERIOD and set its value to 2
localparam PERIOD = 2;

// Define input signals: clock (clk), reset (rst), and enable (enable)
reg clk = 0, rst, enable;

// Define an output signal: 4-bit binary value (out)
wire [3:0] out;

// Instantiate the counter module with the input and output signals
counter DUT (
  .clk(clk),
  .rst(rst),
  .enable(enable),
  .out(out)
);

// Define an always block to toggle the clock signal on each positive edge
// The clock period is PERIOD ns
always # (PERIOD/2) clk = ~clk;

// Define an initial block to set the values of the input signals and run the simulation
initial 
begin
  #2 rst = 1;        // Assert the reset signal after 2 ns
  #4 rst = 0;        // Release the reset signal after 4 ns
  #6 enable = 1;     // Enable the counter after 6 ns
  #20 enable = 0;    // Disable the counter after 20 ns
  #22 enable = 1;    // Enable the counter again after 22 ns
end

// Define another initial block to monitor the values of the input and output signals
// The simulation will run for 200 ns
initial
begin
  // Use $monitor to display the simulation time, the values of rst, enable, and out
  $monitor($time, "  rst=%b -- enable=%b -- out=%b", rst, enable, out);
  #200 $finish;      // Terminate the simulation after 200 ns
end

// End the testbench module
endmodule

