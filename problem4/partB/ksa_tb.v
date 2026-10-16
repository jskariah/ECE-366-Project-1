'timescale 1ns / 1ps

module tb_ksa;
  
  // 16-bit testbench registers and wires
  reg [15:0] A;
  reg [15:0] B;
  reg Cin;

  wire [15:0] S;
  wire Cout;
  
  // Instantiate 16-bit Kogee-Stone(KS) Adder
  ksa uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_ksa);

    $display("==========================================================================================");
    $display("Time   | A       |B       | Cin | S        | Cout | Description");
    $display("==========================================================================================");

    // Case 1: 
  
