
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity addsub16 is port(
	sub: in std_logic;
	in1,in2: in std_logic_vector(15 downto 0);
	output: out std_logic_vector(15 downto 0)
	);
end addsub16;

architecture imp of addsub16 is
begin
	with sub select output <=
	in1-in2 when '1',
	in1+in2 when '0',
	(others=>'Z') when others;
end imp;
