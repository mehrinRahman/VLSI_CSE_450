library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_gate1 is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end NAND_gate1;

architecture Dataflow of NAND_gate1 is

begin

    Y <= A NAND B;

end Dataflow;
