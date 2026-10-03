library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_8bit is
    Port (
        D    : in  STD_LOGIC_VECTOR(7 downto 0);
        CLK  : in  STD_LOGIC;
        Q    : out STD_LOGIC_VECTOR(7 downto 0);
        Qbar : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Register_8bit;

architecture Structural of Register_8bit is

    component Register_1bit
        Port (
            D    : in  STD_LOGIC;
            CLK  : in  STD_LOGIC;
            Q    : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

begin

    REG0: Register_1bit
        port map (
            D    => D(0),
            CLK  => CLK,
            Q    => Q(0),
            Qbar => Qbar(0)
        );

    REG1: Register_1bit
        port map (
            D    => D(1),
            CLK  => CLK,
            Q    => Q(1),
            Qbar => Qbar(1)
        );

    REG2: Register_1bit
        port map (
            D    => D(2),
            CLK  => CLK,
            Q    => Q(2),
            Qbar => Qbar(2)
        );

    REG3: Register_1bit
        port map (
            D    => D(3),
            CLK  => CLK,
            Q    => Q(3),
            Qbar => Qbar(3)
        );

    REG4: Register_1bit
        port map (
            D    => D(4),
            CLK  => CLK,
            Q    => Q(4),
            Qbar => Qbar(4)
        );

    REG5: Register_1bit
        port map (
            D    => D(5),
            CLK  => CLK,
            Q    => Q(5),
            Qbar => Qbar(5)
        );

    REG6: Register_1bit
        port map (
            D    => D(6),
            CLK  => CLK,
            Q    => Q(6),
            Qbar => Qbar(6)
        );

    REG7: Register_1bit
        port map (
            D    => D(7),
            CLK  => CLK,
            Q    => Q(7),
            Qbar => Qbar(7)
        );

end Structural;
