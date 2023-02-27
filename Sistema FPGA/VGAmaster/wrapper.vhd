-- This is a wrapper made for calling Pixel_On_Text.vhd form verilog
-- Since I'm not familiar with mapping string and structure(point_2d) bewteen verilog and vhdl, this is a simple walkaround.
-- By using Pixel_On_Text2.vhd, this file may not be necessary anymore.
-- However, sometimes it's a bit more convenient to group all you text in one place.
-- I also include some sample code for acheiving dynamic text(a simple way).
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- note this line.The package is compiled to this directory by default.
-- so don't forget to include this directory. 
library work;
-- this line also is must.This includes the particular package into your program.
use work.commonPak.all;

entity wrapper is
  Port (
    clk: in std_logic;
    xCoord: in std_logic_vector(9 downto 0);
    yCoord: in std_logic_vector(9 downto 0);
	 data_hundred:	in std_logic_vector(5 downto 0);
	 data_ten:	in std_logic_vector(5 downto 0);
	 data_unit: in std_logic_vector(5 downto 0); 
    pixOn: out std_logic
   );
end wrapper;

architecture Behavioral of wrapper is
	
	signal h : integer := to_integer(signed(xCoord));
	signal v : integer := to_integer(signed(yCoord));
	signal tamanho: integer := 10; --tamanho do texto (dez caracteres)
	signal texto: string (1 to 3) := (others => NUL);
	-- ver font_rom - usa o codigo ASCII
	signal int1: integer := to_integer(unsigned(data_hundred)); -- código do '0' a ser mandado para VGA
	signal int2: integer := to_integer(unsigned(data_ten));--to_integer(unsigned(data_ten)); -- código do '1' a ser mandado para VGA
	signal int3: integer := to_integer(unsigned(data_unit));--to_integer(unsigned(data_unity)); -- código do '2' a ser mandado para VGA
	signal int4: integer := 51; -- código do '3' a ser mandado para VGA
	signal int5: integer := 52; -- código do '4' a ser mandado para VGA
	signal int6: integer := 53; -- código do '5' a ser mandado para VGA
	signal int7: integer := 54; -- código do '6' a ser mandado para VGA
	signal int8: integer := 55; -- código do '7' a ser mandado para VGA
	signal int9: integer := 56; -- código do '8' a ser mandado para VGA
	signal int10: integer := 57; -- código do '9' a ser mandado para VGA
	
	
    
    -- results
    signal d1 : std_logic := '0';
    signal d2 : std_logic := '0';
    signal d3 : std_logic := '0';
	 signal d4 : std_logic := '0'; 
	 signal d5 : std_logic := '0'; 
	 signal d6 : std_logic := '0'; 
	 signal d7 : std_logic := '0'; 
	 signal d8 : std_logic := '0'; 
	 signal d9 : std_logic := '0'; 
	 signal d10 : std_logic := '0';
	 signal d11 : std_logic := '0'; 
	 signal d12 : std_logic := '0'; 
	 signal d13 : std_logic := '0'; 
	 signal d14 : std_logic := '0'; 
	 signal d15 : std_logic := '0'; 
	 signal d16 : std_logic := '0'; 
	 
