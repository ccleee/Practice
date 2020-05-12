
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_divider IS
END test_divider;
 
ARCHITECTURE behavior OF test_divider IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clk_div
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         divclk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal divclk : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clk_div PORT MAP (
          clk => clk,
          rst => rst,
          divclk => divclk
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
	rst_process :process
   begin
		rst <= '1';
		wait for clk_period/2;
		rst <= '0';
		wait;
   end process;


END;
