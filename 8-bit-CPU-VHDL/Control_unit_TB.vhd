
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Control_unit_TB IS
END Control_unit_TB;

ARCHITECTURE behavior OF Control_unit_TB IS

    -- Component Declaration
    COMPONENT Control_Unit
    PORT(
        OPCODE   : IN  std_logic_vector(3 downto 0);
        ALU_SEL  : OUT std_logic_vector(3 downto 0);
        ACC_LOAD : OUT std_logic;
        IMM_SEL  : OUT std_logic
    );
    END COMPONENT;

    -- Inputs
    signal OPCODE : std_logic_vector(3 downto 0) := (others => '0');

    -- Outputs
    signal ALU_SEL  : std_logic_vector(3 downto 0);
    signal ACC_LOAD : std_logic;
    signal IMM_SEL  : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: Control_Unit PORT MAP (
        OPCODE   => OPCODE,
        ALU_SEL  => ALU_SEL,
        ACC_LOAD => ACC_LOAD,
        IMM_SEL  => IMM_SEL
    );

    -- Stimulus Process
    stim_proc: process
    begin

        -- Test NOP
        OPCODE <= "0000";
        wait for 20 ns;

        -- Test LDI
        OPCODE <= "0001";
        wait for 20 ns;

        -- Test ADD
        OPCODE <= "0010";
        wait for 20 ns;

        -- Test OR
        OPCODE <= "0101";
        wait for 20 ns;

        -- Test NOT
        OPCODE <= "0111";
        wait for 20 ns;

        -- Test SHR
        OPCODE <= "1001";
        wait for 20 ns;

        -- Test Invalid Opcode
        OPCODE <= "1111";
        wait for 20 ns;

        wait;
    end process;

END behavior;