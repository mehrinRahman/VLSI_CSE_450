library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Accumulator_4bit is
    Port (
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Accumulator_4bit;

architecture structural of Accumulator_4bit is

    -- 4-bit Adder component
    component adder_4bit
        Port (
            A   : in  STD_LOGIC_VECTOR(3 downto 0);
            B   : in  STD_LOGIC_VECTOR(3 downto 0);
            SUM : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- 4-bit Register component
    component Register_4bit
        Port (
            D     : in  STD_LOGIC_VECTOR(3 downto 0);
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            Q     : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Internal signal connecting Adder to Register
    signal SUM : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Adder
    U1: adder_4bit
        port map (
            A   => A,
            B   => B,
            SUM => SUM
        );

    -- Register
    U2: Register_4bit
        port map (
            D     => SUM,
            CLK   => CLK,
            RESET => RESET,
            Q     => Q
        );

end structural;
