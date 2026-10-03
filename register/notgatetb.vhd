library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_gate1_tb is
end NOT_gate1_tb;

architecture Behavioral of NOT_gate1_tb is

    component NOT_gate1
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal A : STD_LOGIC := '0';
    signal Y : STD_LOGIC;

begin

    UUT: NOT_gate1
        port map (
            A => A,
            Y => Y
        );

    stim_proc: process
    begin

        -- Test 1: NOT 0 = 1
        A <= '0';
        wait for 10 ns;

        -- Test 2: NOT 1 = 0
        A <= '1';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;
