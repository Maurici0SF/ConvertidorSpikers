library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_Std.all;
use ieee.std_logic_unsigned.all;

entity ConvertidorSpikes is
	port(N1,N2 : in std_logic_vector(3 downto 0);
		  enable,enable2,CLK : in std_logic;
		  SevenSeg,SevenSeg2 : out std_logic_vector(6 downto 0));
end entity ConvertidorSpikes;

architecture behav of ConvertidorSpikes is

	component Decrementador 
		port(CLK,ena1,ena2 : in std_logic;
			 number, number2 : in std_logic_vector(3 downto 0);
			 Sal, Sal2 : out std_logic);
	end component;
	
	component Sumador 
	port(CLK,spike,spike2 : in std_logic;
		 Sal,Sal2 : out std_logic_vector(3 downto 0));
	end component;

	component Decoder
	port(bcd,bcd2 : in std_logic_vector(3 downto 0);
		 Sal7seg,Sal7seg2 : out std_logic_vector(6 downto 0));
	end component;
	
	--Signals
	signal SalDecrementador,SalDecrementador2 : std_logic;
	signal SalSumador, SalSumador2 : std_logic_vector(3 downto 0);
begin 

M1 : Decrementador port map(CLK,enable,enable2,N1,N2,SalDecrementador,SalDecrementador2);

M2 : Sumador port map(CLK,SalDecrementador,SalDecrementador2,SalSumador,SalSumador2);

M3 : Decoder port map(SalSumador,SalSumador2,SevenSeg,SevenSeg2);

end architecture behav;