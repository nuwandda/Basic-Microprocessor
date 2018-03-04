library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package u311 is

component u311_1 is port(
	clk: in std_logic;
	reset: in std_logic;
	opfetch: out std_logic;
	INT: in std_logic;
	INTA: out std_logic;
	WR: out std_logic;
	RD: out std_logic;
	A: out std_logic_vector(15 downto 0);
	D: inout std_logic_vector(15 downto 0));
end component u311_1;


component clk_gen is 
	port(
		clk : out std_logic
	);
end component clk_gen;

component rst_gen is 
	port (
		reset : out std_logic
	);
end component rst_gen;

component rom1024 is port(
	cs : in std_logic;
	oe : in std_logic;
	addr : in std_logic_vector (9 downto 0);
	data : out std_logic_vector (15 downto 0)
	);
end component rom1024;


component datapath is port(
	clk: in std_logic;
	reset : in std_logic;
	pcen, den, dir, aen: in std_logic;
	SPload, PCload, IRload: in std_logic;
	Psel, Ssel, Rsel, Osel : in std_logic_vector(1 downto 0);
	sub2: in std_logic;
	jmpMux : in std_logic;
	IR : out std_logic_vector (4 downto 0);
	zero: out std_logic;
	ALUsel : in std_logic_vector (4 downto 0);
	we, rae, rbe : in std_logic;
	Buf2_out: out std_logic_vector(15 downto 0);
	Buf3_out: inout std_logic_vector(15 downto 0)
	);
end component dataPath;



component ALU is port (
	S: in std_logic_vector(4 downto 0);
	A, B: in std_logic_vector(15 downto 0);
	F: out std_logic_vector(15 downto 0);
	unsigned_overflow: out std_logic;
	signed_overflow: out std_logic;
	carry: out std_logic;
	zero: out std_logic
	);
end component ALU;


component regfile is port(
	clk: in std_logic;
	reset: in std_logic;
	we: in std_logic;
	WA: in std_logic_vector(2 downto 0);
	D: in std_logic_vector(15 downto 0);
	rbe: in std_logic;
	rae: in std_logic;
	RAA: in std_logic_vector(2 downto 0);
	RBA: in std_logic_vector(2 downto 0);
	portA: out std_logic_vector(15 downto 0);
	portB: out std_logic_vector(15 downto 0));
end component regfile;

component reg16 IS PORT(
	d : IN std_logic_vector(15 DOWNTO 0);
 	ld : IN std_logic; -- load/enable.
 	clr : IN std_logic; -- async. clear.
 	clk : IN std_logic; -- clock.
 	q : OUT std_logic_vector(15 DOWNTO 0) -- output
 );
 END component reg16;


component buf is port(
	enable: in std_logic;
	input : in std_logic_vector (15 downto 0);
	output: out std_logic_vector(15 downto 0)
	);
end component buf;

component buf2 is port(
	enable: in std_logic;
	direction: in std_logic;
	input : inout std_logic_vector (15 downto 0);
	output: inout std_logic_vector(15 downto 0)
	);
end component buf2;

component addsub16 is port(
	sub: in std_logic;
	in1,in2: in std_logic_vector(15 downto 0);
	output: out std_logic_vector(15 downto 0)
	);
end component addsub16;



component shifter16 is port(
	S: in std_logic_vector(1 downto 0);
	A: in std_logic_vector(15 downto 0);
	Y: out std_logic_vector(15 downto 0);
	carryOut: out std_logic;
	zero: out std_logic
	);
end component shifter16;
    
component FA is port(
	carryIn: in std_logic;
	carryOut: out std_logic;
	x,y : in std_logic;
	s : out std_logic
	);
end component FA;
    
component FA16 is port(
	A : in std_logic_vector(15 downto 0);
	B : in std_logic_vector(15 downto 0);
	F : out std_logic_vector(15 downto 0);
	cIn: in std_logic ;
	unsigned_overflow: out std_logic;
	signed_overflow: out std_logic
	);
end component FA16;

component LE is port(
	S: in std_logic_vector(2 downto 0);
	a, b: in std_logic;
	x: out std_logic
	);
end component LE;

component AE is port(
	S: in std_logic_vector(2 downto 0);
	a, b: in std_logic;
	x: out std_logic
	);
end component AE;

component AE16 is port(
	S: in std_logic_vector(2 downto 0);
	A, B: in std_logic_vector(15 downto 0);
	Y: out std_logic_vector(15 downto 0)
	);
end component AE16;



component LE16 is port(
	S: in std_logic_vector(2 downto 0);
	A, B: in std_logic_vector(15 downto 0);
	x: out std_logic_vector(15 downto 0)
	);
end component LE16;

component mux4 is port(
   S:              in std_logic_vector(1 downto 0);
   x0, x1, x2, x3: in std_logic_vector(15 downto 0);
   y:              out std_logic_vector(15 downto 0)
);
end component mux4;


component mux2 is port(
	s : in std_logic;
	x0,x1: in std_logic_vector (15 downto 0);
	y : out std_logic_vector (15 downto 0));
end component mux2;

component MUX is port(
   S:              in std_logic_vector(1 downto 0);
   x0, x1, x2, x3: in std_logic;
   y:              out std_logic
);
end component MUX;

component ram1024 is port(
	rst: in std_logic;
	cs: in std_logic; --chip select
	wr: in std_logic; --write enable
	rd: in std_logic;--read enable
	addr: in std_logic_vector(9 downto 0);
	data: inout std_logic_vector(15 downto 0));
end component;



component controller is port(
	clk: in std_logic;
	reset : in std_logic;
	pcen, den, dir, aen: out std_logic;
	SPload, PCload, IRload: out std_logic;
	Psel, Ssel, Rsel, Osel : out std_logic_vector(1 downto 0);
	sub2: out std_logic;
	jmpMux : out std_logic;
	opfetch : out std_logic;
	IR : in std_logic_vector (4 downto 0);
	zero: in std_logic;
	ALUsel : out std_logic_vector (4 downto 0);
	we, rae, rbe : out std_logic;
	int: in std_logic;
	inta, wr, rd: out std_logic);
end component controller;


end u311;

