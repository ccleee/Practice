
--17030140002 2020.5.09 test1 encoder_38

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_38 is
port(sel:in std_logic_vector(2 downto 0);			--input number
		--en1,en2,en3:in std_logic;
		en:in std_logic;                          --enabling end
		code:out std_logic_vector(7 downto 0));   --decode result output
end encoder_38;

architecture RTL of encoder_38 is
	--signal en:std_logic_vector(2 downto 0);    --enable result
begin
	--en<=en1&en2&en3;
process(sel,en)
begin
	if(en = '1') then    --if enable   
		case sel is
			when "000" => code<="00000001";
			when "001" => code<="00000010";
			when "010" => code<="00000100";
			when "011" => code<="00001000";
			when "100" => code<="00010000"; 
			when "101" => code<="00100000";
			when "110" => code<="01000000";
			when "111" => code<="10000000";
			when others => code<="00000000";
		end case;
	else                --if disable,output high-impedance
		code<="ZZZZZZZZ";
	end if;
	end process;
end RTL;

