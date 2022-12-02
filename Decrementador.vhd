library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_Std.all;
use ieee.std_logic_unsigned.all;

entity Decrementador is
	port(CLK,ena1,ena2 : in std_logic;
		 number, number2 : inout std_logic_vector(3 downto 0);
		 Sal, Sal2 : out std_logic);
end entity Decrementador;

architecture behav of Decrementador is
begin 
	process(CLK)
	--variable numberint : integer := to_integer(unsigned(number));
	--variable number2int : integer := to_integer(unsigned(number2));
	begin
		if rising_edge(CLK) then
			--Enable 1
			if ena1 = '1' then
				if numberint>0 then
					number <= number - '1';
					Sal <= '1';
				end if;
			end if;
			--Enable 2
			if ena2 = '1' then
				if number2int>0 then
					number2 <= number2 - '1';
					Sal2 <= '1';
				end if;
			end if;
		end if;
	end process;

end architecture behav;