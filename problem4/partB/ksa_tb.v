*



module tb_ksa;

  reg [15:0] A;
  reg [15:0] B;
  reg Cin;

  wire [15:0] S;
  wire Cout;

  ksa uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
  );

  
