library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.u311.all;

entity LE16 is port(
	S: in std_logic_vector(2 downto 0);
	A, B: in std_logic_vector(15 downto 0);
	x: out std_logic_vector(15 downto 0)
	);
end LE16;

architecture imp of LE16 is

begin
	LE16X: for I in 0 to 15 generate
		LEX: LE port map(S, A(I), B(I), X(I));
	end generate LE16X;
end imp;
