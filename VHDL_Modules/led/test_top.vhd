
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_top IS
END test_top;
 
ARCHITECTURE behavior OF test_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_1
    PORT(
         clk : IN  std_logic;
         dir : IN  std_logic;
         en : IN  std_logic;
         rst : IN  std_logic;
         light : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal dir : std_logic := '0';
   signal en : std_logic := '1';
   signal rst : std_logic := '0';

 	--Outputs
   signal light : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_1 PORT MAP (
          clk => clk,
          dir => dir,
          en => en,
          rst => rst,
          light => light
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		dir <= '1';
      wait for clk_period*25000;
		dir <= '0';
		wait for clk_period*25000;
   end process;
	
	rst_process :process
   begin
		rst <= '1';
		wait for clk_period/2;
		rst <= '0';
		wait;
   end process;


END;
