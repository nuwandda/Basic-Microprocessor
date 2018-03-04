library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity LE is port(
	S: in std_logic_vector(2 downto 0);
	a, b: in std_logic;
	x: out std_logic
	);
end LE;

architecture imp of LE is
begin
	process(S,a,b)
	begin
		case S is
			when "000" => x <= a;
			when "001" => x <= a and b;
			when "010" => x <= a or b;
			when "011" => x <= not a;
			when others => x <= a;
		end case;
	end process;
end imp;

