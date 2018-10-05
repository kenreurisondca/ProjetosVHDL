library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity display7segment is
Port ( B0,B1,B2,B3 : in STD_LOGIC;
displays : out STD_LOGIC_vector(6 downto 0));
end display7segment;
 
architecture display7segment of display7segment is
 
begin
 
displays(0) <= B0 OR B2 OR (B1 AND B3) OR (NOT B1 AND NOT B3);
displays(1) <= (NOT B1) OR (NOT B2 AND NOT B3) OR (B2 AND B3);
displays(2) <= B1 OR NOT B2 OR B3;
displays(3) <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3) OR (B1 AND NOT B2 AND B3) OR (NOT B1 AND B2) OR B0;
displays(4) <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3);
displays(5) <= B0 OR (NOT B2 AND NOT B3) OR (B1 AND NOT B2) OR (B1 AND NOT B3);
displays(6) <= B0 OR (B1 AND NOT B2) OR ( NOT B1 AND B2) OR (B2 AND NOT B3);
 
end display7segment;