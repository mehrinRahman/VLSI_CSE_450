library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_8bit_tb is
end Register_8bit_tb;

architecture Behavioral of Register_8bit_tb is

    component Register_8bit
        Port (
            D    : in  STD_LOGIC_VECTOR(7 downto 0);
            CLK  : in  STD_LOGIC;
            Q    : out STD_LOGIC_VECTOR(7 downto 0);
            Qbar : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal D    : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal CLK  : STD_LOGIC := '0';
    signal Q    : STD_LOGIC_VECTOR(7 downto 0);
    signal Qbar : STD_LOGIC_VECTOR(7 downto 0);

begin

    UUT: Register_8bit
        port map (
            D    => D,
            CLK  => CLK,
            Q    => Q,
            Qbar => Qbar
        );

    stim_proc: process
    begin

        -- Initial
        D <= "00000000";
        CLK <= '0';
        wait for 10 ns;

        -- Load 10101010
        D <= "10101010";
        wait for 5 ns;

        CLK <= '1';
        wait for 10 ns;

        -- Falling edge: data stored
        CLK <= '0';
        wait for 10 ns;

        -- Load 11001100
        D <= "11001100";
        wait for 5 ns;

        CLK <= '1';
        wait for 10 ns;

        -- Falling edge: data stored
        CLK <= '0';
        wait for 10 ns;

        -- Load 11110000
        D <= "11110000";
        wait for 5 ns;

        CLK <= '1';
        wait for 10 ns;

        -- Falling edge: data stored
        CLK <= '0';
        wait for 10 ns;

        -- Load 01010101
        D <= "01010101";
        wait for 5 ns;

        CLK <= '1';
        wait for 10 ns;

        -- Falling edge: data stored
        CLK <= '0';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;
