library ieee;
use ieee.std_logic_1164.all;


entity divisorFrequencia is
	port( Clock_in: in std_logic;
			clock_out_1: out std_logic);
end divisorFrequencia;

architecture arch of divisorFrequencia is
signal contagem: integer range 1 to 12500000;
signal estado: std_logic;
begin
	process(clock_in, contagem)
	begin
		if(clock_in='1' and clock_in'event) then
			if contagem = 12500000 then
				contagem <= 1;
				estado <= not estado;
			else
				contagem <= contagem + 1;
			end if;
		end if;
	end process;
	clock_out_1 <= estado;
end arch;