----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:54 04/16/2019 
-- Design Name: 
-- Module Name:    kbd - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity kbd is
    port (  keycode : in  std_logic_vector (7 downto 0);
            input_ready : in  std_logic;
            key : out  std_logic_vector (3 downto 0));
end kbd;

-- czysto kombinatoryczny uklad, nie powinen wymagac synchronizacji (oba wejscia sa synchroniczne)
architecture Behavioral of kbd is	

signal keys : std_logic_vector (3 downto 0);

begin
   process(input_ready, keycode, keys)
   begin
      if input_ready = '1' then
         if keycode = X"77" then -- letter W
            keys <= "1000";
         elsif keycode = X"73" then -- letter S
            keys <= "0100";
         elsif keycode = X"61" then -- letter A
            keys <= "0010";
         elsif keycode = X"64" then -- letter D
            keys <= "0001";
         else
            keys <= "0000";
			end if;
		else keys <= "0000";
      end if;
		
   end process;

   key <= keys;

end Behavioral;

