module PPA(A, B, Cin, S, Cout);

input [15 : 0] A, B
input Cin;
output [15 : 0] S;
output Cout;

GP_Block GP1 (P[1], G[1], P[0], G[0], P1_0, G1_0);
GP_Block GP2 (P[2], G[2], P[1], G[1], P2_1, G2_1);
GP_Block GP3 (P[3], G[3], P[2], G[2], P3_2, G3_2);
GP_Block GP4 (P[4], G[4], P[3], G[3], P4_3, G4_3);
GP_Block GP5 (P[5], G[5], P[4], G[4], P5_4, G5_4);
GP_Block GP6 (P[6], G[6], P[5], G[5], P6_5, G6_5);
GP_Block GP7 (P[7], G[7], P[6], G[6], P7_6, G7_6);
GP_Block GP8 (P[8], G[8], P[7], G[7], P8_7, G8_7);
GP_Block GP9

endmodule
