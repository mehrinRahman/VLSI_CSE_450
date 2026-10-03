library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Master_Slave_D_FlipFlop is
    Port (
        D    : in  STD_LOGIC;
        CLK  : in  STD_LOGIC;
        Q    : out STD_LOGIC;
        Qbar : out STD_LOGIC
    );
end Master_Slave_D_FlipFlop;

architecture Structural of Master_Slave_D_FlipFlop is

    -- NOT Gate
    component NOT_gate1
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    -- First D Latch
    component First_D_Latch
        Port (
            D      : in  STD_LOGIC;
            Enable : in  STD_LOGIC;
            Q      : out STD_LOGIC;
            Qbar   : out STD_LOGIC
        );
    end component;

    -- Second D Latch
    component Second_D_Latch
        Port (
            D      : in  STD_LOGIC;
            Enable : in  STD_LOGIC;
            Q      : out STD_LOGIC;
            Qbar   : out STD_LOGIC
        );
    end component;

    -- Internal signals
    signal CLK_bar : STD_LOGIC;
    signal Q_master : STD_LOGIC;
    signal Qb_master : STD_LOGIC;

begin

    -- NOT gate
    NOT1: NOT_gate1
        port map (
            A => CLK,
            Y => CLK_bar
        );

    -- Master Latch
    MASTER: First_D_Latch
        port map (
            D      => D,
            Enable => CLK,
            Q      => Q_master,
            Qbar   => Qb_master
        );

    -- Slave Latch
    SLAVE: Second_D_Latch
        port map (
            D      => Q_master,
            Enable => CLK_bar,
            Q      => Q,
            Qbar   => Qbar
        );

end Structural;
