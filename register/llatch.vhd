library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity L_Latch1 is
    Port (
        S    : in  STD_LOGIC;
        R    : in  STD_LOGIC;
        Q    : out STD_LOGIC;
        Qbar : out STD_LOGIC
    );
end L_Latch1;

architecture Structural of L_Latch1 is

    component NAND_gate1
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal Q_int    : STD_LOGIC;
    signal Qbar_int : STD_LOGIC;

begin

    -- NAND Gate 1
    NAND1: NAND_gate1
        port map (
            A => S,
            B => Qbar_int,
            Y => Q_int
        );

    -- NAND Gate 2
    NAND2: NAND_gate1
        port map (
            A => R,
            B => Q_int,
            Y => Qbar_int
        );

    Q    <= Q_int;
    Qbar <= Qbar_int;

end Structural;
