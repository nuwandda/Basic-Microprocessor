-- buf2.vhd: Bidirectional Buffer
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity buf2 is port(
	enable: in std_logic;
	direction: in std_logic;
	input : inout std_logic_vector (15 downto 0);
	output: inout std_logic_vector(15 downto 0)
	);
end buf2;

architecture imp of buf2 is
begin
	Bproc:process(enable,direction,input,output)
		begin
			if(enable='1' and direction='1') then output <= input;
			elsif(enable='1' and direction='0') then input <= output;
			else input <= (others=>'Z'); output<=(others=>'Z');
			end if;
		end process;
end imp;

