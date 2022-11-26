LIBRARY ieee;
USE ieee.std_logic_1164.all; 


ENTITY andPort3bit IS 
	PORT
	(
		a :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		resultAnd :  OUT  STD_LOGIC
	);
END andPort3bit;

ARCHITECTURE andPort3bit OF andPort3bit IS 
begin

resultAnd <= a(0) and a(1) and a(2);

END andPort3bit;