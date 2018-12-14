library ieee;
use ieee.std_logic_1164.all;


entity geradorDeFrequencias is
	port( Clock_in: in std_logic;
			clock_outA: out std_logic;
			clock_outB: out std_logic;
			clock_outC: out std_logic);
end geradorDeFrequencias;

architecture arch of geradorDeFrequencias is

component flipFlopJK is
		port(
			J,K : in std_logic;
			clear, preset : in std_logic;
			clk : in std_logic;
			Q, Qbar: out std_logic
		);		
end component;

component divisorFrequencia is
	port( Clock_in: in std_logic;
			clock_out_1: out std_logic);
end component;

signal qs_in, qsA, qsB, qsC: std_logic;
 
begin
	D0: divisorFrequencia port map(clock_in, qs_in);
	F0: flipFlopJK port map('0','0','1','1',qs_in,qsA);
	F1: flipFlopJK port map('0','0','1','1',qsA, qsB);
	F2: flipFlopJK port map('0','0','1','1',qsB, qsC);
	clock_outA <= qsA;
	clock_outB <= qsB;
	clock_outC <= qsC;
end arch;
