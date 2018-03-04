
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_gen is 
	port(
		clk : out std_logic
	);
end clk_gen;

architecture Behavioral of clk_gen is
	constant clk_period : time := 1 us;
begin
	clk_process : process
	begin
		clk <= '0';
		wait for clk_period/2; --for 0.5 us signal is '0'.
		clk <= '1';
		wait for clk_period/2; --for next 0.5 us signal is '1'.
	end process;
end Behavioral;
	


