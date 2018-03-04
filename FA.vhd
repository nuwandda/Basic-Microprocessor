
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FA is port(
	carryIn: in std_logic;
	carryOut: out std_logic;
	x,y : in std_logic;
	s : out std_logic
	);
end FA;

architecture imp of FA is
begin
	s <= x xor y xor carryIn;
	carryOut <= (x and y) or (carryIn and (x or y));
end imp ;