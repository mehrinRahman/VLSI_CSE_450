library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity L_Latch1_tb is
end L_Latch1_tb;

architecture Behavioral of L_Latch1_tb is

    component L_Latch1
        Port (
            S    : in  STD_LOGIC;
            R    : in  STD_LOGIC;
            Q    : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

    signal S    : STD_LOGIC := '1';
    signal R    : STD_LOGIC := '1';
    signal Q    : STD_LOGIC;
    signal Qbar : STD_LOGIC;

begin

    UUT: L_Latch1
        port map (
            S    => S,
            R    => R,
            Q    => Q,
            Qbar => Qbar
        );

    stim_proc: process
    begin

        -- ==================================
        -- 1. SET
        -- S = 0, R = 1
        -- Expected: Q = 1, Qbar = 0
        -- ==================================
        S <= '0';
        R <= '1';
        wait for 10 ns;

        -- ==================================
        -- 2. HOLD
        -- S = 1, R = 1
        -- Expected: Q remains 1
        -- ==================================
        S <= '1';
        R <= '1';
        wait for 10 ns;

        -- ==================================
        -- 3. RESET
        -- S = 1, R = 0
        -- Expected: Q = 0, Qbar = 1
        -- ==================================
        S <= '1';
        R <= '0';
        wait for 10 ns;

        -- ==================================
        -- 4. HOLD
        -- S = 1, R = 1
        -- Expected: Q remains 0
        -- ==================================
        S <= '1';
        R <= '1';
        wait for 10 ns;

        -- ==================================
        -- 5. SET again
        -- S = 0, R = 1
        -- Expected: Q = 1, Qbar = 0
        -- ==================================
        S <= '0';
        R <= '1';
        wait for 10 ns;

        -- ==================================
        -- 6. HOLD again
        -- ==================================
        S <= '1';
        R <= '1';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;
