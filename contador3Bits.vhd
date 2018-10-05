library ieee;
use ieee.std_logic_1164.all;

entity contador3Bits is
port(
	clock : in std_logic;
	d : out std_logic_vector(6 downto 0);
	clr : in std_logic;
	S : in std_logic;
	Qc : out std_logic_vector(2 downto 0)
);
end contador3Bits;

architecture contador3BitsArch of contador3Bits is
		component flipFlopJK is
		port(
			J,K : in std_logic;
			clear, preset : in std_logic;
			clk : in std_logic;
			Q, Qbar: out std_logic
		);
		end component;
		
		component display7segment is
			Port ( B0,B1,B2,B3 : in STD_LOGIC;
			displays : out STD_LOGIC_vector(6 downto 0));
		end component;
		
		
		signal Qs : std_logic_vector(2 downto 0) := "000";
begin

	FF00 : flipFlopJK port map(S, S, clr, '1', clock, Qs(0) );
	FF01 : flipFlopJK port map(S, S, clr, '1', Qs(0), Qs(1) );
	FF02 : flipFlopJK port map(S, S, clr, '1', Qs(1), Qs(2) );
	Qc <= Qs;
	D7S : display7segment port map(Qs(0), Qs(1),Qs(2),'0', d );
end contador3BitsArch;
