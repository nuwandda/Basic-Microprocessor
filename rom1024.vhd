library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.u311.all;
use work.opcodes.all;

entity rom1024 is port(
	cs : in std_logic;
	oe : in std_logic;
	addr : in std_logic_vector (9 downto 0);
	data : out std_logic_vector (15 downto 0)
	);
end rom1024;

architecture imp of rom1024 is
subtype cell is std_logic_vector(15 downto 0);
type rom_type is array(0 to 12) of cell;

-- Our program stored in the memory
constant ROM : rom_type :=(
	movi&A&"00000011",
	movi&B&"00000011",
	movi&C&"00000001",
	movi&D&"00000001",
	movi&E&"00000000",
	call&"00000000001",
	nop&"00000000000",
	add&C&C&D&"00",
	dec&A&A&"00000",
	dec&B&B&"00000",
	jnz&"10000000110",
	wrt&"000"&E&C&"00",
	nop&"00000000000"
		
--	push&"000000"&A&"00",
--	call&"00000000001",
--	jnz&"10000000011"
--	push&"000000"&A&"00",
--	pop&B&"00000000",
--	nop&"00000000000",
--	X"b0ff",-- movi a stack
--	X"b800",-- mov sp a
--	X"136c",-- sub d d d
--	X"0460",-- mov e d
--	X"b208",-- movi c size
--	X"580f",-- jmp _main
--	X"0000",
--X"0000",
--X"0000",
--X"0000",
--	X"0000",
--X"0000",
--X"0000",
--X"0000",
--X"0000",
--X"a070",-- L write d e
--X"3360",-- inc d
--movi&C&"00001111",--15
--add&D&C&A&"00",
--ret&"00000000000",
--nop&"00000000000"
--	X"3a40",-- dec c
--	X"6c10",-- jnz L
--	X"7800",-- ret
--	X"0760",-- _main mov h d
--	X"b6aa",-- movi g 0xAA
--	X"a0bc",-- write g h
--	X"5c03",-- jmp _main
	--X"8800" -- halt
);

begin
	process(cs, oe, addr)
	begin
		if (cs='0' and oe='1') then
			data <= ROM(conv_integer(addr));
		else data <= (others=>'Z');
		end if;
	end process;
end imp;
