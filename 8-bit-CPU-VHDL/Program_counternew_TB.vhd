
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Program_counternew_TB IS
END Program_counternew_TB;

ARCHITECTURE behavior OF Program_counternew_TB IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT PROGRAM_COUNTER
    PORT(
        CLK    : IN  std_logic;
        RESET  : IN  std_logic;
        PC_OUT : OUT std_logic_vector(3 downto 0)
    );
    END COMPONENT;

    -- Inputs
    signal CLK   : std_logic := '0';
    signal RESET : std_logic := '0';

    -- Output
    signal PC_OUT : std_logic_vector(3 downto 0);

    -- Clock period
    constant CLK_period : time := 10 ns;

BEGIN

    -- Instantiate the Program Counter
    uut: PROGRAM_COUNTER PORT MAP (
        CLK    => CLK,
        RESET  => RESET,
        PC_OUT => PC_OUT
    );

    -- Clock generation
    CLK_process : process
    begin
        CLK <= '0';
        wait for CLK_period / 2;
        CLK <= '1';
        wait for CLK_period / 2;
    end process;

    -- Test sequence
    stim_proc: process
    begin
        -- Test 1: Apply RESET
        RESET <= '1';
        wait for 20 ns;

        -- Test 2: Release RESET and count
        RESET <= '0';
        wait for 50 ns;

        -- Test 3: Apply RESET again
        RESET <= '1';
        wait for 20 ns;

        -- Test 4: Release RESET and count again
        RESET <= '0';
        wait for 40 ns;

        -- End simulation
        wait;
    end process;

END behavior;