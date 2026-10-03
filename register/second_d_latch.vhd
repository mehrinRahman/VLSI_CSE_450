library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Second_D_Latch is
    Port (
        D      : in  STD_LOGIC;
        Enable : in  STD_LOGIC;
        Q      : out STD_LOGIC;
        Qbar   : out STD_LOGIC
    );
end Second_D_Latch;

architecture Structural of Second_D_Latch is

    -- NOT Gate
    component NOT_gate1
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    -- NAND Gate
    component NAND_gate1
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    -- SR Latch
    component SR_Latch1
        Port (
            S    : in  STD_LOGIC;
            R    : in  STD_LOGIC;
            Q    : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

    -- Internal signals
    signal D_not : STD_LOGIC;
    signal S_int : STD_LOGIC;
    signal R_int : STD_LOGIC;

begin

    -- NOT gate: D -> NOT D
    NOT1: NOT_gate1
        port map (
            A => D,
            Y => D_not
        );

    -- NAND for S
    NAND1: NAND_gate1
        port map (
            A => D,
            B => Enable,
            Y => S_int
        );

    -- NAND for R
    NAND2: NAND_gate1
        port map (
            A => D_not,
            B => Enable,
            Y => R_int
        );

    -- SR Latch
    SR1: SR_Latch1
        port map (
            S    => S_int,
            R    => R_int,
            Q    => Q,
            Qbar => Qbar
        );

end Structural;
