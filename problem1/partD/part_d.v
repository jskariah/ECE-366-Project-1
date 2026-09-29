module four_bit_RCS (A, B, Cin, S, Cout);

input [3:0] A, B;
input Cin;
output [3:0] S;
output Cout;

wire [3:0] B_xor;

assign B_xor = B ^ {4{Cin}};

four_bit_RCA RCA0 (.A(A), .B(B_xor), .Cin(Cin), .S(S), .Cout(Cout));

endmodule
