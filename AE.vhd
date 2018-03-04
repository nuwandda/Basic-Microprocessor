library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity AE is port(
	S: in std_logic_vector(2 downto 0);
	a, b: in std_logic;
	x: out std_logic
	);
end AE;


architecture imp of AE is
begin

	process(S,b)
		begin

			case S is
				when "100" => x <= b;
				when "101" => x <= not b;
				when "110" => x <= '0';
				when "111" => x <= '1';
				when others => x <= '0';
			end case;

	end process;
end imp;

