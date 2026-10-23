
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        A          : in  STD_LOGIC_VECTOR(7 downto 0);
        B          : in  STD_LOGIC_VECTOR(7 downto 0);
        ALU_SELECT : in  STD_LOGIC_VECTOR(3 downto 0);
        RESULT     : out STD_LOGIC_VECTOR(7 downto 0);
        ZERO       : out STD_LOGIC
    );
end ALU;

architecture Behavioral of ALU is

    signal TEMP_RESULT : STD_LOGIC_VECTOR(7 downto 0);

begin

    process(A, B, ALU_SELECT)
    begin

        case ALU_SELECT is

            -- ADD: A + B
            when "0010" =>
                TEMP_RESULT <= std_logic_vector(unsigned(A) + unsigned(B));

            -- OR: A OR B
            when "0101" =>
                TEMP_RESULT <= A or B;

            -- NOT: invert A
            when "0111" =>
                TEMP_RESULT <= not A;

            -- SHR: shift A right by one bit
            when "1001" =>
                TEMP_RESULT <= '0' & A(7 downto 1);

            -- Default result
            when others =>
                TEMP_RESULT <= (others => '0');

        end case;

    end process;

    RESULT <= TEMP_RESULT;

    -- ZERO flag is 1 when result is zero
    ZERO <= '1' when TEMP_RESULT = "00000000" else '0';

end Behavioral;