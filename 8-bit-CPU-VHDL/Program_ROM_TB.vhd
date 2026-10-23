
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Program_ROM_TB IS
END Program_ROM_TB;

ARCHITECTURE behavior OF Program_ROM_TB IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Program_ROM
    PORT(
        ADDRESS     : IN  std_logic_vector(3 downto 0);
        INSTRUCTION : OUT std_logic_vector(11 downto 0)
    );
    END COMPONENT;

    -- Input
    signal ADDRESS : std_logic_vector(3 downto 0) := (others => '0');

    -- Output
    signal INSTRUCTION : std_logic_vector(11 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: Program_ROM PORT MAP (
        ADDRESS     => ADDRESS,
        INSTRUCTION => INSTRUCTION
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 1: LDI 0F
        ADDRESS <= "0000";
        wait for 10 ns;

        -- Test 2: OR A0
        ADDRESS <= "0001";
        wait for 10 ns;

        -- Test 3: NOT
        ADDRESS <= "0010";
        wait for 10 ns;

        -- Test 4: SHR
        ADDRESS <= "0011";
        wait for 10 ns;

        -- Test 5: ADD D8
        ADDRESS <= "0100";
        wait for 10 ns;

        -- Test 6: OR 81
        ADDRESS <= "0101";
        wait for 10 ns;

        -- Test 7: SHR
        ADDRESS <= "0110";
        wait for 10 ns;

        -- Test 8: NOP
        ADDRESS <= "0111";
        wait for 10 ns;

        -- Test 9: Last ROM address
        ADDRESS <= "1111";
        wait for 10 ns;

        -- End simulation
        wait;
    end process;

END behavior;