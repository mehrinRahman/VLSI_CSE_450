library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity One_bit is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end One_bit;

architecture Structural of One_bit is

    component NOR_GATE
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal n1, n2, n3, n4 : STD_LOGIC;
    signal n5, n6, n7, n8 : STD_LOGIC;
    signal n9, n10, n11 : STD_LOGIC;
    signal n12, n13, n14 : STD_LOGIC;
    signal n15, n16 : STD_LOGIC;

begin

    -- First part: A and B
    G1: NOR_GATE port map(A, B, n1);
    G2: NOR_GATE port map(A, n1, n2);
    G3: NOR_GATE port map(B, n1, n3);
    G4: NOR_GATE port map(n2, n3, n4);

    -- Add Cin
    G5: NOR_GATE port map(n4, Cin, n5);
    G6: NOR_GATE port map(n4, n5, n6);
    G7: NOR_GATE port map(Cin, n5, n7);
    G8: NOR_GATE port map(n6, n7, Sum);

    -- Carry from A and B
    G9:  NOR_GATE port map(A, A, n9);
    G10: NOR_GATE port map(B, B, n10);
    G11: NOR_GATE port map(n9, n10, n11);

    -- Carry from intermediate result and Cin
    G12: NOR_GATE port map(n4, n4, n12);
    G13: NOR_GATE port map(Cin, Cin, n13);
    G14: NOR_GATE port map(n12, n13, n14);

    -- Final carry
    G15: NOR_GATE port map(n11, n14, n15);
    G16: NOR_GATE port map(n15, n15, Cout);

end Structural;