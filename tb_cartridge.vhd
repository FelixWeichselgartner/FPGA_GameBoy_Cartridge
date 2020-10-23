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

    CONSTANT T : TIME := 10 ns; -- clock period
    
    SIGNAL address : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL data : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 : std_logic;
    SIGNAL wr, rd, cs, clk, rst : STD_LOGIC;
    SIGNAL d0, d1, d2, d3, d4, d5, d6, d7 : STD_LOGIC;

    COMPONENT cartridge IS
        PORT (
            a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 : IN STD_LOGIC;
            wr, rd, cs, clk, rst : IN STD_LOGIC;
            d0, d1, d2, d3, d4, d5, d6, d7 : OUT STD_LOGIC);
    END COMPONENT;

BEGIN

    dut : cartridge
    PORT MAP(
        a0 => a0, a1 => a1, a2 => a2, a3 => a3, a4 => a4, a5 => a5, a6 => a6, a7 => a7,
        a8 => a8, a9 => a9, a10 => a10, a11 => a11, a12 => a12, a13 => a13, a14 => a14, a15 => a15,
        d0 => d0, d1 => d1, d2 => d2, d3 => d3, d4 => d4, d5 => d5, d6 => d6, d7 => d7,
        wr => wr, rd => rd, cs => cs, clk => clk, rst => rst
    );

    -- test procedure
    PROCESS
    BEGIN
    
        rd <= '1';
        wr <= '1';
        cs <= '1';
        clk <= '1';
        rst <= '1';
        address <= "0000000000000001";
        wait for 1ns;
        a0 <= address(0);
        a1 <= address(1);
        a2 <= address(2);
        a3 <= address(3);
        a4 <= address(4);
        a5 <= address(5);
        a6 <= address(6);
        a7 <= address(7);
        a8 <= address(8);
        a9 <= address(9);
        a10 <= address(10);
        a11 <= address(11);
        a12 <= address(12);
        a13 <= address(13);
        a14 <= address(14);
        a15 <= address(15);
        rd <= '0';
        wait for T/2;
        rd <= '1';
        data <= d7 & d6 & d5 & d4 & d3 & d2 & d1 & d0;
        wait for T;
        
        ASSERT data = x"0C"
        REPORT "data is not correct."
            SEVERITY FAILURE;

        WAIT;
    END PROCESS;

END Behavioral;