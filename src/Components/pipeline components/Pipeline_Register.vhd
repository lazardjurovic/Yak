library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipeline_register is

generic(
	msb : integer := 63
);

port(
	
	clk : std_logic;
	input_signal : in std_logic_vector( msb downto 0);
	output_signal  : out std_logic_vector( msb downto 0);
	reset : in std_logic;
	enable : in std_logic

);

end pipeline_register;

architecture Behavioral of pipeline_register is

	signal state : std_logic_vector( msb downto 0);

begin

	reg_process : process(clk,reset)
	begin
	
		if reset = '1' then
			state <= (others => '0');
		elsif rising_edge(clk) then
			
			if enable = '1' then
				state <= input_signal;
			end if;
		
		end if;
		
	end process;
	
	output_signal <= state;

end Behavioral;

