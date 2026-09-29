LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ONE_FULL_TB IS
END ONE_FULL_TB;

ARCHITECTURE behavior OF ONE_FULL_TB IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT ONE_BIT_FULL_ADDER
    PORT(
         A    : IN  std_logic;
         B    : IN  std_logic;
         Cin  : IN  std_logic;
         Sum  : OUT std_logic;
         Cout : OUT std_logic
        );
    END COMPONENT;

    -- Inputs
    signal A   : std_logic := '0';
    signal B   : std_logic := '0';
    signal Cin : std_logic := '0';

    -- Outputs
    signal Sum  : std_logic;
    signal Cout : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: ONE_BIT_FULL_ADDER PORT MAP (
          A    => A,
          B    => B,
          Cin  => Cin,
          Sum  => Sum,
          Cout => Cout
        );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test Case 1: A=0, B=0, Cin=0
        A <= '0';
        B <= '0';
        Cin <= '0';
        wait for 100 ns;

        -- Test Case 2: A=0, B=0, Cin=1
        A <= '0';
        B <= '0';
        Cin <= '1';
        wait for 100 ns;

        -- Test Case 3: A=0, B=1, Cin=0
        A <= '0';
        B <= '1';
        Cin <= '0';
        wait for 100 ns;

        -- Test Case 4: A=0, B=1, Cin=1
        A <= '0';
        B <= '1';
        Cin <= '1';
        wait for 100 ns;

        -- Test Case 5: A=1, B=0, Cin=0
        A <= '1';
        B <= '0';
        Cin <= '0';
        wait for 100 ns;

        -- Test Case 6: A=1, B=0, Cin=1
        A <= '1';
        B <= '0';
        Cin <= '1';
        wait for 100 ns;

        -- Test Case 7: A=1, B=1, Cin=0
        A <= '1';
        B <= '1';
        Cin <= '0';
        wait for 100 ns;

        -- Test Case 8: A=1, B=1, Cin=1
        A <= '1';
        B <= '1';
        Cin <= '1';
        wait for 100 ns;

        -- Stop simulation
        wait;

    end process;

END;
