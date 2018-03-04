library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.u311.all;

entity datapath is port(
	clk: in std_logic; --********
	reset : in std_logic;
	pcen, den, dir, aen: in std_logic;
	SPload, PCload, IRload: in std_logic;
	Psel, Ssel, Rsel, Osel : in std_logic_vector(1 downto 0);
	sub2: in std_logic;
	jmpMux : in std_logic;
	IR : out std_logic_vector (4 downto 0);
	zero: out std_logic;
	ALUsel : in std_logic_vector (4 downto 0); --********
	we, rae, rbe : in std_logic; --********
	Buf2_out: out std_logic_vector(15 downto 0);
	Buf3_out: inout std_logic_vector(15 downto 0)
	);
end dataPath;
architecture imp of datapath is
-----------------SIGNALS-------------------
signal ALU_out, PC_out, IR_out, SP_out, Pm_out, Buf1_out: std_logic_vector(15 downto 0);
signal P_out, Add1_out, Add2_out, O_out, S_out, R_out: std_logic_vector(15 downto 0);
signal RA, RB: std_logic_vector(15 downto 0);
signal int_in, pc_in: std_logic_vector(15 downto 0);
signal sub1: std_logic;
signal Pm_in: std_logic_vector(15 downto 0);
---------------------------------------------------
begin
	int_in <= "000000000" & IR_out(2 downto 0) & "1111";
	pc_in <= X"00" & IR_out(7 downto 0);
	IR <= IR_out(15 downto 11);

	-- Special registers ------------------------------------------
	PCx: reg16 port map(P_out,PCload,reset,clk,PC_out);
	IRx: reg16 port map(RB,IRload,reset,clk,IR_out);
	SPx: reg16 port map(S_out,SPload,reset,clk,SP_out);

	--- Multiplexers ----------------------------------------------
	Pmux4: mux4 port map(Psel,int_in, int_in, RB, Add1_out,P_out);
	
	Rmux4: mux4 port map(Rsel,RA,SP_out,RB, pc_in, R_out);

	Smux4: mux4 port map(Ssel,X"0000",X"0000",RA,Add2_out,S_out);
	
	Omux4: mux4 port map(Osel,PC_out,SP_out,X"0000",RA,O_out);

	Pm_in <= "000000" & IR_out(9 downto 0);

	Pmux2: mux2 port map(jmpMux,X"0001",Pm_in,Pm_out);
	
	---- ALU and Regfile---------------v<<<<<<<<<<---------------------------------
	Regf: regfile port map(clk,reset,we,IR_out(10 downto 8),ALU_out,rbe,rae,
	IR_out(7 downto 5),IR_out(4 downto 2),RA,RB);
	ALUx: alu port map(ALUsel,R_out,RB,ALU_out,open,open,open,zero);
	
	---- Buffers -------------------------------------------------------
	Buf1x: buf port map(pcen,PC_out,Buf3_out);
	Buf2x: buf port map(aen,O_out,Buf2_out);
	Buf3x: buf2 port map(den,dir,RB,Buf3_out);
	---- Addsub circuits -----------------------------------------------
	sub1 <= IR_out(10) and jmpMux;
	Addsub1: addsub16 port map(sub1,PC_out,Pm_out,Add1_out);
	Addsub2: addsub16 port map(sub2,SP_out,X"0001",Add2_out);
--------------------------------------------------------------------
end imp;
