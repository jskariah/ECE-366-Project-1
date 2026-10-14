// Extra credit attempt

module KS(A, B, Cin, S, Cout);

input [15:0] A, B;
input Cin;

output [15:0] S;
output Cout;


// Index 0 represents the special "-1" input (Cin)
// Index 1 represents bit 0, index 2 represents bit 1
// following the pattern until index 16 represents bit 15

wire [16:0] P0;
wire [16:0] G0;

assign P0[0] = 1'b0;
assign G0[0] = Cin;


// Pi = Ai XOR Bi
xor(P0[1],  A[0],  B[0]);
xor(P0[2],  A[1],  B[1]);
xor(P0[3],  A[2],  B[2]);
xor(P0[4],  A[3],  B[3]);
xor(P0[5],  A[4],  B[4]);
xor(P0[6],  A[5],  B[5]);
xor(P0[7],  A[6],  B[6]);
xor(P0[8],  A[7],  B[7]);
xor(P0[9],  A[8],  B[8]);
xor(P0[10], A[9],  B[9]);
xor(P0[11], A[10], B[10]);
xor(P0[12], A[11], B[11]);
xor(P0[13], A[12], B[12]);
xor(P0[14], A[13], B[13]);
xor(P0[15], A[14], B[14]);
xor(P0[16], A[15], B[15]);


// Gi = Ai AND Bi
and(G0[1],  A[0],  B[0]);
and(G0[2],  A[1],  B[1]);
and(G0[3],  A[2],  B[2]);
and(G0[4],  A[3],  B[3]);
and(G0[5],  A[4],  B[4]);
and(G0[6],  A[5],  B[5]);
and(G0[7],  A[6],  B[6]);
and(G0[8],  A[7],  B[7]);
and(G0[9],  A[8],  B[8]);
and(G0[10], A[9],  B[9]);
and(G0[11], A[10], B[10]);
and(G0[12], A[11], B[11]);
and(G0[13], A[12], B[12]);
and(G0[14], A[13], B[13]);
and(G0[15], A[14], B[14]);
and(G0[16], A[15], B[15]);

// Prefix Level 1, Distance = 1

wire [16:0] P1;
wire [16:0] G1;

assign P1[0] = P0[0];
assign G1[0] = G0[0];

KS_Block L1_1  (P0[1],  G0[1],  P0[0],  G0[0],  P1[1],  G1[1]);
KS_Block L1_2  (P0[2],  G0[2],  P0[1],  G0[1],  P1[2],  G1[2]);
KS_Block L1_3  (P0[3],  G0[3],  P0[2],  G0[2],  P1[3],  G1[3]);
KS_Block L1_4  (P0[4],  G0[4],  P0[3],  G0[3],  P1[4],  G1[4]);
KS_Block L1_5  (P0[5],  G0[5],  P0[4],  G0[4],  P1[5],  G1[5]);
KS_Block L1_6  (P0[6],  G0[6],  P0[5],  G0[5],  P1[6],  G1[6]);
KS_Block L1_7  (P0[7],  G0[7],  P0[6],  G0[6],  P1[7],  G1[7]);
KS_Block L1_8  (P0[8],  G0[8],  P0[7],  G0[7],  P1[8],  G1[8]);
KS_Block L1_9  (P0[9],  G0[9],  P0[8],  G0[8],  P1[9],  G1[9]);
KS_Block L1_10 (P0[10], G0[10], P0[9],  G0[9],  P1[10], G1[10]);
KS_Block L1_11 (P0[11], G0[11], P0[10], G0[10], P1[11], G1[11]);
KS_Block L1_12 (P0[12], G0[12], P0[11], G0[11], P1[12], G1[12]);
KS_Block L1_13 (P0[13], G0[13], P0[12], G0[12], P1[13], G1[13]);
KS_Block L1_14 (P0[14], G0[14], P0[13], G0[13], P1[14], G1[14]);
KS_Block L1_15 (P0[15], G0[15], P0[14], G0[14], P1[15], G1[15]);
KS_Block L1_16 (P0[16], G0[16], P0[15], G0[15], P1[16], G1[16]);


// Prefix Level 2, Distance = 2

wire [16:0] P2;
wire [16:0] G2;

assign P2[0] = P1[0];
assign G2[0] = G1[0];

assign P2[1] = P1[1];
assign G2[1] = G1[1];

KS_Block L2_2  (P1[2],  G1[2],  P1[0],  G1[0],  P2[2],  G2[2]);
KS_Block L2_3  (P1[3],  G1[3],  P1[1],  G1[1],  P2[3],  G2[3]);
KS_Block L2_4  (P1[4],  G1[4],  P1[2],  G1[2],  P2[4],  G2[4]);
KS_Block L2_5  (P1[5],  G1[5],  P1[3],  G1[3],  P2[5],  G2[5]);
KS_Block L2_6  (P1[6],  G1[6],  P1[4],  G1[4],  P2[6],  G2[6]);
KS_Block L2_7  (P1[7],  G1[7],  P1[5],  G1[5],  P2[7],  G2[7]);
KS_Block L2_8  (P1[8],  G1[8],  P1[6],  G1[6],  P2[8],  G2[8]);
KS_Block L2_9  (P1[9],  G1[9],  P1[7],  G1[7],  P2[9],  G2[9]);
KS_Block L2_10 (P1[10], G1[10], P1[8],  G1[8],  P2[10], G2[10]);
KS_Block L2_11 (P1[11], G1[11], P1[9],  G1[9],  P2[11], G2[11]);
KS_Block L2_12 (P1[12], G1[12], P1[10], G1[10], P2[12], G2[12]);
KS_Block L2_13 (P1[13], G1[13], P1[11], G1[11], P2[13], G2[13]);
KS_Block L2_14 (P1[14], G1[14], P1[12], G1[12], P2[14], G2[14]);
KS_Block L2_15 (P1[15], G1[15], P1[13], G1[13], P2[15], G2[15]);
KS_Block L2_16 (P1[16], G1[16], P1[14], G1[14], P2[16], G2[16]);

