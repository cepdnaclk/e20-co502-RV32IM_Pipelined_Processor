-- Create by BG
-- Created on Fri, 03 Jan 2025 at 08:54 PM
-- Last modified on Fri, 03 Jan 2025 at 10:37 PM
-- This is the Pipelined Register (EX/MEM) module for RV32IM Piplined Processor

-------------------------------------------------------------------
--                        REGISTER EX/MEM                        --
-------------------------------------------------------------------
-- The EX/MEM register with 6 input streams and 4 output stream. --
-- Registers: CONTROLS, ALURESULT                                --
-- Completed for R-Type Instructions                             --
-------------------------------------------------------------------

-- Libraries (IEEE)
library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

-- EX/MEM Entity
entity REG_EX_MEM is
  port (
    -- Signal Ports
    RESET, CLK  : in std_logic;

    -- Input Ports
    WriteEnable_I : in std_logic;
    RD_I          : in std_logic_vector (4 downto 0);
    FUNC3_I       : in std_logic_vector (2 downto 0);
    ALURESULT_I   : in std_logic_vector (31 downto 0);

    -- Output Ports
    WriteEnable_O : out std_logic;
    RD_O          : out std_logic_vector (4 downto 0);
    FUNC3_O       : out std_logic_vector (2 downto 0);
    ALURESULT_O   : out std_logic_vector (31 downto 0)
  );
end REG_EX_MEM ; 

-- EX/MEM Architecture
architecture EX_MEM_Architecture of REG_EX_MEM is
    -- Internal Registers
    --Signal CONTROLS, ALURESULT : std_logic_vector (31 downto 0);
    begin
        process (CLK)
        begin
            if rising_edge(CLK) then
                -- RESET REGISTER
                if (RESET = '1') then
                    -- RESET MEMORY
                    --CONTROLS  <= (others => '0');
                    --ALURESULT <= (others => '0');

                    -- RESET OUTPUTS
                    WriteEnable_O <= '0';
                    RD_O          <= (others => '0');
                    FUNC3_O       <= (others => '0');
                    ALURESULT_O   <= (others => '0');
                
                else
                    -- Memory send to the outputs
                    --WriteEnable_O <= CONTROLS(4);
                    --RD_O          <= CONTROLS(31 downto 27);
                    --FUNC3_O       <= CONTROLS(26 downto 24);
                    WriteEnable_O <= WriteEnable_I;
                    RD_O          <= RD_I;
                    FUNC3_O       <= FUNC3_I;
                    ALURESULT_O   <= ALURESULT_I;

                    -- Memory update with new inputs
                    --CONTROLS  <= std_logic_vector(RD_I & FUNC3_I & "0000000000000000000" & WriteEnable_I & "0000");
                    --ALURESULT <= ALURESULT_I;
                end if;
                               
            end if;

        end process;

end architecture ;
