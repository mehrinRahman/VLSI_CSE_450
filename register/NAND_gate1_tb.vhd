library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_gate1_tb is
end NAND_gate1_tb;

architecture Behavioral of NAND_gate1_tb is

    component NAND_gate1
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal Y : STD_LOGIC;

begin

    UUT: NAND_gate1
        port map (
            A => A,
            B => B,
            Y => Y
        );

    stim_proc: process
    begin

        A <= '0';
        B <= '0';
        wait for 10 ns;

        A <= '0';
        B <= '1';
        wait for 10 ns;

        A <= '1';
        B <= '0';
        wait for 10 ns;

        A <= '1';
        B <= '1';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;
