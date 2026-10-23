LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Accumulator_TB IS
END Accumulator_TB;
 
ARCHITECTURE behavior OF Accumulator_TB IS
 
    -- Component Declaration
    COMPONENT Accumulator
    PORT(
        CLK      : IN  std_logic;
        RESET    : IN  std_logic;
        ACC_LOAD : IN  std_logic;
        DATA_IN  : IN  std_logic_vector(7 downto 0);
        ACC_OUT  : OUT std_logic_vector(7 downto 0);
        Z_FLAG   : OUT std_logic
    );
    END COMPONENT;
 
    -- Inputs
    signal CLK      : std_logic := '0';
    signal RESET    : std_logic := '0';
    signal ACC_LOAD : std_logic := '0';
    signal DATA_IN  : std_logic_vector(7 downto 0) := (others => '0');
 
    -- Outputs
    signal ACC_OUT : std_logic_vector(7 downto 0);
    signal Z_FLAG  : std_logic;
 
    -- Clock period
    constant CLK_period : time := 10 ns;
 
    -- Stops the clock when the test is finished
    signal sim_done : boolean := false;
 
BEGIN
 
    -- Instantiate UUT
    uut: Accumulator PORT MAP (
        CLK      => CLK,
        RESET    => RESET,
        ACC_LOAD => ACC_LOAD,
        DATA_IN  => DATA_IN,
        ACC_OUT  => ACC_OUT,
        Z_FLAG   => Z_FLAG
    );
 
    -- Clock Generation (rising edges at 5, 15, 25 ... ns)
    CLK_process: process
    begin
        while not sim_done loop
            CLK <= '0';
            wait for CLK_period/2;
            CLK <= '1';
            wait for CLK_period/2;
        end loop;
        wait;
    end process;
 
    -- Stimulus Process
    -- Inputs change at the falling edge (0, 10, 20 ... ns), the result is
    -- checked after the next rising edge.
    stim_proc: process
    begin
 
        -- Test 1: RESET = 1 with ACC_LOAD = 1 (RESET has priority)
        RESET    <= '1';
        ACC_LOAD <= '1';
        DATA_IN  <= "10101010";
        wait for CLK_period;
        assert ACC_OUT = "00000000" and Z_FLAG = '1'
            report "Test 1 failed: reset" severity error;
 
        -- Test 2: ACC_LOAD = 0, nothing should be loaded
        RESET    <= '0';
        ACC_LOAD <= '0';
        DATA_IN  <= "00000101";
        wait for CLK_period;
        assert ACC_OUT = "00000000" and Z_FLAG = '1'
            report "Test 2 failed: loaded without ACC_LOAD" severity error;
 
        -- Test 3: Load 5
        ACC_LOAD <= '1';
        wait for CLK_period;
        assert ACC_OUT = "00000101" and Z_FLAG = '0'
            report "Test 3 failed: load 5" severity error;
 
        -- Test 4: Load 10
        DATA_IN <= "00001010";
        wait for CLK_period;
        assert ACC_OUT = "00001010" and Z_FLAG = '0'
            report "Test 4 failed: load 10" severity error;
 
        -- Test 5: Hold previous value (2 clock edges)
        ACC_LOAD <= '0';
        DATA_IN  <= "00001111";
        wait for CLK_period * 2;
        assert ACC_OUT = "00001010" and Z_FLAG = '0'
            report "Test 5 failed: hold" severity error;
 
        -- Test 6: Load zero (Z_FLAG should become 1)
        ACC_LOAD <= '1';
        DATA_IN  <= "00000000";
        wait for CLK_period;
        assert ACC_OUT = "00000000" and Z_FLAG = '1'
            report "Test 6 failed: load zero" severity error;
 
        -- Test 7: Load 255
        DATA_IN <= "11111111";
        wait for CLK_period;
        assert ACC_OUT = "11111111" and Z_FLAG = '0'
            report "Test 7 failed: load 255" severity error;
 
        -- Test 8: Synchronous reset
        -- RESET goes high at the falling edge, ACC must not clear until the
        -- next rising edge (4 ns later it still holds 255)
        ACC_LOAD <= '0';
        RESET    <= '1';
        wait for 4 ns;
        assert ACC_OUT = "11111111"
            report "Test 8 failed: reset is not synchronous" severity error;
        wait for 6 ns;
        assert ACC_OUT = "00000000" and Z_FLAG = '1'
            report "Test 8 failed: reset did not clear ACC" severity error;
 
        -- Test 9: Release reset, ACC stays 0
        RESET <= '0';
        wait for CLK_period;
        assert ACC_OUT = "00000000" and Z_FLAG = '1'
            report "Test 9 failed" severity error;
 
        report "Accumulator_TB finished" severity note;
        sim_done <= true;
        wait;
    end process;
 
END behavior;
 