module one_bit_full_adder(A, B, Cin, S, Cout);

    input A, B, Cin;
    output S, Cout;

    wire xor1;
    wire and1;
    wire and2;
    wire and3;
    wire or1;

    xor(xor1, A, B); // xor1 = A XOR B
    xor(S, xor1, Cin); // S = xor1 XOR Cin

    and(and1, A, B); // and1 = A AND B
    and(and2, A, Cin); // and2 = A AND Cin
    and(and3, B, Cin); // and3 = B AND Cin

    or(or1, and1, and2); // or1 = and1 OR and2
    or(Cout, or1, and3); // or2 = or1 OR and3


endmodule