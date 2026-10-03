library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_gate1 is
    Port (
        A : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end NOT_gate1;

architecture Dataflow of NOT_gate1 is

begin

    Y <= NOT A;

end Dataflow;
