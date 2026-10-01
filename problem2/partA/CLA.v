module CLA(A, B, Cin, S, Cout);

input [31:0] A, B;
input Cin;
output [31:0] S;
output Cout;

four_bit_RCA RCA0 (.A(A[3:0]), .B(B[3:0]), .Cin(C0), .S(S[3:0]);, .Cout(C4));
four_bit_RCA RCA1 (.A(A[7:4]), .B(B[7:4]), .Cin(C4), .S(S[7:4]); .Cout(C8));
four_bit_RCA RCA2 (.A(A[11:8]), .B(B[11:8]), .Cin(C8), .S(S[11:8]); .Cout(C12));
four_bit RCA RCA3 (.A(A[15:12]), .B(B[15:12]), .Cin(C12), .S(S[15:12]); .Cout(C16));
four_bit RCA RCA4 (.A(A[19:16]), .B(B[19:16]), .Cin(C16), .S(S[19:16]); .Cout(C20));
four_bit RCA RCA5 (.A(A[23:20]), .B(B[23:20]), .Cin(C20), .S(S[23:20]); .Cout(C24));
four_bit RCA RCA6 (.A(A[27:24]), .B(B[27:24]), .Cin(C24), .S(S[27:24]); .Cout(C28));
four_bit RCA RCA7 (.A(A[31:28]), .B(B[31:28]), .Cin(C28), .S(S[31:28]); .Cout(C32));



  


endmodule
