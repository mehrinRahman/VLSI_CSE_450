library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity CPU is
    Port (
        CLK     : in  STD_LOGIC;
        RESET   : in  STD_LOGIC;
        ACC_OUT : out STD_LOGIC_VECTOR(7 downto 0);
        Z_FLAG  : out STD_LOGIC;
        PC_OUT  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end CPU;
 
architecture Structural of CPU is
 
    -- Internal signals
    signal PC_ADDRESS : STD_LOGIC_VECTOR(3 downto 0);
    signal INSTR      : STD_LOGIC_VECTOR(11 downto 0);
 
    signal OPCODE     : STD_LOGIC_VECTOR(3 downto 0);
    signal IMM_DATA   : STD_LOGIC_VECTOR(7 downto 0);
 
    signal ALU_SEL    : STD_LOGIC_VECTOR(3 downto 0);
    signal ACC_LOAD   : STD_LOGIC;
    signal IMM_SEL    : STD_LOGIC;
 
    signal ALU_OUT    : STD_LOGIC_VECTOR(7 downto 0);
    signal ALU_ZERO   : STD_LOGIC;
 
    signal ACC_VALUE  : STD_LOGIC_VECTOR(7 downto 0);
    signal ACC_DATA   : STD_LOGIC_VECTOR(7 downto 0);
 
begin
 
    -- 1. Program Counter
    PC_UNIT: entity work.PROGRAM_COUNTER
        port map (
            CLK    => CLK,
            RESET  => RESET,
            PC_OUT => PC_ADDRESS
        );
 
    -- 2. Program ROM
    ROM_UNIT: entity work.Program_ROM
        port map (
            ADDRESS     => PC_ADDRESS,
            INSTRUCTION => INSTR
        );
 
    -- 3. Instruction Decoder
    OPCODE   <= INSTR(11 downto 8);
    IMM_DATA <= INSTR(7 downto 0);
 
    -- 4. Control Unit
    CU_UNIT: entity work.Control_Unit
        port map (
            OPCODE   => OPCODE,
            ALU_SEL  => ALU_SEL,
            ACC_LOAD => ACC_LOAD,
            IMM_SEL  => IMM_SEL
        );
 
    -- 5. ALU
    ALU_UNIT: entity work.ALU
        port map (
            A          => ACC_VALUE,
            B          => IMM_DATA,
            ALU_SELECT => ALU_SEL,
            RESULT     => ALU_OUT,
            ZERO       => ALU_ZERO
        );
 
    -- 6. Select immediate data or ALU result
    ACC_DATA <= IMM_DATA when IMM_SEL = '1'
                else ALU_OUT;
 
    -- 7. Accumulator
    ACC_UNIT: entity work.Accumulator
        port map (
            CLK      => CLK,
            RESET    => RESET,
            ACC_LOAD => ACC_LOAD,
            DATA_IN  => ACC_DATA,
            ACC_OUT  => ACC_VALUE,
            Z_FLAG   => Z_FLAG
        );
 
    -- CPU outputs
    ACC_OUT <= ACC_VALUE;
    PC_OUT  <= PC_ADDRESS;
 
end Structural;
 