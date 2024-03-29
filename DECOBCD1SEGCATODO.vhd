library IEEE;  
use IEEE.STD_LOGIC_1164.ALL;  
use IEEE.STD_LOGIC_ARITH.ALL;  
use IEEE.STD_LOGIC_UNSIGNED.ALL;  

--catodo comun
entity DECOBCD1SEGCATODO is  
   port( clock,reset,enable: IN STD_LOGIC;
			BCD: in std_logic_vector(3 downto 0);  
         SEG7: out std_logic_vector(6 downto 0));  
end DECOBCD1SEGCATODO;  
	   
architecture solve of DECOBCD1SEGCATODO is  
 BEGIN      --abcdefg
	 PROCESS(clock,reset)  
    BEGIN  
        if reset='1' then SEG7<="0000001"; --NO SE ENCIENDE 
        elsif (clock'event and clock='1') then
				if(enable='0') then
					CASE BCD IS			  		 --abcdefg
						when "0000"=> SEG7  <= "1111110"; --0 en 7seg
						when "0001"=> SEG7  <= "0110000"; --1 en 7seg
						when "0010"=> SEG7  <= "1101101"; --2 en 7seg
						when "0011"=> SEG7  <= "1111001"; --3 en 7seg
						when "0100"=> SEG7  <= "0110011"; --4 en 7seg
						when "0101"=> SEG7  <= "1011011"; --5 en 7seg
						when "0110"=> SEG7  <= "1011111"; --6 en 7seg
						when "0111"=> SEG7  <= "1110000"; --7 en 7seg
						when "1000"=> SEG7  <= "1111111"; --8 en 7seg
						when "1001"=> SEG7  <= "1111011"; --9 en 7seg
						when others=> SEG7<="0000001";    --NO SE ENCIENDE EN OTRO CASO
					END CASE;
				else SEG7  <= "0000000";
				end if;
			END IF;
		END PROCESS;	
end solve;  
