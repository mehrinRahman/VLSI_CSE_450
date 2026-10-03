library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_1bit_tb is
end Register_1bit_tb;

architecture Behavioral of Register_1bit_tb is

    component Register_1bit
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

    UUT: Register_1bit
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

        -- Store 1
        D <= '1';
        wait for 5 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        -- Store 0
        D <= '0';
        wait for 5 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        -- Store 1 again
        D <= '1';
        wait for 5 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        -- Store 0 again
        D <= '0';
        wait for 5 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;
