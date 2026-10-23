
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU_TB IS
END ALU_TB;

ARCHITECTURE behavior OF ALU_TB IS

    COMPONENT ALU
    PORT(
        A          : IN  std_logic_vector(7 downto 0);
        B          : IN  std_logic_vector(7 downto 0);
        ALU_SELECT : IN  std_logic_vector(3 downto 0);
        RESULT     : OUT std_logic_vector(7 downto 0);
        ZERO       : OUT std_logic
    );
    END COMPONENT;

    -- Inputs
    signal A          : std_logic_vector(7 downto 0) := (others => '0');
    signal B          : std_logic_vector(7 downto 0) := (others => '0');
    signal ALU_SELECT : std_logic_vector(3 downto 0) := (others => '0');

    -- Outputs
    signal RESULT : std_logic_vector(7 downto 0);
    signal ZERO   : std_logic;

BEGIN

    -- Instantiate ALU
    uut: ALU PORT MAP (
        A          => A,
        B          => B,
        ALU_SELECT => ALU_SELECT,
        RESULT     => RESULT,
        ZERO       => ZERO
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 1: ADD (0F + D8 = E7)
        A <= X"0F";
        B <= X"D8";
        ALU_SELECT <= "0010";
        wait for 10 ns;

        -- Test 2: OR (0F OR A0 = AF)
        A <= X"0F";
        B <= X"A0";
        ALU_SELECT <= "0101";
        wait for 10 ns;

        -- Test 3: NOT (NOT AF = 50)
        A <= X"AF";
        B <= X"00";
        ALU_SELECT <= "0111";
        wait for 10 ns;

        -- Test 4: SHR (50 shifted right = 28)
        A <= X"50";
        B <= X"00";
        ALU_SELECT <= "1001";
        wait for 10 ns;

        -- Test 5: ZERO flag (28 + D8 = 00)
        A <= X"28";
        B <= X"D8";
        ALU_SELECT <= "0010";
        wait for 10 ns;

        -- End simulation stimulus
        wait;
    end process;

END behavior;