begin
	textElement1: entity work.Pixel_On_Text
	generic map (
		textLength => 43
	)
	port map(
		clk => clk,
		displayText => "Sistema de Controle de Temperatura Veicular",
		position => (150, 0),
		horzCoord => h,
		vertCoord => v,
		pixel => d1
	);
	
	--Temperatura Real Medida
	textElement2: entity work.Pixel_On_Text
	generic map (
		textLength => 26
	)
	port map(
		clk => clk,
		displayText => "Temperatura Real Medida = ",
		position => (0,50),
		horzCoord => h,
		vertCoord => v,
		pixel => d2
	);
	
	-- cria o texto baseado no vetor de inteiros definido [48 49 50 51 52 53 54 55 56 57] = "0123456789"
	texto(1) <= character'val(int1);
	texto(2) <= character'val(int2);
	texto(3) <= character'val(int3);
	
	textElement4: entity work.Pixel_On_Text
	generic map (
		textLength => 3
	)
	
	port map(
		clk => clk,
		displayText => texto,
		position => (215, 50),
		horzCoord => h,
		vertCoord => v,
		pixel => d4
	);

	--Temperatura Desejada
	textElement5: entity work.Pixel_On_Text
	generic map (
		textLength => 23
	)
	port map(
		clk => clk,
		displayText => "Temperatura Desejada = ",
		position => (0,100),
		horzCoord => h,
		vertCoord => v,
		pixel => d5
	);
	
	texto(1) <= character'val(int1);
	texto(2) <= character'val(int2);
	texto(3) <= character'val(int3);
	
	textElement6: entity work.Pixel_On_Text
	generic map (
		textLength => 3
	)
	
	port map(
		clk => clk,
		displayText => texto,
		position => (215, 100),
		horzCoord => h,
		vertCoord => v,
		pixel => d6
	);
	
	--Temperatura Da Mistura
	textElement7: entity work.Pixel_On_Text
	generic map (
		textLength => 25
	)
	
	port map(
		clk => clk,
		displayText => "Temperatura Da Mistura = ",
		position => (0,150),
		horzCoord => h,
		vertCoord => v,
		pixel => d7
	);
	
	texto(1) <= character'val(int1);
	texto(2) <= character'val(int2);
	texto(3) <= character'val(int3);
	
	textElement8: entity work.Pixel_On_Text
	generic map (
		textLength => 3
	)
	
	port map(
		clk => clk,
		displayText => texto,
		position => (215, 150),
		horzCoord => h,
		vertCoord => v,
		pixel => d8
	);
	
	--Temperatura Da Mistura
	textElement9: entity work.Pixel_On_Text
	generic map (
		textLength => 20
	)
	
	port map(
		clk => clk,
		displayText => "Saida Selecionada = ",
		position => (0,200),
		horzCoord => h,
		vertCoord => v,
		pixel => d9
	);
	
	texto(1) <= character'val(int1);
	texto(2) <= character'val(int2);
	texto(3) <= character'val(int3);
	
	textElement10: entity work.Pixel_On_Text
	generic map (
		textLength => 3
	)
	
	port map(
		clk => clk,
		displayText => texto,
		position => (215, 200),
		horzCoord => h,
		vertCoord => v,
		pixel => d10
	);
	
	--Velocidade Do Ventilador 
	textElement11: entity work.Pixel_On_Text
	generic map (
		textLength => 27
	)
	
	port map(
		clk => clk,
		displayText => "Velocidade Do Ventilador = ",
		position => (0,250),
		horzCoord => h,
		vertCoord => v,
		pixel => d11
	);
	
	texto(1) <= character'val(int1);
	texto(2) <= character'val(int2);
	texto(3) <= character'val(int3);
	
	textElement12: entity work.Pixel_On_Text
	generic map (
		textLength => 3
	)
	
	port map(
		clk => clk,
		displayText => texto,
		position => (215, 250),
		horzCoord => h,
		vertCoord => v,
		pixel => d12
	);
	
	--Abertura Valvula Quente 
	textElement13: entity work.Pixel_On_Text
	generic map (
		textLength => 26
	)
	
	port map(
		clk => clk,
		displayText => "Abertura Valvula Quente = ",
		position => (0,300),
		horzCoord => h,
		vertCoord => v,
		pixel => d13
	);
	
	texto(1) <= character'val(int1);
	texto(2) <= character'val(int2);
	texto(3) <= character'val(int3);
	
	textElement14: entity work.Pixel_On_Text
	generic map (
		textLength => 3
	)
	
	port map(
		clk => clk,
		displayText => texto,
		position => (215, 300),
		horzCoord => h,
		vertCoord => v,
		pixel => d14
	);
	
	--Abertura Valvula Quente 
	textElement15: entity work.Pixel_On_Text
	generic map (
		textLength => 24
	)
	
	port map(
		clk => clk,
		displayText => "Abertura Valvula Fria = ",
		position => (0,350),
		horzCoord => h,
		vertCoord => v,
		pixel => d15
	);
	
	texto(1) <= character'val(int1);
	texto(2) <= character'val(int2);
	texto(3) <= character'val(int3);
	
	textElement16: entity work.Pixel_On_Text
	generic map (
		textLength => 3
	)
	
	port map(
		clk => clk,
		displayText => texto,
		position => (215, 350),
		horzCoord => h,
		vertCoord => v,
		pixel => d16
	);
--  -- This is a simply way for a dynamic text. Of course, I know you probably have a better solution :)
--  -- With a new input "timeDiv", we can switch on different string
--	with timeDiv select
--    timeDivDigitNum <=  "Time/Div: 0.8 sec/div  " when 0,
--                        "Time/Div: 0.2 sec/div  " when 1,
--                        "Time/Div: 0.1 sec/div  " when 2,
--                        "Time/Div: 100 ms/div   " when 3,
--                        "Time/Div: 50 ms/div    " when 4,
--                        "Time/Div: 10 ms/div    " when 5,
--                        "Time/Div: 1 ms/div     " when 6,
--                        "Time/Div: 0.1ms/div    " when 7,
--                        "Time/Div: unknown      " when OTHERS;
        
--    textDrawElement4: entity work.Pixel_On_Text
--    generic map (
--        textLength => 23
--    )
--    port map(
--        clk => clk,
--        reset => reset,
--        textPassage => timeDivDigitNum ,--& integer'image(timeDiv),
--        position => (70, 90),
--        hCount => h,
--        vCount => v,
--        drawElement => d4
--    );
	
	pixelInTextGroup: process(clk)
        begin
            
            if rising_edge(clk) then
                -- the pixel is on when one of the text matched
                pixOn <= d1 or d2 or d4 or d5 or d6 or d7 or d8 or d9 or d10 or d11 or d12 or d13 or d14 or d15 or d16; -- adicionado d4 para coversão de inteiro para caracter

            end if;
        end process;

end Behavioral;
