library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Inst_Memory is

	port(
		
		clk : in std_logic;
		read_address  : in std_logic_vector( 31 downto 0);
		mem_output : out std_logic_vector( 31 downto 0)
	
	);

end Inst_Memory;

architecture Behavioral of Inst_Memory is

type Memory_Content is array ( 0 to 255) of std_logic_vector(31 downto 0);
signal mem : Memory_Content := (others => (others => '0'));

begin

mem(0) <= (others => '1');

	mem_proc : process(clk)
	begin
		
		if rising_edge(clk) then
			
			mem_output <= mem(to_integer(unsigned(read_address)));
			
		end if;
		
	end process;


end Behavioral;

