library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.u311.all;

entity shifter16 is port(
   S:         in std_logic_vector(1 downto 0);
   A:         in std_logic_vector(15 downto 0);
   Y:         out std_logic_vector(15 downto 0);
   carryOut:  out std_logic;
   zero:      out std_logic);
end shifter16;

architecture imp of shifter16 is
begin
    process(S)
        begin
            if(S="01") then
                carryOut <= A(15);
            elsif(S="10") then
                carryOut <= A(0);
        end if;
   end process;
   U0 : MUX port map(S, A(0), '0', A(1), A(1), Y(0));
   U1 : MUX port map(S, A(1), A(0), A(2), A(2), Y(1));
   U2 : MUX port map(S, A(2), A(1), A(3), A(3), Y(2));
   U3 : MUX port map(S, A(3), A(2), A(4), A(4), Y(3));
   U4 : MUX port map(S, A(4), A(3), A(5), A(5), Y(4));
   U5 : MUX port map(S, A(5), A(4), A(6), A(6), Y(5));
   U6 : MUX port map(S, A(6), A(5), A(7), A(7), Y(6));
   U7 : MUX port map(S, A(7), A(6), A(8), A(8), Y(7));
   U8 : MUX port map(S, A(8), A(7), A(9), A(9), Y(8));
   U9 : MUX port map(S, A(9), A(8), A(10), A(10), Y(9));
   U10 : MUX port map(S, A(10), A(9), A(11), A(11), Y(10));
   U11 : MUX port map(S, A(11), A(10), A(12), A(12), Y(11));
   U12 : MUX port map(S, A(12), A(11), A(13), A(13), Y(12));
   U13 : MUX port map(S, A(13), A(12), A(14), A(14), Y(13));
   U14 : MUX port map(S, A(14), A(13), A(15), A(15), Y(14));
   U15 : MUX port map(S, A(15), A(14), '0', A(0), Y(15));
   
   process(A,S)
       begin
           if(S="00") then
               if(A(15) = '0' and A(14) = '0' and A(13) = '0' and A(12) = '0' and A(11) = '0' and A(10) = '0' and A(9) = '0' and A(8) = '0' and A(7) = '0' and A(6) = '0' and A(5) = '0' and A(4) = '0' and A(3) = '0' and A(2) = '0' and A(1) = '0' and A(0) = '0')
                     then
                     zero <='1';
                else
                     zero <= '0';
                end if;
           end if;
    end process;
end imp;

