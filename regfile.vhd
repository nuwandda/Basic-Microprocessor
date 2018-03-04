library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity regfile is port(
	clk: in std_logic;	--clock
	reset: in std_logic;	
	we: in std_logic;	--write enable
	WA: in std_logic_vector(2 downto 0);	--write address
	D: in std_logic_vector(15 downto 0);	
	rbe: in std_logic;	--read enable line for port B
	rae: in std_logic;	--read enable line for port A
	RAA: in std_logic_vector(2 downto 0); --read address select lines for port A
	RBA: in std_logic_vector(2 downto 0); --read address select lines for port B	
	portA: out std_logic_vector(15 downto 0);	--output port A
	portB: out std_logic_vector(15 downto 0));	--output port B
end regfile;

architecture imp of regfile is
	subtype reg is std_logic_vector(15 downto 0);
	type regArray is array(0 to 7) of reg;
	signal RF: regArray;	--register file contents
begin
WritePort:Process(clk,reset)
begin
	if(reset='1') then
		for I in 0 to 7 loop
			RF(I) <= (others => '0');
		end loop;
	elsif(we='1') then
		RF(conv_integer(WA)) <= D;
	end if;
end process;

ReadPortA: Process(rae,RAA)
begin
	if(rae='1') then
		PortA <= RF(conv_integer(RAA));	--convert bit VECTOR to integer
	else
		PortA <=(others =>'Z');
	end if;
end process;

ReadPortB: Process(rbe,RBA)
begin
	if(rbe='1') then
		PortB <= RF(conv_integer(RBA)); -- convert bit VECTOR to integer
	else
		PortB <=(others =>'Z');
end if;
end process;

end imp;

