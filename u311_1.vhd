--Microprocessor
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.u311.all;

entity u311_1 is port(
	clk: in std_logic;
	reset: in std_logic;
	opfetch: out std_logic;
	INT: in std_logic;
	INTA: out std_logic;
	WR: out std_logic;
	RD: out std_logic;
	A: out std_logic_vector(15 downto 0);
	D: inout std_logic_vector(15 downto 0));
end u311_1;

architecture imp of u311_1 is

signal pcen,aen,den,dir: std_logic;
signal SPload,IRload,PCload: std_logic;
signal Psel,Ssel,Rsel,Osel : std_logic_vector(1 downto 0);
signal IR: std_logic_vector(4 downto 0);
signal we,rae,rbe: std_logic;
signal ALUsel: std_logic_vector(4 downto 0);
signal zero: std_logic;
signal sub2: std_logic;
signal jmpMux: std_logic;

begin
	CU: controller port map(clk,reset,pcen,den,dir,aen,SPload,PCload,IRload,Psel,Ssel,Rsel,
	Osel,sub2,jmpMux,opfetch,IR,zero,ALUsel,we,rae,rbe,int,inta,wr,rd);
	DP: datapath port map(clk,reset,pcen,den,dir,aen,SPload,PCload,IRload,Psel,Ssel,Rsel,
	Osel,sub2,jmpMux,IR,zero,ALUsel,we,rae,rbe,A,D);
end imp;
