library ieee;
use ieee.std_logic_1164.all;

entity flipFlopD is
port(
	D : in std_logic;
	clk : in std_logic;
	Q, Qbar: out std_logic
);
end flipFlopD;

architecture flipFlopDArch of flipFlopD is
signal qsignal : std_logic;
begin
	process(clk)
	begin
		if(clk'event and clk = '0') then 
				qsignal <= D;
		end if;
	end process;
	Q <= qsignal;
	Qbar <= not qsignal;
end flipFlopDArch;

