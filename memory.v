module data_memory(data_out, address,data_in, En, clk);
output [31:0]data_out;
input  [31:0]data_in;
input  [9:0] address;
input  clk, En;
reg [31:0]mem[1023:0];

assign data_out = mem[address];

always @(posedge clk)
begin
   if(En)  mem[address] <= data_in;
end
integer i = 0;
initial begin

for(i=0; i<1024; i=i+1)
	begin
		mem[i] = i*5;
	end

end
endmodule

module t_data_memory;
wire [31:0]data_out;
reg  [31:0]data_in;
reg  [9:0] address;
reg  clk, En;
reg [31:0]mem[1023:0];
data_memory t(data_out, address,data_in, En, clk);
initial begin
	clk=0;
	forever #50	clk=~clk;
end	
initial begin
	    address = 10'd5;	data_in = 32'hf0f0_f0f0;	En = 1'b0;
#100	address = 10'd5;	data_in = 32'hf0f0_f0f0;	En = 1'b1;
#100	address = 10'd5;	data_in = 32'h00ff_00ff;	En = 1'b0;
end

endmodule