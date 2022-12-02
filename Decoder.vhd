library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_Std.all;
use ieee.std_logic_unsigned.all;

entity Decoder is
	port(bcd,bcd2 : in std_logic_vector(3 downto 0);
		 Sal7seg,Sal7seg2 : out std_logic_vector(6 downto 0));
end entity Decoder;

architecture behav of Decoder is

begin 
with bcd select
	Sal7seg<="1000000" when "0000",
			   "1111001" when "0001",
			   "0100100" when "0010",
			   "0110000" when "0011",
			   "0011001" when "0100",
			   "0010010" when "0101",
			   "0000010" when "0110",
			   "1111000" when "0111",
			   "0000000" when "1001",
			   "0010000" when others;
with bcd2 select
  Sal7seg2<="1000000" when "0000",
			   "1111001" when "0001",
			   "0100100" when "0010",
			   "0110000" when "0011",
			   "0011001" when "0100",
			   "0010010" when "0101",
			   "0000010" when "0110",
			   "1111000" when "0111",
			   "0000000" when "1001",
			   "0010000" when others;	
end architecture behav;