module tb_ksa;

  reg [31:0] A;
  reg [31:0] B;
  reg Cin;

  wire [31:0] S;
  wire Cout;

  ksa uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
  );

  
