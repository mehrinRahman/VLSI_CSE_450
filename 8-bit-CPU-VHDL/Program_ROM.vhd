
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Program_ROM is
    Port (
        ADDRESS     : in  STD_LOGIC_VECTOR(3 downto 0);
        INSTRUCTION : out STD_LOGIC_VECTOR(11 downto 0)
    );
end Program_ROM;

architecture Behavioral of Program_ROM is

begin

    process(ADDRESS)
    begin
        case ADDRESS is

            -- Address 0: LDI 0F
            when "0000" =>
                INSTRUCTION <= X"10F";

            -- Address 1: OR A0
            when "0001" =>
                INSTRUCTION <= X"5A0";

            -- Address 2: NOT
            when "0010" =>
                INSTRUCTION <= X"700";

            -- Address 3: SHR
            when "0011" =>
                INSTRUCTION <= X"900";

            -- Address 4: ADD D8
            when "0100" =>
                INSTRUCTION <= X"2D8";

            -- Address 5: OR 81
            when "0101" =>
                INSTRUCTION <= X"581";

            -- Address 6: SHR
            when "0110" =>
                INSTRUCTION <= X"900";

            -- Remaining addresses: NOP
            when others =>
                INSTRUCTION <= X"000";

        end case;
    end process;

end Behavioral;