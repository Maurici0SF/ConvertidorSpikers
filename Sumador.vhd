library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_Std.all;
use ieee.std_logic_unsigned.all;

entity Sumador is
	port(CLK,spike,spike2 : in std_logic;
		 Sal,Sal2 : inout std_logic_vector(3 downto 0));
end entity Sumador;

architecture behav of Sumador is
--signal inicializador,inicializador2 : std_logic_vector(3 downto 0);
begin 

	process(CLK)
	begin
		if rising_edge(CLK) then
			if spike = '1' then
				Sal <= Sal + '1';
			end if;
			if spike2 = '1' then
				Sal2 <= Sal2 + '1';
			end if;
		end if;
	end process;
end architecture behav;