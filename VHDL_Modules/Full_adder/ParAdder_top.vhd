
--2020.5.11 test3 adderlibrary IEEE;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ParAder_top is
port ( a: in STD_LOGIC_VECTOR (7 downto 0):="00000000";
       b: in STD_LOGIC_VECTOR (7 downto 0):="00000000";
       cin,clk,rst: in STD_LOGIC;
       s: out STD_LOGIC_VECTOR (7 downto 0);
       cout : out STD_LOGIC);
end ParAder_top ;

architecture Behavioral of ParAder_top  is
signal c: STD_LOGIC_VECTOR (7 downto 1);  --every cin
signal p,g: STD_LOGIC_VECTOR (7 downto 0);

begin

	--get the a*b
	g(0)<=a(0) and b(0);
	g(1)<=a(1) and b(1);
	g(2)<=a(2) and b(2);
	g(3)<=a(3) and b(3);
	g(4)<=a(4) and b(4);
	g(5)<=a(5) and b(5);
	g(6)<=a(6) and b(6);
	g(7)<=a(7) and b(7);
	
	--get the a xor b
	p(0)<=a(0) xor b(0);
	p(1)<=a(1) xor b(1);
	p(2)<=a(2) xor b(2);
	p(3)<=a(3) xor b(3);
	p(4)<=a(4) xor b(4);
	p(5)<=a(5) xor b(5);
	p(6)<=a(6) xor b(6);
	p(7)<=a(7) xor b(7);
	
	--get the cin(x) = a*b + (a xor b)*cin(x-1)
	c(1)<=g(0) or (p(0) and cin);
	c(2)<=g(1) or (p(1) and (g(0) or (p(0) and cin)));
	c(3)<=g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))));
	c(4)<=g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))))));
	c(5)<=g(4) or (p(4) and (g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))))))));
	c(6)<=g(5) or (p(5) and (g(4) or (p(4) and (g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))))))))));
	c(7)<=g(6) or (p(6) and (g(5) or (p(5) and (g(4) or (p(4) and (g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))))))))))));
	cout<=c(7);
	
	--get the sum = a xor b xor cin(x)
	s(0)<=p(0) xor cin;
	s(1)<=p(1) xor c(1);
	s(2)<=p(2) xor c(2);
	s(3)<=p(3) xor c(3);
	s(4)<=p(4) xor c(4);
	s(5)<=p(5) xor c(5);
	s(6)<=p(6) xor c(6);
	s(7)<=p(7) xor c(7);
	
end Behavioral;

