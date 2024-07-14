`include "div.v"
`timescale 1ps/1ps
`define cycle 10.0
`define end_cycle 10000

module test;
reg clk = 0;
reg rst = 0;
wire out_clk;

integer i;

Divider_n_p5 M1(
    .clk(clk),
    .rst(rst),
    .out_clk(out_clk)
);


always begin #(`cycle/2) clk = ~clk; end


initial begin
    #1; rst = 1'b0;
    #(`cycle) rst = 1'b1;
    #(`cycle*3) rst = 1'b0;
end

initial begin
    $dumpfile("test.vcd");
    $dumpvars;
end

initial begin
    #`end_cycle; $finish;
end
endmodule 

