
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FIFO is
 generic(M:integer:=8;
             N:integer:=8);                  
    port(clk,reset,wr,rd:IN std_logic;
         din:IN std_logic_vector(N-1 downto 0);
         dout:OUT std_logic_vector(N-1 downto 0);
         full,empty:OUT std_logic);
end FIFO;

architecture Behavioral of FIFO is
TYPE memory IS ARRAY(0 to M-1) OF std_logic_vector(N-1 downto 0); 
signal ram:MEMORY;
signal wp,rp:INTEGER range 0 to M-1;
signal is_full,is_empty:STD_LOGIC;

begin
    full<=is_full;
    empty<=is_empty;
	 
    PROCESS(clk)                    
       begin
           if rising_edge(clk)then
              if(wr='0' and is_full='0')then
                  ram(wp)<=din;
              
              elsif(rd='0' and is_empty='0')then
                  dout<=ram(rp);
              end if;
           end if;
    end process;
	 
    process(clk,reset)
       begin
           if(reset='1')then
              wp<=0;
           elsif rising_edge(clk)then
              if(wr='0' and is_full='0')then
                  if(wp=w-1)then
                     wp<=0;
                  else
                     wp<=wp+1;
                  end if;
              end if;
           end if;
       end process;
    
    process(clk,reset)
       begin
           if(reset='1')then
              rp<=0;
           elsif rising_edge(clk)then
              if(rd='0' and is_empty='0')then
                  if(rp=w-1)then
                     rp<=0;
                  else
                     rp<=rp+1;
                  end if;
              end if;
           end if;
    end process;
    
    process(clk,reset)
       begin
           if(reset ='1')then
              is_empty<='1';
           elsif rising_edge(clk)then
				  if((rp=w-1 and wp=0)or(rp=wp-1))and(rd='0')then
                     is_empty<='1';
              elsif(is_empty='1' and wr='0')then
                     is_empty<='0';
              end if;
           end if;
    end process;
    
    process(clk,reset)
       begin
           if(reset='1')then
              is_full<='0';
           elsif rising_edge(clk)then
              if((wp=w-1 and rp=0)or(wp=rp-1))and(wr='0')then
                  is_full<='1';
              elsif(is_full='1' and rd='0')then
                  is_full<='0';
              end if;
           end if;
    end process;
end Behavioral;

