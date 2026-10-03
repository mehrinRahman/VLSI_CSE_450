LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY accumulator_tb IS
END accumulator_tb;

ARCHITECTURE behavior OF accumulator_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Accumulator_4bit
    PORT(
         A     : IN  std_logic_vector(3 downto 0);
         B     : IN  std_logic_vector(3 downto 0);
         CLK   : IN  std_logic;
         RESET : IN  std_logic;
         Q     : OUT std_logic_vector(3 downto 0)
        );
    END COMPONENT;

    -- Inputs
    signal A     : std_logic_vector(3 downto 0) := (others => '0');
    signal B     : std_logic_vector(3 downto 0) := (others => '0');
    signal CLK   : std_logic := '0';
    signal RESET : std_logic := '0';

    -- Outputs
    signal Q : std_logic_vector(3 downto 0);

    -- Clock period
    constant CLK_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: Accumulator_4bit PORT MAP (
          A     => A,
          B     => B,
          CLK   => CLK,
          RESET => RESET,
          Q     => Q
        );

    -- Clock process
    CLK_process : process
    begin
        for i in 1 to 5 loop
            CLK <= '0';
            wait for CLK_period/2;
            CLK <= '1';
            wait for CLK_period/2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin

        -- Step 1: RESET
        RESET <= '1';
        A <= "0000";
        B <= "0000";

        wait for CLK_period;

        -- Step 2: 3 + 5 = 8
        RESET <= '0';
        A <= "0011";
        B <= "0101";

        wait for CLK_period;

        -- Step 3: 2 + 1 = 3
        A <= "0010";
        B <= "0001";

        wait for CLK_period;

        -- Step 4: 15 + 1 = 16 -> 0000
        A <= "1111";
        B <= "0001";

        wait for CLK_period;

        -- Step 5: 10 + 5 = 15
        A <= "1010";
        B <= "0101";

        wait for CLK_period;

        -- End simulation
        wait;

    end process;

END;
