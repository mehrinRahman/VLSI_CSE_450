LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY register_4bit_tb IS
END register_4bit_tb;

ARCHITECTURE behavior OF register_4bit_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Register_4bit
    PORT(
         D     : IN  std_logic_vector(3 downto 0);
         CLK   : IN  std_logic;
         RESET : IN  std_logic;
         Q     : OUT std_logic_vector(3 downto 0)
        );
    END COMPONENT;

    -- Inputs
    signal D     : std_logic_vector(3 downto 0) := (others => '0');
    signal CLK   : std_logic := '0';
    signal RESET : std_logic := '0';

    -- Outputs
    signal Q : std_logic_vector(3 downto 0);

    -- Clock period
    constant CLK_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: Register_4bit PORT MAP (
          D     => D,
          CLK   => CLK,
          RESET => RESET,
          Q     => Q
        );

    -- Clock generation
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
        D <= "0000";
        wait for CLK_period;

        -- Step 2: Load 1000
        RESET <= '0';
        D <= "1000";
        wait for CLK_period;

        -- Step 3: Load 0011
        D <= "0011";
        wait for CLK_period;

        -- Step 4: Load 1111
        D <= "1111";
        wait for CLK_period;

        -- Step 5: RESET
        RESET <= '1';
        D <= "1010";
        wait for CLK_period;

        wait;

    end process;

END;
