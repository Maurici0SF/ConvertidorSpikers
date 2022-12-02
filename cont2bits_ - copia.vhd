----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2020 09:42:42
-- Design Name: 
-- Module Name: cont2bits - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cont2bits is
    Port ( clk : in STD_LOGIC;
           hab, reset : in STD_LOGIC;
           cont : out STD_LOGIC_VECTOR (3 downto 0);
           sal : out STD_LOGIC);
end cont2bits;

architecture Behavioral of cont2bits is

   subtype estado is STD_LOGIC_VECTOR (3 downto 0);
   constant A : estado := "0000";
   constant B : estado := "0001";
   constant C : estado := "0011";
   constant D : estado := "0010";
   constant E : estado := "0110";
   constant F : estado := "0111";
   constant G : estado := "0101";
   constant H : estado := "0100";
   constant I : estado := "1100";
   constant J : estado := "1101";
   constant K : estado := "1111";
   constant L : estado := "1110";
   constant M : estado := "1010";
   constant N : estado := "1011";
   constant O : estado := "1001";
   constant P : estado := "1000";
   
   signal edopte, edosgte  : estado;
begin

   STATE_MEMORY: process (clk, reset)
   begin
      if (reset = '1') then
          edopte <= A;
          elsif (clk'event and clk = '1') then
                edopte <= edosgte;
      end if;
   end process;

   --MOORE State-Machine - Outputs based on state only
   OUTPUT_LOGIC: process (edopte)
   begin
       case (edopte) is
          when A =>
             cont <= "0000";
             sal <= '0';
          when B =>
             cont <= "0001";
             sal <= '0';
          when C =>
             cont <= "0011";
             sal <= '0';
          when D =>
             cont <= "0010";
             sal <= '0';
          when E =>
             cont <= "0110";
             sal <= '0';
          when F =>
             cont <= "0111";
             sal <= '0';
          when G =>
             cont <= "0101";
             sal <= '0';
          when H =>
             cont <= "0100";
             sal <= '0';
          when I =>
             cont <= "1100";
             sal <= '0';
--          when J =>
--             cont <= "1101";
--             sal <= '0';
--          when K =>
--             cont <= "1111";
--             sal <= '0';
--          when L =>
--             cont <= "1110";
--             sal <= '0';
--          when M =>
--             cont <= "1010";
--             sal <= '0';
--          when N =>
--             cont <= "1011";
--             sal <= '0';
--          when O =>
--             cont <= "1001";
--             sal <= '0';
          when others =>
             cont <= "1101";
             sal <= '1';
       end case;
   end process;

   NEXT_STATE_LOGIC: process (edopte, hab)
   begin
      edosgte <= edopte;  --default is to stay in current state
      case (edopte) is
         when A =>
            if hab = '1' then
               edosgte <= B;
            end if;
         when B =>
            if hab = '1' then
               edosgte <= C;
            end if;
         when C =>
            if hab = '1' then
               edosgte <= D;
            end if;
         when D =>
            if hab = '1' then
               edosgte <= E;
            end if;
         when E =>
            if hab = '1' then
               edosgte <= F;
            end if;
         when F =>
            if hab = '1' then
               edosgte <= G;
            end if;
         when G =>
            if hab = '1' then
               edosgte <= H;
            end if;
         when H =>
            if hab = '1' then
               edosgte <= I;
            end if;
         when I =>
            if hab = '1' then
               edosgte <= J;
            end if;
--         when J =>
--            if hab = '1' then
--               edosgte <= K;
--            end if;
--         when K =>
--            if hab = '1' then
--               edosgte <= L;
--            end if;
--         when L =>
--            if hab = '1' then
--               edosgte <= M;
--            end if;
--         when M =>
--            if hab = '1' then
--               edosgte <= N;
--            end if;
--         when N =>
--            if hab = '1' then
--               edosgte <= O;
--            end if;
--         when O =>
--            if hab = '1' then
--               edosgte <= P;
--            end if;
         when others =>
            if hab = '1' then
               edosgte <= A;
            end if;     
       end case;
   end process;

end Behavioral;
