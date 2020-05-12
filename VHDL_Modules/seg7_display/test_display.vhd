
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_display IS
END test_display;
 
ARCHITECTURE behavior OF test_display IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Student_num
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         key_in : IN  std_logic_vector(63 downto 0);
         seg_sel : OUT  std_logic_vector(3 downto 0);
         seg_data : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal key_in : std_logic_vector(63 downto 0) := x"0000017030140002";

 	--Outputs
   signal seg_sel : std_logic_vector(3 downto 0);
   signal seg_data : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Student_num PORT MAP (
          clk => clk,
          rst => rst,
          key_in => key_in,
          seg_sel => seg_sel,
          seg_data => seg_data
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
   rst_proc: process
    begin
		rst <= '1';
		wait for clk_period/2;
		rst <= '0';
		wait;
   end process;
	
--	key_proc: process
--    begin
--		rst <= '0';
--		wait for clk_period/2;
--		rst <= '1';
--		wait;
--   end process;

END;
