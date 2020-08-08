module _ALU(out, in1, in2, control);
output reg [31:0]out;
input      [31:0]in1, in2;
input      [4:0] control;

always @(*)
begin
	case (control)
		5'b00000: out <= in1+in2;
		5'b00001: out <= in1-in2;
	endcase
end


endmodule

module t_ALU;
wire [31:0]out;
reg      [31:0]in1, in2;
reg      [4:0] control;
_ALU t(out, in1, in2, control);
initial begin
repeat(10)
begin
	#(100)	in1 = 32'd5;	in2 = 32'd7;	control = 5'b00000;
#(100)  in1 = 32'd7;	in2 = 32'd5;	control = 5'b00001;
end
end

endmodule