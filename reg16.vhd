library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

ENTITY reg16 IS PORT(
	d : IN std_logic_vector(15 DOWNTO 0);
 	ld : IN std_logic; -- load/enable.
 	clr : IN std_logic; -- async. clear.
 	clk : IN std_logic; -- clock.
 	q : OUT std_logic_vector(15 DOWNTO 0) -- output
 );
 END reg16;

 ARCHITECTURE description OF reg16 IS

 BEGIN
 	process(clk, clr)
 	begin
 		if clr = '1' then
 			q <= x"0000";
 		elsif rising_edge(clk) then
			if ld = '1' then
				q <= d;
			end if;
		end if;
	end process;
END description;

