library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Second_D_Latch_tb is
end Second_D_Latch_tb;

architecture Behavioral of Second_D_Latch_tb is

    component Second_D_Latch
        Port (
            D      : in  STD_LOGIC;
            Enable : in  STD_LOGIC;
            Q      : out STD_LOGIC;
            Qbar   : out STD_LOGIC
        );
    end component;

    signal D      : STD_LOGIC := '0';
    signal Enable : STD_LOGIC := '0';
    signal Q      : STD_LOGIC;
    signal Qbar   : STD_LOGIC;

begin

    UUT: Second_D_Latch
        port map (
            D      => D,
            Enable => Enable,
            Q      => Q,
            Qbar   => Qbar
        );

    stim_proc: process
    begin

        -- Test 1: Enable = 0, D = 0
        -- HOLD
        D <= '0';
        Enable <= '0';
        wait for 10 ns;

        -- Test 2: Enable = 1, D = 1
        -- SET Q = 1
        D <= '1';
        Enable <= '1';
        wait for 10 ns;

        -- Test 3: Enable = 0, D = 0
        -- HOLD Q = 1
        D <= '0';
        Enable <= '0';
        wait for 10 ns;

        -- Test 4: Enable = 1, D = 0
        -- RESET Q = 0
        D <= '0';
        Enable <= '1';
        wait for 10 ns;

        -- Test 5: Enable = 0, D = 1
        -- HOLD Q = 0
        D <= '1';
        Enable <= '0';
        wait for 10 ns;

        -- Test 6: Enable = 1, D = 1
        -- SET Q = 1
        D <= '1';
        Enable <= '1';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;
