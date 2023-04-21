//a testbench for a counterUpDown module
`timescale 1ns/1ps
module counter_tb;
localparam PERIOD=2;

reg clk=0, rst, enable, direction;
wire [6:0] out;

counterUpDown DUT (.clk(clk), .rst(rst),.enable(enable),.out(out), .direction(direction));

always #(PERIOD/2) clk=~clk;

initial 
begin
  #2 rst = 1;
  #4 rst = 0;
  #6 enable = 1;
     direction = 1;
  #20 enable = 0;
     direction = 0; 
  #22 enable = 1;
  #30 direction = 1'bx;
  #5  direction = 1'b1;  
end


initial
begin
  $monitor($time, "  rst=%b -- enable=%b --direction=%b -- out=%b", rst, enable,direction,out);
  #250 $finish;
end

endmodule

