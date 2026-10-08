module CLA_tb;

reg [31:0] A, B;
reg Cin;

wire [31:0] S;
wire Cout;


// Unit under test
CLA uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
);


initial begin

    // Used for waveform viewing
    $dumpfile("CLA.vcd");
    $dumpvars(0, CLA_tb);


    // Test 1: Simple unsigned addition
    // 10 + 5 = 15
    A = 32'd10;
    B = 32'd5;
    Cin = 0;
    #10;

    $display("Test 1: A=%h B=%h Cin=%b S=%h Cout=%b",
             A, B, Cin, S, Cout);


    // Test 2: Another unsigned addition
    // 100 + 200 = 300
    A = 32'd100;
    B = 32'd200;
    Cin = 0;
    #10;

    $display("Test 2: A=%h B=%h Cin=%b S=%h Cout=%b",
             A, B, Cin, S, Cout);


    // Test 3: Signed addition with negative operand
    // -5 + 3 = -2
    A = 32'hFFFFFFFB;
    B = 32'd3;
    Cin = 0;
    #10;

    $display("Test 3: A=%h B=%h Cin=%b S=%h Cout=%b",
             A, B, Cin, S, Cout);


    // Test 4: Carry-out
    // FFFFFFFF + 1 = 00000000, Cout = 1
    A = 32'hFFFFFFFF;
    B = 32'h00000001;
    Cin = 0;
    #10;

    $display("Test 4: A=%h B=%h Cin=%b S=%h Cout=%b",
             A, B, Cin, S, Cout);


    // Test 5: Carry propagation across multiple 4-bit blocks
    // 0000FFFF + 1 = 00010000
    //
    // Carry must propagate through:
    // bits 3:0
    // bits 7:4
    // bits 11:8
    // bits 15:12
    A = 32'h0000FFFF;
    B = 32'h00000001;
    Cin = 0;
    #10;

    $display("Test 5: A=%h B=%h Cin=%b S=%h Cout=%b",
             A, B, Cin, S, Cout);


    // Test 6: Test Cin
    // F + 0 + 1 = 10
    A = 32'h0000000F;
    B = 32'h00000000;
    Cin = 1;
    #10;

    $display("Test 6: A=%h B=%h Cin=%b S=%h Cout=%b",
             A, B, Cin, S, Cout);


    $finish;

end

endmodule