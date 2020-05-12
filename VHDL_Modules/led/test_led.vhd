
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_led IS
END test_led;
 
ARCHITECTURE behavior OF test_led IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT led
    PORT(
         clk : IN  std_logic;
         dir : IN  std_logic;
         en : IN  std_logic;
         light : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal dir : std_logic := '0';
   signal en : std_logic := '1';

 	--Outputs
   signal light : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: led PORT MAP (
          clk => clk,
          dir => dir,
          en => en,
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
      wait for clk_period*8;
		dir <= '0';
		wait for clk_period*8;
      -- insert stimulus here 
   end process;
	

END;
