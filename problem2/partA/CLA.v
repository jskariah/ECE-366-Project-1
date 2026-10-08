module CLA(A, B, Cin, S, Cout);

input [31:0] A, B;
input Cin;

output [31:0] S;
output Cout;

wire c0, c4, c8, c12, c16, c20, c24, c28;
wire temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7;


CLA_carry CARRY0 (
    .A(A[3:0]),
    .B(B[3:0]),
    .Cin(Cin),
    .Cout(c4)
);

CLA_carry CARRY1 (
    .A(A[7:4]),
    .B(B[7:4]),
    .Cin(c4),
    .Cout(c8)
);

CLA_carry CARRY2 (
    .A(A[11:8]),
    .B(B[11:8]),
    .Cin(c8),
    .Cout(c12)
);

CLA_carry CARRY3 (
    .A(A[15:12]),
    .B(B[15:12]),
    .Cin(c12),
    .Cout(c16)
);

CLA_carry CARRY4 (
    .A(A[19:16]),
    .B(B[19:16]),
    .Cin(c16),
    .Cout(c20)
);

CLA_carry CARRY5 (
    .A(A[23:20]),
    .B(B[23:20]),
    .Cin(c20),
    .Cout(c24)
);

CLA_carry CARRY6 (
    .A(A[27:24]),
    .B(B[27:24]),
    .Cin(c24),
    .Cout(c28)
);

CLA_carry CARRY7 (
    .A(A[31:28]),
    .B(B[31:28]),
    .Cin(c28),
    .Cout(Cout)
);

four_bit_RCA RCA0 (
    .A(A[3:0]),
    .B(B[3:0]),
    .Cin(Cin),
    .S(S[3:0]),
    .Cout(temp0)
    );

four_bit_RCA RCA1 (
    .A(A[7:4]),
    .B(B[7:4]),
    .Cin(c4),
    .S(S[7:4]),
    .Cout(temp1)
    );

four_bit_RCA RCA2 (
    .A(A[11:8]),
    .B(B[11:8]),
    .Cin(c8),
    .S(S[11:8]),
    .Cout(temp2)
    );

four_bit_RCA RCA3 (
    .A(A[15:12]),
    .B(B[15:12]),
    .Cin(c12),
    .S(S[15:12]),
    .Cout(temp3)
    );

four_bit_RCA RCA4 (
    .A(A[19:16]),
    .B(B[19:16]),
    .Cin(c16),
    .S(S[19:16]),
    .Cout(temp4)
    );

four_bit_RCA RCA5 (.A(A[23:20]),
    .B(B[23:20]),
    .Cin(c20),
    .S(S[23:20]),
    .Cout(temp5)
    );

four_bit_RCA RCA6 (
    .A(A[27:24]),
    .B(B[27:24]),
    .Cin(c24),
    .S(S[27:24]),
    .Cout(temp6)
    );

four_bit_RCA RCA7 (
    .A(A[31:28]),
    .B(B[31:28]),
    .Cin(c28),
    .S(S[31:28]),
    .Cout(temp7)
    );


endmodule

module CLA_carry(A, B, Cin, Cout);

input [3:0] A, B;
input Cin;
output Cout;

wire P0, P1, P2, P3;
wire G0, G1, G2, G3;

wire t1, t2, t3;
wire t4, t5, t6;
wire Gblock;
wire Pblock;
wire carry_temp;


// Pi = Ai OR Bi
or(P0, A[0], B[0]);
or(P1, A[1], B[1]);
or(P2, A[2], B[2]);
or(P3, A[3], B[3]);

// Gi = Ai AND Bi
and(G0, A[0], B[0]);
and(G1, A[1], B[1]);
and(G2, A[2], B[2]);
and(G3, A[3], B[3]);


// Gblock = G3 + P3(G2 + P2(G1 + P1G0))

and(t1, P1, G0);
or(t2, G1, t1);

and(t3, P2, t2);
or(t4, G2, t3);

and(t5, P3, t4);
or(Gblock, G3, t5);


// Pblock = P3 P2 P1 P0

and(t6, P3, P2);

wire t7;

and(t7, P1, P0);
and(Pblock, t6, t7);


// Cout = Gblock + Pblock Cin

and(carry_temp, Pblock, Cin);
or(Cout, Gblock, carry_temp);

endmodule
