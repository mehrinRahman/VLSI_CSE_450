
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PROGRAM_COUNTER is
    Port (
        CLK    : in  STD_LOGIC;
        RESET  : in  STD_LOGIC;
        PC_OUT : out STD_LOGIC_VECTOR(3 downto 0)
    );
end PROGRAM_COUNTER;

architecture Behavioral of PROGRAM_COUNTER is

    signal PC_REG : unsigned(3 downto 0) := (others => '0');

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                PC_REG <= (others => '0');
            else
                PC_REG <= PC_REG + 1;
            end if;
        end if;
    end process;

    PC_OUT <= std_logic_vector(PC_REG);

end Behavioral;

