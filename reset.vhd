
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rst_gen is 
	port (
		reset : out std_logic
	);
end rst_gen;

 architecture Behavioral of rst_gen is
	 constant rst_period : time := 100 ns;
begin
	 reset <= '1' after 0 ns, '0' after rst_period;

end Behavioral;
