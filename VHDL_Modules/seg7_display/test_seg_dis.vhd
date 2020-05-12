
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_seg_dis IS
END test_seg_dis;
 
ARCHITECTURE behavior OF test_seg_dis IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seg_dis
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         data_in_A : INOUT  std_logic_vector(15 downto 0);
         data_in_B : INOUT  std_logic_vector(15 downto 0);
         data_in_C : INOUT  std_logic_vector(15 downto 0);
         data_in_D : INOUT  std_logic_vector(15 downto 0);
         seg_sel : OUT  std_logic_vector(3 downto 0);
         seg_data : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

	--BiDirs
   signal data_in_A : std_logic_vector(15 downto 0);
   signal data_in_B : std_logic_vector(15 downto 0);
   signal data_in_C : std_logic_vector(15 downto 0);
   signal data_in_D : std_logic_vector(15 downto 0);

 	--Outputs
   signal seg_sel : std_logic_vector(3 downto 0);
   signal seg_data : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seg_dis PORT MAP (
          clk => clk,
          rst => rst,
          data_in_A => data_in_A,
          data_in_B => data_in_B,
          data_in_C => data_in_C,
          data_in_D => data_in_D,
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
   stim_proc: process
   begin		
		rst <= '1';
      wait for clk_period*10;
		rst <= '0';
      wait;
   end process;

END;
