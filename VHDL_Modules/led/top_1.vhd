
--17030140002 5.10 test2 led-top
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top_1 is
Port(clk,dir,en,rst:in STD_LOGIC;
	  light:out STD_LOGIC_VECTOR(7 downto 0));
end top_1;

architecture Behavioral of top_1 is

component clk_div
Port(clk:in STD_LOGIC;
	  rst:in STD_LOGIC;
	  divclk:out STD_LOGIC);
end component;

component led
port(clk,dir,en:in STD_LOGIC;
		light:out STD_LOGIC_VECTOR(7 downto 0));
end component;
  signal clk_wire:STD_LOGIC;     
begin
	u1:clk_div
		port map(clk => clk,
					rst => rst,
					divclk => clk_wire);
	u2:led
		port map(clk => clk_wire,
					en => en,
					dir => dir,
					light => light);
end Behavioral;

