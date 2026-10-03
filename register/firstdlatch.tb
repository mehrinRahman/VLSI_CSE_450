library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity First_D_Latch_tb is
end First_D_Latch_tb;

architecture Behavioral of First_D_Latch_tb is

    component First_D_Latch
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

    UUT: First_D_Latch
        port map (
            D      => D,
            Enable => Enable,
            Q      => Q,
            Qbar   => Qbar
        );

    stim_proc: process
    begin

        -- =================================
        -- 1. Enable = 0
        -- HOLD
        -- =================================
        D <= '0';
        Enable <= '0';
        wait for 10 ns;

        -- =================================
        -- 2. Enable = 1, D = 1
        -- SET
        -- Expected: Q = 1, Qbar = 0
        -- =================================
        D <= '1';
        Enable <= '1';
        wait for 10 ns;

        -- =================================
        -- 3. Enable = 0
        -- HOLD
        -- Expected: Q remains 1
        -- =================================
        D <= '0';
        Enable <= '0';
        wait for 10 ns;

        -- =================================
        -- 4. Enable = 1, D = 0
        -- RESET
        -- Expected: Q = 0, Qbar = 1
        -- =================================
        D <= '0';
        Enable <= '1';
        wait for 10 ns;

        -- =================================
        -- 5. Enable = 0
        -- HOLD
        -- Expected: Q remains 0
        -- =================================
        D <= '1';
        Enable <= '0';
        wait for 10 ns;

        -- =================================
        -- 6. Enable = 1, D = 1
        -- SET
        -- Expected: Q = 1, Qbar = 0
        -- =================================
        D <= '1';
        Enable <= '1';
        wait for 10 ns;

        -- =================================
        -- 7. Enable = 0
        -- HOLD
        -- =================================
        D <= '0';
        Enable <= '0';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;
