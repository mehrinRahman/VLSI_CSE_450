LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CPU_TB IS
END CPU_TB;
 
ARCHITECTURE behavior OF CPU_TB IS
 
    -- Component Declaration
    COMPONENT CPU
    PORT(
        CLK     : IN  std_logic;
        RESET   : IN  std_logic;
        ACC_OUT : OUT std_logic_vector(7 downto 0);
        Z_FLAG  : OUT std_logic;
        PC_OUT  : OUT std_logic_vector(3 downto 0)
    );
    END COMPONENT;
 
    -- Inputs
    signal CLK   : std_logic := '0';
    signal RESET : std_logic := '0';
 
    -- Outputs
    signal ACC_OUT : std_logic_vector(7 downto 0);
    signal Z_FLAG  : std_logic;
    signal PC_OUT  : std_logic_vector(3 downto 0);
 
    -- Clock period
    constant CLK_period : time := 10 ns;
 
    -- Stops the clock after the program has finished
    signal sim_done : boolean := false;
 
BEGIN
 
    -- Instantiate the Unit Under Test
    uut: CPU PORT MAP (
        CLK     => CLK,
        RESET   => RESET,
        ACC_OUT => ACC_OUT,
        Z_FLAG  => Z_FLAG,
        PC_OUT  => PC_OUT
    );
 
    -- Clock Generation
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
    stim_proc: process
    begin
 
        -- RESET = 1 for one rising edge (edge at 5 ns)
        RESET <= '1';
        wait for CLK_period;
 
        -- Release reset, CPU starts executing from address 0
        RESET <= '0';
 
        -- 7 instructions of Set 5 (rising edges at 15 ns to 75 ns)
        wait for CLK_period * 7;
 
        -- 2 extra cycles (NOP) to show that ACC holds its value
        wait for CLK_period * 2;
 
        -- Stop the clock, simulation ends
        sim_done <= true;
        wait;
    end process;
 
END behavior;
 