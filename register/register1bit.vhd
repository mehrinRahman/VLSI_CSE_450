library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_1bit is
    Port (
        D    : in  STD_LOGIC;
        CLK  : in  STD_LOGIC;
        Q    : out STD_LOGIC;
        Qbar : out STD_LOGIC
    );
end Register_1bit;

architecture Structural of Register_1bit is

    component Master_Slave_D_FlipFlop
        Port (
            D    : in  STD_LOGIC;
            CLK  : in  STD_LOGIC;
            Q    : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

begin

    FF1: Master_Slave_D_FlipFlop
        port map (
            D    => D,
            CLK  => CLK,
            Q    => Q,
            Qbar => Qbar
        );

end Structural;
