
--2020.5.11 test4 data-conversion

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity data2seg is

port(data_in: in STD_LOGIC_VECTOR(3 downto 0):=x"1";
		seg_data: out STD_LOGIC_VECTOR(7 downto 0));
end data2seg;

architecture Behavioral of data2seg is
begin
with data_in select
											--a b c d e f g dp
	seg_data <= x"FC" when x"0", 	--1 1 1 1 1 1 0 0
					x"60" when x"1", 	--0 1 1 0 0 0 0 0
					x"DA" when x"2",	--1 1 0 1 1 0 1 0
					x"F2" when x"3",	--1 1 1 1 0 0 1 0
					x"66" when x"4",  --0 1 1 0 0 1 1 0
					x"B6" when x"5",  --0 1 0 1 0 1 1 0
					x"BE" when x"6",	--1 0 1 1 1 1 1 0
					x"E0" when x"7",	--1 1 1 0 0 0 0 0
					x"FE" when x"8",	--1 1 1 1 1 1 1 0
					x"F6" when x"9",	--1 1 1 1 0 1 1 0
					x"EE" when x"A",  --1 1 1 0 1 1 1 0
					x"3E" when x"B",	--0 0 1 1 1 1 1 0
					x"9E" when x"C",  --1 0 0 1 1 1 1 0
					x"6B" when x"D",	--0 1 1 1 1 1 0 0
					x"3E" when x"E",	--0 0 1 1 1 1 1 0
					x"1E" when x"F",	--0 0 0 1 1 1 1 0
					x"00" when others;
end Behavioral;