// Prefix Level 3, Distance = 4

wire [16:0] P3;
wire [16:0] G3;

assign P3[0] = P2[0];
assign G3[0] = G2[0];
assign P3[1] = P2[1];
assign G3[1] = G2[1];
assign P3[2] = P2[2];
assign G3[2] = G2[2];
assign P3[3] = P2[3];
assign G3[3] = G2[3];

KS_Block L3_4  (P2[4],  G2[4],  P2[0],  G2[0],  P3[4],  G3[4]);
KS_Block L3_5  (P2[5],  G2[5],  P2[1],  G2[1],  P3[5],  G3[5]);
KS_Block L3_6  (P2[6],  G2[6],  P2[2],  G2[2],  P3[6],  G3[6]);
KS_Block L3_7  (P2[7],  G2[7],  P2[3],  G2[3],  P3[7],  G3[7]);
KS_Block L3_8  (P2[8],  G2[8],  P2[4],  G2[4],  P3[8],  G3[8]);
KS_Block L3_9  (P2[9],  G2[9],  P2[5],  G2[5],  P3[9],  G3[9]);
KS_Block L3_10 (P2[10], G2[10], P2[6],  G2[6],  P3[10], G3[10]);
KS_Block L3_11 (P2[11], G2[11], P2[7],  G2[7],  P3[11], G3[11]);
KS_Block L3_12 (P2[12], G2[12], P2[8],  G2[8],  P3[12], G3[12]);
KS_Block L3_13 (P2[13], G2[13], P2[9],  G2[9],  P3[13], G3[13]);
KS_Block L3_14 (P2[14], G2[14], P2[10], G2[10], P3[14], G3[14]);
KS_Block L3_15 (P2[15], G2[15], P2[11], G2[11], P3[15], G3[15]);
KS_Block L3_16 (P2[16], G2[16], P2[12], G2[12], P3[16], G3[16]);

// Prefix Level 4, Distance = 8

wire [16:0] P4;
wire [16:0] G4;

assign P4[0] = P3[0];
assign G4[0] = G3[0];
assign P4[1] = P3[1];
assign G4[1] = G3[1];
assign P4[2] = P3[2];
assign G4[2] = G3[2];
assign P4[3] = P3[3];
assign G4[3] = G3[3];
assign P4[4] = P3[4];
assign G4[4] = G3[4];
assign P4[5] = P3[5];
assign G4[5] = G3[5];
assign P4[6] = P3[6];
assign G4[6] = G3[6];
assign P4[7] = P3[7];
assign G4[7] = G3[7];

KS_Block L4_8  (P3[8],  G3[8],  P3[0], G3[0], P4[8],  G4[8]);
KS_Block L4_9  (P3[9],  G3[9],  P3[1], G3[1], P4[9],  G4[9]);
KS_Block L4_10 (P3[10], G3[10], P3[2], G3[2], P4[10], G4[10]);
KS_Block L4_11 (P3[11], G3[11], P3[3], G3[3], P4[11], G4[11]);
KS_Block L4_12 (P3[12], G3[12], P3[4], G3[4], P4[12], G4[12]);
KS_Block L4_13 (P3[13], G3[13], P3[5], G3[5], P4[13], G4[13]);
KS_Block L4_14 (P3[14], G3[14], P3[6], G3[6], P4[14], G4[14]);
KS_Block L4_15 (P3[15], G3[15], P3[7], G3[7], P4[15], G4[15]);
KS_Block L4_16 (P3[16], G3[16], P3[8], G3[8], P4[16], G4[16]);

// Post-computation --> G4[i] gives the carry into the corresponding bit

xor(S[0],  P0[1],  G4[0]);
xor(S[1],  P0[2],  G4[1]);
xor(S[2],  P0[3],  G4[2]);
xor(S[3],  P0[4],  G4[3]);
xor(S[4],  P0[5],  G4[4]);
xor(S[5],  P0[6],  G4[5]);
xor(S[6],  P0[7],  G4[6]);
xor(S[7],  P0[8],  G4[7]);
xor(S[8],  P0[9],  G4[8]);
xor(S[9],  P0[10], G4[9]);
xor(S[10], P0[11], G4[10]);
xor(S[11], P0[12], G4[11]);
xor(S[12], P0[13], G4[12]);
xor(S[13], P0[14], G4[13]);
xor(S[14], P0[15], G4[14]);
xor(S[15], P0[16], G4[15]);

assign Cout = G4[16];

endmodule

// Kogge-Stone Prefix Block

module KS_Block(Phigh, Ghigh, Plow, Glow, Pout, Gout);

input Phigh, Ghigh;
input Plow, Glow;

output Pout, Gout;

wire temp;

and(Pout, Phigh, Plow); // Pout = Phigh AND Plow

// Gout = Ghigh OR (Phigh AND Glow)
and(temp, Phigh, Glow);
or(Gout, Ghigh, temp);

endmodule
