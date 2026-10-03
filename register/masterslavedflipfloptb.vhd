library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Master_Slave_D_FlipFlop_tb is
end Master_Slave_D_FlipFlop_tb;

architecture Behavioral of Master_Slave_D_FlipFlop_tb is

    component Master_Slave_D_FlipFlop
        Port (
            D    : in  STD_LOGIC;
            CLK  : in  STD_LOGIC;
            Q    : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

    signal D    : STD_LOGIC := '0';
    signal CLK  : STD_LOGIC := '0';
    signal Q    : STD_LOGIC;
    signal Qbar : STD_LOGIC;

begin

    UUT: Master_Slave_D_FlipFlop
        port map (
            D    => D,
            CLK  => CLK,
            Q    => Q,
            Qbar => Qbar
        );

    stim_proc: process
    begin

        -- Initial
        D <= '0';
        CLK <= '0';
        wait for 10 ns;

        -- Apply D = 1
        D <= '1';
        wait for 5 ns;

        -- Rising edge
        CLK <= '1';
        wait for 10 ns;

        -- Falling edge -> Q should become 1
        CLK <= '0';
        wait for 10 ns;

        -- Apply D = 0
        D <= '0';
        wait for 5 ns;

        -- Rising edge
        CLK <= '1';
        wait for 10 ns;

        -- Falling edge -> Q should become 0
        CLK <= '0';
        wait for 10 ns;

        -- Apply D = 1
        D <= '1';
        wait for 5 ns;

        CLK <= '1';
        wait for 10 ns;

        -- Falling edge -> Q should become 1
        CLK <= '0';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;
