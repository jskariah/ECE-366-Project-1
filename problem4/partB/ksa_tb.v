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

    // Case 1: Unsigned Addition
    A = 16'h1234; B = 16'h5678; Cin = 1'b0;
    #10;
    $display("%7t | %h | %h | %b | %h | %b | Unsigned Add", $time, A, B, Cin, S, Cout);

    // Case 2: Sign Addition
    A = 16'h0064; B = 16'hFFE7; Cin = 1'b0;
    #10;
    $display("%7t | %h | %h | %b | %h | %b | Signed Add (Neg Operand)", $time, A, B, Cin, S, Cout);

    // Case 3: MSB Carry-Out Generated
    A = 16'h8000; B = 16'h8000; Cin = 1'b0;
    #10;
    $display("%7t | %h | %h | %b | %h | %b | MSB Carry-Out Generated", $time, A, B, Cin, S, Cout);

    // Case 4: Full Multi-Bit Propagation (All 16 bits)
    A = 16'hFFFF; B = 16'h0000; Cin = 1'b0;
    #10;
    $display("%7t | %h | %h | %b | %h | %b | Multi-Bit Propagate (All 16 bits)", $time, A, B, Cin, S, Cout);

    // Case 5: Propagation across middle-to-upper bits
    A = 16'hFF00; B = 16'h0100; Cin= 1'b0;
    #10;
    $display("%7t | %h | %h | %b | %h | %b | Multi-Bit Propagarte (Bits 8-15)", $time, A, B, Cin, S, Cout);
    
             
  
