library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

PACKAGE opcodes IS
--conditions
SUBTYPE t_cond IS std_logic_vector(4 DOWNTO 0);

	CONSTANT mov :t_cond :="00000";
	CONSTANT add :t_cond :="00001";
	CONSTANT andd :t_cond :="00011";
	CONSTANT subtr :t_cond :="00010";
	CONSTANT orr :t_cond :="00100";
	CONSTANT nott :t_cond :="00101";
	CONSTANT inc :t_cond :="00110";
	CONSTANT dec :t_cond :="00111";
	CONSTANT sr :t_cond :="01000";
	CONSTANT sl :t_cond :="01001";
	CONSTANT rr :t_cond :="01010";
	CONSTANT jmp :t_cond :="01011";

	CONSTANT jz :t_cond :="01100";	
	CONSTANT jnz :t_cond :="01101";

	CONSTANT call :t_cond :="01110";
	CONSTANT ret :t_cond :="01111";
	CONSTANT nop :t_cond :="10000";
	CONSTANT halt :t_cond :="10001";
	CONSTANT push :t_cond :="10010";
	CONSTANT pop :t_cond :="10011";
	CONSTANT wrt :t_cond :="10101";
	CONSTANT rd :t_cond :="10110";
	CONSTANT movi :t_cond :="10110";
	
	CONSTANT s_mov_sp_r :t_cond :="10111";
	CONSTANT s_mov_r_sp :t_cond :="11000";
	

	--register names
    SUBTYPE t_oreg IS std_logic_vector(2 downto 0);
	CONSTANT A : t_oreg:="000";
	CONSTANT B : t_oreg:="001";
	CONSTANT C : t_oreg:="010";
	CONSTANT D : t_oreg:="011";
	CONSTANT E : t_oreg:="100";
	CONSTANT F : t_oreg:="101";
	CONSTANT G : t_oreg:="110";
	CONSTANT H : t_oreg:="111";

END opcodes;

