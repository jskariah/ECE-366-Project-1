`timescale 1ns / 1ps

module tb_four_bit_RCA_RCS;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs
    wire [3:0] S;
    wire Cout;

    // Instantiation
    four_bit_RCS uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_four_bit_RCA_RCS);

        $display("---------------------------------------------------------------");
      $display("Time  | A     B    Cin | S    Cout | Description");
        $display("---------------------------------------------------------------");

        // Case 1: Unsigned Addition (3 + 4 = 7, Cout = 0)
        // Cin = 0 sets mode to addition
        A = 4'b0011; B = 4'b0100; Cin = 1'b0;
        #10;
        $display("%4t | %b  %b  %b  | %b  %b   | Unsigned Add: 3 + 4 = %0d", $time, A, B, Cin, S, Cout, S);

        // Case 2: Unsigned Subtraction (9 - 2 = 7)
        // Cin = 1 sets mode to subtraction
        A = 4'b1001; B = 4'b0010; Cin = 1'b1;
        #10;
        $display("%4t | %b  %b  %b  | %b  %b   | Unsigned Sub: 9 - 2 = %0d", $time, A, B, Cin, S, Cout, S);

        // Case 3: Signed Addition with Negative Number (5 + (-2) = 3)
        // 5 = 4'b0101, -2 = 4'b1110; Cin = 0
        A = 4'b0101; B = 4'b1110; Cin = 1'b0;
        #10;
        $display("%4t | %b  %b  %b  | %b  %b   | Signed Add: 5 + (-2) = %0d", $time, A, B, Cin, S, Cout, $signed(S));

        // Case 4: Signed Subtraction with Negative Number (2 - (-3) = 5)
        // 2 = 4'b0010, -3 = 4'b1101; Cin = 1 sets subtraction mode
        A = 4'b0010; B = 4'b1101; Cin = 1'b1;
        #10;
        $display("%4t | %b  %b  %b  | %b  %b   | Signed Sub: 2 - (-3) = %0d", $time, A, B, Cin, S, Cout, $signed(S));

        // Case 5: Operation producing a Carry-Out (12 + 7 = 19 -> S=3, Cout=1)
        A = 4'b1100; B = 4'b0111; Cin = 1'b0;
        #10;
        $display("%4t | %b  %b  %b  | %b  %b   | Carry-Out Case: 12 + 7 = Sum %0d, Cout %b", $time, A, B, Cin, S, Cout, S, Cout);

        $display("---------------------------------------------------------------");
        #10;
        $finish;
    end

endmodule