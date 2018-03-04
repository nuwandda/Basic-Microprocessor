library ieee;
   use ieee.std_logic_1164.all;
   use ieee.std_logic_unsigned.all;

library work;
    use work.u311.all;
    
entity mux4 is port(
   S:              in std_logic_vector(1 downto 0);
   x0, x1, x2, x3: in std_logic_vector(15 downto 0);
   y:              out std_logic_vector(15 downto 0)
);
end mux4;

Architecture behavioral of mux4 is
begin
	Process(S,x0,x1,x2,x3)
		begin
			case S is
				when "00" => y<= x0;
				when "01" => y<= x1;
				when "10" => y<= x2;
				when "11" => y<= x3;
				when others => y <= "XXXXXXXXXXXXXXXX";
			end case;
	end Process;
end behavioral;

