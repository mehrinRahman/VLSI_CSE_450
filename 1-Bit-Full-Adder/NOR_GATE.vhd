library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOR_GATE is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end NOR_GATE;

architecture Behavioral of NOR_GATE is

begin

    Y <= A NOR B;

end Behavioral;