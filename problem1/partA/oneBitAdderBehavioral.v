module one_bit_full_adder(A, B, Cin, S, Cout);

    input A, B, Cin;
    output S, Cout;

    assign S = A ^ B ^ Cin; // S = A XOR B XOR Cin
    assign Cout = (A & B) | (A & Cin) | (B & Cin); // Cout = (A AND B) OR (A AND Cin) OR (B AND Cin)

endmodule