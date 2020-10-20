----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 20.10.2020
-- Design Name:
-- Module Name:
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_cartridge IS
    --  Port ( );
END tb_cartridge;

ARCHITECTURE Behavioral OF tb_cartridge IS

    CONSTANT T : TIME := 100 ns; -- clock period

    COMPONENT adder IS
        PORT (
            a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 : IN STD_LOGIC;
            wr, rd, cs, clk, rst : IN STD_LOGIC;
            d0, d1, d2, d3, d4, d5, d6, d7 : OUT STD_LOGIC);
    END COMPONENT;

BEGIN

    dut : adder
    PORT MAP(
        a0 => a0, a1 => a1, a2 => a2, a3 => a3, a4 => a4, a5 => a5, a6 => a6, a7 => a7,
        a8 => a8, a9 => a9, a10 => a10, a11 => a11, a12 => a12, a13 => a13, a14 => a14, a15 => a15,
        d0 => d0, d1 => d1, d2 => d2, d3 => d3, d4 => d4, d5 => d5, d6 => d6, d7 => d7,
        wr => wr, rd => rd, cs => cs, clk => clk, rst => rst
    );

    -- test procedure
    PROCESS
    BEGIN

        --ASSERT statement
        --REPORT "is not correct."
        --SEVERITY FAILURE;

        WAIT;
    END PROCESS;

END Behavioral;