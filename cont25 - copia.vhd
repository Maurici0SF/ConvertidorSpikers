library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cont25 is
    Port ( clock : in STD_LOGIC;
           cont : out STD_LOGIC_VECTOR (3 downto 0);
           anodos : out STD_LOGIC_VECTOR (5 downto 0));
end cont25;

architecture Behavioral of cont25 is
   type estado is (S0, S1, S2, S3, S4, S5);
   signal edopte : estado := S0;
   signal edosgte : estado;
begin
   SYNC_PROC: process (clock)
   begin
      if (clock'event and clock = '1') then
            edopte <= edosgte;
      end if;
   end process;

   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (edopte)
   begin
      if edopte = S0 then
          cont <= "0000";
          anodos <= "111110"; 
        elsif edopte = S1 then 
          cont <= "0001";
          anodos <= "111101"; 
        elsif edopte = S2 then 
          cont <= "0010";
          anodos <= "111011";  
        elsif edopte = S3 then
          cont <= "0011";
          anodos <= "110111";
        elsif edopte = S4 then
          cont <= "0100";
          anodos <= "101111";
        else
          cont <= "0101";
          anodos <= "011111";     
      end if;
   end process;

   NEXT_STATE_DECODE: process (edopte)
   begin
      case (edopte) is
         when S0 =>
               edosgte <= S1;
         when S1 =>
               edosgte <= S2;
         when S2 =>
               edosgte <= S3;
         when S3 =>
               edosgte <= S4;
         when S4 =>
               edosgte <= S5;
         when others =>
                edosgte <= S0;
      end case;
   end process;
end Behavioral;

