
--17030140002 5.09 test2 clock-devider

--even frequncy divider;
--output 1khz; 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clk_div is
Port(clk:in STD_LOGIC;
	  rst:in STD_LOGIC;
	  divclk:out STD_LOGIC);
end clk_div;

architecture Behavioral of clk_div is
signal counter: STD_LOGIC_VECTOR(15 downto 0);
signal clk_temp: STD_LOGIC:='0';
begin

process(clk,rst)
begin
	if(rst='1') then
		counter <= x"0000";
		clk_temp <= '0';
	elsif (clk'event and clk = '1') then
		if(counter = x"61a7") then   --(50M/1K)/2-1 = 24999 -> x"61a7"
		counter <=(others=>'0');
		clk_temp<= not clk_temp;  --output reverse
		else
		counter <= counter+1;
		clk_temp <= clk_temp;
		end if;
	end if;
end process;
divclk <= clk_temp;
end Behavioral;

