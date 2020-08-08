module reg_file(data1, data2, ,id1, id2, id3, data_in, En, clk);
output [31:0] data1, data2;
input  [31:0] data_in;
input  [4:0] id1, id2, id3;
input  clk, En;
reg [31:0]mem[31:0];
assign data1 = mem[id1];
assign data2 = mem[id2];  

always @(posedge clk)
begin
	if(En)	mem[id3] = data_in;
end
initial begin
mem[1] = 32'h1111_1111;
mem[2] = 32'h1111_1112;
mem[3] = 32'h1111_1113;
mem[4] = 32'h1111_1114;


end
endmodule

module t_reg_file;
wire [31:0] data1, data2;
reg  [31:0] data_in;
reg  [4:0] id1, id2, id3;
reg  clk, En;
reg [31:0]mem[31:0];
reg_file trf(data1, data2, ,id1, id2, id3, data_in, En, clk);
initial begin
	clk=0;
	forever #50	clk=~clk;
end

initial begin
	 id1 = 1; id2 = 2; id3 = 3;  data_in = 32'hffff_ffff;

end


endmodule 