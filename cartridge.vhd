
LIBRARY ieee;
USE ieee.std_logic_1164.ALL; -- to use std_logic / std_logic_vector
USE ieee.numeric_std.ALL; -- to use arithmetic functions
--USE ieee.std_logic_unsigned.ALL; -- add std_logic_vectors

ENTITY cartridge IS
    -- all ports of type std_logic / std_logic_vector
    PORT (
        a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 : IN STD_LOGIC;
        wr, rd, cs, clk, rst : IN STD_LOGIC;
        d0, d1, d2, d3, d4, d5, d6, d7 : OUT STD_LOGIC);
END cartridge;

ARCHITECTURE arch OF cartridge IS
    TYPE rom IS ARRAY (0 TO 32767) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    CONSTANT gbrom : rom := (
        -- insert rom here
    );

    SIGNAL address : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
    SIGNAL data : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');
BEGIN

    address <= a15 & a14 & a13 & a12 & a11 & a10 & a9 & a8 & a7 & a6 & a5 & a4 & a3 & a2 & a1 & a0;

    -- combinatorical logic
    PROCESS (wr, rd)
    BEGIN
        IF falling_edge(rd) THEN
            data <= gbrom(to_integer(unsigned(address)));
        END IF;
    END PROCESS;

    d7 <= data(7);
    d6 <= data(6);
    d5 <= data(5);
    d4 <= data(4);
    d3 <= data(3);
    d2 <= data(2);
    d1 <= data(1);
    d0 <= data(0);

END arch;