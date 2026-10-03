library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_Latch1 is
    Port (
        S : in  STD_LOGIC;
        R : in  STD_LOGIC;
        Q : out STD_LOGIC;
        Qbar : out STD_LOGIC
    );
end SR_Latch1;

architecture Structural of SR_Latch1 is

    component NAND_gate1
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal q_int    : STD_LOGIC;
    signal qbar_int : STD_LOGIC;

begin

    -- First NAND gate
    NAND1: NAND_gate1
        port map (
            A => S,
            B => qbar_int,
            Y => q_int
        );

    -- Second NAND gate
    NAND2: NAND_gate1
        port map (
            A => R,
            B => q_int,
            Y => qbar_int
        );

    Q    <= q_int;
    Qbar <= qbar_int;

end Structural;
