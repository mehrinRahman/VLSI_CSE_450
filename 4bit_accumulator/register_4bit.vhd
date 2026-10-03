library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_4bit is
    Port (
        D     : in  STD_LOGIC_VECTOR(3 downto 0);
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Register_4bit;

architecture Behavioral of Register_4bit is

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                Q <= "0000";
            else
                Q <= D;
            end if;
        end if;
    end process;

end Behavioral;
