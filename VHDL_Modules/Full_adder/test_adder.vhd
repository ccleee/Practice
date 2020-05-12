
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_adder IS
--port( clk,rst: in STD_LOGIC:='0');
END test_adder;
 
ARCHITECTURE behavior OF test_adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ParAder_top
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         cin,clk,rst : IN  std_logic;
         s : OUT  std_logic_vector(7 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
	signal clk:  STD_LOGIC :='0';
	signal rst:  STD_LOGIC :='0';
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal cin : std_logic := '0';


 	--Outputs
   signal s : std_logic_vector(7 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	
   constant clock_period: time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ParAder_top PORT MAP (
			 clk => clk,
			 rst => rst,
          a => a,
          b => b,
          cin => cin,
          s => s,
          cout => cout
        );

	clk_proc:process
	begin
	clk <= '1';
	wait for clock_period/2;
	clk <= '0';
	wait for clock_period/2;
	end process;
	
   -- Stimulus process
	process(clk,rst)
	begin
		if(rst = '1') then	--init signal
			a <= (others => '0');    
			b <= (others => '0');
		elsif(clk'event and clk = '1') then   -- a++ when clk rise
			a <= a + '1';
	   elsif(clk'event and clk = '0') then   -- b++ when clk fall
			b <= b + '1';
		end if;
	end process;	
END;
