module cont(control, op_code, func);
output reg [4:0]control;
input      [5:0]op_code, func;

always @(*)
begin
	case ({op_code, func})			//   alu rf dm mux im
		12'b0000_0010_0000: control<= 5'b01000;
		12'b0000_0010_0010: control<= 5'b11000;
		12'b0000_0000_0000: control<= 5'b01110;
		default:			control<= 5'b00000; 
		
	endcase
end
endmodule

module t_cont;
wire [4:0]control;
reg      [5:0]op_code, func;
cont t(control, op_code, func);
initial begin
		op_code = 6'b000000;	func = 6'b100000;
#100	op_code = 6'b000000;	func = 6'b100010;
#100	op_code = 6'b000000;	func = 6'b000000;

end

endmodule