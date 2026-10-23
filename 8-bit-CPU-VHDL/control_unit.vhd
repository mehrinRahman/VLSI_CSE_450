
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit is
    Port (
        OPCODE    : in  STD_LOGIC_VECTOR(3 downto 0);
        ALU_SEL   : out STD_LOGIC_VECTOR(3 downto 0);
        ACC_LOAD  : out STD_LOGIC;
        IMM_SEL   : out STD_LOGIC
    );
end Control_Unit;

architecture Behavioral of Control_Unit is
begin

    process(OPCODE)
    begin
        -- Default control signals
        ALU_SEL  <= "0000";
        ACC_LOAD <= '0';
        IMM_SEL  <= '0';

        case OPCODE is

            when "0000" =>  -- NOP
                ALU_SEL  <= "0000";
                ACC_LOAD <= '0';
                IMM_SEL  <= '0';

            when "0001" =>  -- LDI
                ALU_SEL  <= "0000";
                ACC_LOAD <= '1';
                IMM_SEL  <= '1';

            when "0010" =>  -- ADD
                ALU_SEL  <= "0010";
                ACC_LOAD <= '1';
                IMM_SEL  <= '0';

            when "0101" =>  -- OR
                ALU_SEL  <= "0101";
                ACC_LOAD <= '1';
                IMM_SEL  <= '0';

            when "0111" =>  -- NOT
                ALU_SEL  <= "0111";
                ACC_LOAD <= '1';
                IMM_SEL  <= '0';

            when "1001" =>  -- SHR
                ALU_SEL  <= "1001";
                ACC_LOAD <= '1';
                IMM_SEL  <= '0';

            when others =>
                ALU_SEL  <= "0000";
                ACC_LOAD <= '0';
                IMM_SEL  <= '0';

        end case;
    end process;

end Behavioral;