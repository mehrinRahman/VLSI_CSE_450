library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Accumulator is
    Port (
        CLK      : in  STD_LOGIC;
        RESET    : in  STD_LOGIC;
        ACC_LOAD : in  STD_LOGIC;
        DATA_IN  : in  STD_LOGIC_VECTOR(7 downto 0);
        ACC_OUT  : out STD_LOGIC_VECTOR(7 downto 0);
        Z_FLAG   : out STD_LOGIC
    );
end Accumulator;
 
architecture Behavioral of Accumulator is
 
    signal ACC_REG : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
 
begin
 
    -- Synchronous, active-high reset (RESET has priority)
    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                ACC_REG <= (others => '0');
            elsif ACC_LOAD = '1' then
                ACC_REG <= DATA_IN;
            end if;
        end if;
    end process;
 
    ACC_OUT <= ACC_REG;
 
    Z_FLAG <= '1' when ACC_REG = "00000000" else '0';
 
end Behavioral;
 