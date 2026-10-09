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
GP_Block GP9 (P[9], G[9], P[8], G[8], P9_8, G9_8);
GP_Block GP10 (P[10], G[10], P[9], G[9], P10_9, G10_9);
GP_Block GP11 (P[11], G[11], P[10], G[10], P11_10, G11_10);
GP_Block GP12 (P[12], G[12], P[11], G[11], P12_11, G12_11);
GP_Block GP13 (P[13], G[13], P[12], G[12], P13_12, G13_12);
GP_Block GP14 (P[14], G[14], P[13], G[13], P14_13, G14_13);
GP_Block GP15 (P[15], G[15], P[14], G[14], P15_14, G15_14);
  

endmodule
