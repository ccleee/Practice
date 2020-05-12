
--17030140002

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_38 IS
END test_38;
 
ARCHITECTURE behavior OF test_38 IS 
 
    COMPONENT encoder_38
    PORT(
         sel : IN  std_logic_vector(2 downto 0);
         en : IN  std_logic;
         code : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(2 downto 0) := (others => '0');
   signal en : std_logic := '1';

 	--Outputs
   signal code : std_logic_vector(7 downto 0);
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: encoder_38 PORT MAP (
          sel => sel,
          en => en,
          code => code
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
      sel<="000";
		wait for 100ns;
		sel<="001";
		wait for 100ns;
		sel<="010";
		wait for 100ns;
		sel<="011";
		wait for 100ns;
		sel<="100";
		wait for 100ns;
		sel<="101";
		wait for 100ns;
		sel<="110";
		wait for 100ns;
		sel<="111";
      wait for 100ns;

      -- insert stimulus here 

      --wait;
   end process;

END;
