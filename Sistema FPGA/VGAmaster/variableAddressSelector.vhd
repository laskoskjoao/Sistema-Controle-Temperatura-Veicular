LIBRARY ieee;
USE ieee.std_logic_1164.all; 


ENTITY variableAddressSelector IS 
	PORT
	(
		pixel_y: in std_logic_vector (9 downto 0);
		pixel_address:	out std_logic_vector (2 downto 0)
	);
END variableAddressSelector;


ARCHITECTURE variableAddressSelector OF variableAddressSelector IS 
signal dataBus_aux : STD_LOGIC_VECTOR(6 DOWNTO 0);
signal controlBus_aux : STD_LOGIC_VECTOR(2 DOWNTO 0);

begin

process (pixel_y)
begin

if (pixel_y > 10d"50" and pixel_y < 10d"99") then pixel_address <= "000";
elsif(pixel_y > 10d"100" and pixel_y < 10d"149") then pixel_address <= "001";
elsif(pixel_y > 10d"150" and pixel_y < 10d"199") then pixel_address <= "010";
elsif(pixel_y > 10d"200" and pixel_y < 10d"249") then pixel_address <= "011";
elsif(pixel_y > 10d"250" and pixel_y < 10d"299") then pixel_address <= "100";
elsif(pixel_y > 10d"300" and pixel_y < 10d"349") then pixel_address <= "101";
elsif(pixel_y > 10d"350" and pixel_y < 10d"499") then pixel_address <= "110";
else pixel_address <= "110";
end if;

end process;

END variableAddressSelector;

--elsif(pixel_y > 10d"100" and pixel_y < 10d"199") then pixel_address <= "001";