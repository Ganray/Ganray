module Divider_n_p5(
input clk,
input rst,

output out_clk
);
reg n1, n2;
reg [1:0]div_cnt;

assign out_clk = n1 | n2;

always@(posedge clk)begin
	if(rst) div_cnt <= 2'd0;
	else if(div_cnt == 2'd2) div_cnt <= 2'd0;
	else div_cnt <= div_cnt + 1'b1;
end
always@(posedge clk)begin
	if(rst) n1 <= 1'b0;
	else if(div_cnt == 0 || div_cnt == 1) n1 <= ~n1;
	else n1 <= n1;
end
//=====================================================================
always@(negedge clk)begin
	if(rst) n2 <= 1'b0;
	else if(div_cnt == 0 || div_cnt == 2'd2) n2 <= ~n2;
	else n2 <= 1'b0;
end
endmodule