module PPA(A, B, Cin, S, Cout);

input [15 : 0] A, B;
input Cin;

output [15 : 0] S;
output Cout;

// Propogate and Generate
wire [15:0] P;
wire [15:0] G;

// The -1 input from the project
wire Pm1;
wire Gm1;

// P[-1] = 0, G[-1] = Cin
assign Pm1 = 1'b0;
assign Gm1 = Cin;

// Calculating the P and G signals
or(P[0],  A[0],  B[0]);
or(P[1],  A[1],  B[1]);
or(P[2],  A[2],  B[2]);
or(P[3],  A[3],  B[3]);
or(P[4],  A[4],  B[4]);
or(P[5],  A[5],  B[5]);
or(P[6],  A[6],  B[6]);
or(P[7],  A[7],  B[7]);
or(P[8],  A[8],  B[8]);
or(P[9],  A[9],  B[9]);
or(P[10], A[10], B[10]);
or(P[11], A[11], B[11]);
or(P[12], A[12], B[12]);
or(P[13], A[13], B[13]);
or(P[14], A[14], B[14]);
or(P[15], A[15], B[15]);


and(G[0],  A[0],  B[0]);
and(G[1],  A[1],  B[1]);
and(G[2],  A[2],  B[2]);
and(G[3],  A[3],  B[3]);
and(G[4],  A[4],  B[4]);
and(G[5],  A[5],  B[5]);
and(G[6],  A[6],  B[6]);
and(G[7],  A[7],  B[7]);
and(G[8],  A[8],  B[8]);
and(G[9],  A[9],  B[9]);
and(G[10], A[10], B[10]);
and(G[11], A[11], B[11]);
and(G[12], A[12], B[12]);
and(G[13], A[13], B[13]);
and(G[14], A[14], B[14]);
and(G[15], A[15], B[15]);

// First row of black boxes (fig. 3)

wire P14_13;
wire G14_13;

wire P12_11;
wire G12_11;

wire P10_9;
wire G10_9;

wire P8_7;
wire G8_7;

wire P6_5;
wire G6_5;

wire P4_3;
wire G4_3;

wire P2_1;
wire G2_1;

wire P0_m1;
wire G0_m1; 

// Prefix Level 1 --> Combines the neighboring bit groups (fig. 3)
GP_Block GP1  (P[14], G[14], P[13], G[13], P14_13, G14_13);
GP_Block GP2  (P[12], G[12], P[11], G[11], P12_11, G12_11);
GP_Block GP3  (P[10], G[10], P[9],  G[9],  P10_9,  G10_9);
GP_Block GP4  (P[8],  G[8],  P[7],  G[7],  P8_7,   G8_7);
GP_Block GP5  (P[6],  G[6],  P[5],  G[5],  P6_5,   G6_5);
GP_Block GP6  (P[4],  G[4],  P[3],  G[3],  P4_3,   G4_3);
GP_Block GP7  (P[2],  G[2],  P[1],  G[1],  P2_1,   G2_1);
GP_Block GP8  (P[0],  G[0],  Pm1,   Gm1,   P0_m1,  G0_m1);

wire P14_11;
wire G14_11;

wire P13_11;
wire G13_11;

wire P10_7;
wire G10_7;

wire P9_7;
wire G9_7;

wire P6_3;
wire G6_3;

wire P5_3;
wire G5_3;

wire P2_m1;
wire G2_m1;

wire P1_m1;
wire G1_m1;

//Prefix level 2 --> This combines the level 1 groups into larger ranges
GP_Block GP9  (P14_13, G14_13, P12_11, G12_11, P14_11, G14_11);
GP_Block GP10 (P[13],  G[13],  P12_11, G12_11, P13_11, G13_11);

GP_Block GP11 (P10_9, G10_9, P8_7, G8_7, P10_7, G10_7);
GP_Block GP12 (P[9],  G[9],  P8_7, G8_7, P9_7,  G9_7);

GP_Block GP13 (P6_5, G6_5, P4_3, G4_3, P6_3, G6_3);
GP_Block GP14 (P[5], G[5], P4_3, G4_3, P5_3, G5_3);

GP_Block GP15 (P2_1, G2_1, P0_m1, G0_m1, P2_m1, G2_m1);
GP_Block GP16 (P[1], G[1], P0_m1, G0_m1, P1_m1, G1_m1);

wire P14_7;
wire G14_7;

wire P13_7;
wire G13_7;

wire P12_7;
wire G12_7;

wire P11_7;
wire G11_7;

wire P6_m1;
wire G6_m1;

wire P5_m1;
wire G5_m1;

wire P4_m1;
wire G4_m1;

wire P3_m1;
wire G3_m1;

// Prefix level 3 --> This continues to combine the groups along towards the Cin input
GP_Block GP17 (P14_11, G14_11, P10_7, G10_7, P14_7, G14_7);
GP_Block GP18 (P13_11, G13_11, P10_7, G10_7, P13_7, G13_7);
GP_Block GP19 (P12_11, G12_11, P10_7, G10_7, P12_7, G12_7);
GP_Block GP20 (P[11],   G[11],   P10_7, G10_7, P11_7, G11_7);

GP_Block GP21 (P6_3, G6_3, P2_m1, G2_m1, P6_m1, G6_m1);
GP_Block GP22 (P5_3, G5_3, P2_m1, G2_m1, P5_m1, G5_m1);
GP_Block GP23 (P4_3, G4_3, P2_m1, G2_m1, P4_m1, G4_m1);
GP_Block GP24 (P[3], G[3], P2_m1, G2_m1, P3_m1, G3_m1);

wire P14_m1;
wire G14_m1;

wire P13_m1;
wire G13_m1;

wire P12_m1;
wire G12_m1;

wire P11_m1;
wire G11_m1;

wire P10_m1;
wire G10_m1;

wire P9_m1;
wire G9_m1;

wire P8_m1;
wire G8_m1;

wire P7_m1;
wire G7_m1;


// Prefix level 4 --> The final prefix groups that is used to determine the carry for each sum
GP_Block GP25 (P14_7, G14_7, P6_m1, G6_m1, P14_m1, G14_m1);
GP_Block GP26 (P13_7, G13_7, P6_m1, G6_m1, P13_m1, G13_m1);
GP_Block GP27 (P12_7, G12_7, P6_m1, G6_m1, P12_m1, G12_m1);
GP_Block GP28 (P11_7, G11_7, P6_m1, G6_m1, P11_m1, G11_m1);

GP_Block GP29 (P10_7, G10_7, P6_m1, G6_m1, P10_m1, G10_m1);
GP_Block GP30 (P9_7,  G9_7,  P6_m1, G6_m1, P9_m1,  G9_m1);
GP_Block GP31 (P8_7,  G8_7,  P6_m1, G6_m1, P8_m1,  G8_m1);
GP_Block GP32 (P[7],   G[7],   P6_m1, G6_m1, P7_m1,  G7_m1);

endmodule

// Gen & Propogate block --> combines the two P/G groups into a larger group
module GP_Block(Pik, Gik, Pkj, Gkj, Pij, Gij);

input Pik, Gik;
input Pkj, Gkj;

output Pij, Gij;

wire temp;

and(Pij, Pik, Pkj); // Pij = Pik AND Pkj

// Gij = Gik OR (Pik AND Gkj)
and(temp, Pik, Gkj);
or(Gij, Gik, temp);

endmodule
