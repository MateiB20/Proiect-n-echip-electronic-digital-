library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;        
entity counter_and_parallel_register is
port(     
clk : in STD_LOGIC;          
ud_in : in STD_LOGIC;        
load : in STD_LOGIC;
x: in STD_LOGIC;           
y: in STD_LOGIC;
reset_pr : in STD_LOGIC;
reset_in : in STD_LOGIC;
D_IN : in STD_LOGIC_VECTOR (7 downto 0);
D_OUT : out STD_LOGIC_VECTOR (7 downto 0)
);
end counter_and_parallel_register;
architecture Behavioral of counter_and_parallel_register is
signal D : std_logic_vector(7 downto 0);
signal Q : std_logic_vector(7 downto 0);
begin
	process(clk, reset_pr)
	begin
		if (reset_pr = '1') then
			Q <= (others => '0');
		else 
		   if (rising_edge(clk)) then
		      if (x = '1' and y = '0') then
				    if load = '1' then
				        Q <= D_IN;
				        D <= D_IN;
				    end if;
	          elsif (y = '1' and x = '0') then
                    if reset_in = '1' then
		                  Q <= (others => '0');
                    else 
                    if (ud_in = '1') then
                        D <=  D + 1;
                    else
                        D <=  D - 1;                        
                    end if; 
                    Q <= D; 
                    end if; 
               end if;
            end if;              
        end if;                         
    end process; 
    D_OUT <= Q;
end Behavioral;