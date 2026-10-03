LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY addder_4bitTb IS
END addder_4bitTb;

ARCHITECTURE behavior OF addder_4bitTb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT adder_4bit
    PORT(
         A   : IN  std_logic_vector(3 downto 0);
         B   : IN  std_logic_vector(3 downto 0);
         SUM : OUT std_logic_vector(3 downto 0)
        );
    END COMPONENT;

    -- Inputs
    signal A : std_logic_vector(3 downto 0) := (others => '0');
    signal B : std_logic_vector(3 downto 0) := (others => '0');

    -- Outputs
    signal SUM : std_logic_vector(3 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: adder_4bit PORT MAP (
          A   => A,
          B   => B,
          SUM => SUM
        );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 1: 3 + 5 = 8
        A <= "0011";
        B <= "0101";
        wait for 20 ns;

        -- Test 2: 2 + 1 = 3
        A <= "0010";
        B <= "0001";
        wait for 20 ns;

        -- Test 3: 15 + 1 = 0 (4-bit overflow)
        A <= "1111";
        B <= "0001";
        wait for 20 ns;

        -- Test 4: 10 + 5 = 15
        A <= "1010";
        B <= "0101";
        wait for 20 ns;

        wait;

    end process;

END;
