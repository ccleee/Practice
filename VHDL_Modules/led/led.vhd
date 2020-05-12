
--17030140002 5.09 test2 LED

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity led is
port(clk,dir,en:in std_logic;
		light:out std_logic_vector(7 downto 0));
end led;

architecture RTL of led is
	signal temp:bit_vector(7 downto 0):= "00000001";
begin
	process(dir,clk,en)
	begin
		if(en = '1') then
			if(clk'event and clk = '0') then
				if(dir = '1') then
					temp <= temp rol 1;     --rotate left
				else
					temp <= temp ror 1;     --rotate right
			   end if;			
			light <= TO_STDLOGICVECTOR(temp);    --converse data type and assign
			end if;
		else light <= "00000000";
	   end if;
	end process;
end RTL;

