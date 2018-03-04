library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.u311.AE;

entity AE16 is port(
	S: in std_logic_vector(2 downto 0);
	A, B: in std_logic_vector(15 downto 0);
	Y: out std_logic_vector(15 downto 0)
	);
end AE16;

architecture imp of AE16 is

begin
	AE16X: for I in 0 to 15 generate
		AEX: AE port map(S, A(I), B(I), Y(I));
	end generate AE16X;

end imp;
