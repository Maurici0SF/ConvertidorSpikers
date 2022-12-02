----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:24:19 05/26/2022 
-- Design Name: 
-- Module Name:    Contador4Bits - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PROBLEMAS is
    Port ( CLK : in  STD_LOGIC;
           CLEAR : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end PROBLEMAS;

architecture Behavioral of PROBLEMAS is

type estados is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15);
signal D_bus, Q_bus: estados;

begin

    process (CLK,CLEAR)
    begin
    if clk'event and CLK= '1' then
            Q_bus <= D_bus;
    end if;
	 if CLEAR = '1' then
		Q_bus <= s0;
	 end if;
    end process;
    
    process (Q_bus)
    begin
        case (Q_bus) is
        when s0 =>
                D_bus <= s1;
        when s1 =>
                D_bus <= s2;
        when s2 =>
                D_bus <= s3;
        when s3 =>
                D_bus <= s4;
        when s4 =>
                D_bus <= s5;
        when s5 =>
                D_bus <= s6;
		  when s6 =>
                D_bus <= s7;
		  when s7 =>
                D_bus <= s8;
		  when s8 =>
                D_bus <= s9;
        when s9 =>
                D_bus <= s10;
		  when s10 =>
                D_bus <= s11;
		  when s11 =>
                D_bus <= s12;
		  when s12 =>
                D_bus <= s13;
		  when s13 =>
                D_bus <= s14;
		  when s14 =>
                D_bus <= s15;
		  when s15 =>
                D_bus <= s0;
	end case;
	end process;
    
    with Q_bus select
    Q <= "0000" when s0,
         "0001" when s1,
         "0010" when s2,
         "0011" when s3,
         "0100" when s4,
			"0101" when s5,
			"0110" when s6,
			"0111" when s7,
			"1000" when s8,
			"1001" when s9,
			"1010" when s10,
			"1011" when s11,
			"1100" when s12,
			"1101" when s13,
			"1110" when s14,
         "1111" when others;


end Behavioral;

