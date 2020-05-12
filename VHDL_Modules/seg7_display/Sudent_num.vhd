
--2020.5.11 test4 student number display
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Student_num is
port(clk,rst: in STD_LOGIC;
	  key_in: in STD_LOGIC_VECTOR(63 downto 0);
	  seg_sel: out STD_LOGIC_VECTOR(3 downto 0);
	  seg_data: out STD_LOGIC_VECTOR(7 downto 0));
end Student_num;

architecture Behavioral of Student_num  is
component seg_dis
port ( clk: in STD_LOGIC;
       rst: in STD_LOGIC;
       data_in_A: inout STD_LOGIC_VECTOR (15 downto 0);
       data_in_B: inout STD_LOGIC_VECTOR (15 downto 0);
       data_in_C: inout STD_LOGIC_VECTOR (15 downto 0);
       data_in_D: inout STD_LOGIC_VECTOR (15 downto 0);
       seg_sel: out STD_LOGIC_VECTOR (3 downto 0);
       seg_data: out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal dis_A:STD_LOGIC_VECTOR (15 downto 0):=X"0000";
signal dis_B:STD_LOGIC_VECTOR (15 downto 0):=X"0000";
signal dis_C:STD_LOGIC_VECTOR (15 downto 0):=X"0000";
signal dis_D:STD_LOGIC_VECTOR (15 downto 0):=X"0000";

begin 
dis_D <= key_in(15 downto 0);
dis_C <= key_in(31 downto 16);
dis_B <= key_in(47 downto 32);
dis_A <= key_in(63 downto 48);

U1: seg_dis
port map(clk => clk,
			rst => rst,
			data_in_A => dis_A,
			data_in_B => dis_B,
			data_in_C => dis_C,
			data_in_D => dis_D,
			seg_sel => seg_sel,
			seg_data => seg_data);

end Behavioral;



