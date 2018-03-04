
library ieee;
   use ieee.std_logic_1164.all;
   use ieee.std_logic_unsigned.all;

library work;
    use work.u311.all;
    
entity MUX is port(
   S:              in std_logic_vector(1 downto 0);
   x0, x1, x2, x3: in std_logic;
   y:              out std_logic
);
end MUX;

architecture imp of MUX is 
begin 
    process(S, x0,x1,x2,x3)
        begin 
            case S is
                when "00" => y <= x0;
                when "01" => y <= x1;
                when "10" => y <= x2;
                when "11" => y <= x3;
                when others => y <= 'X';
        end case;
   end process;
end imp;


