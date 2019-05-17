----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:12:05 01/15/2019 
-- Design Name: 
-- Module Name:    vga_driver - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity vga_driver is 
  port ( CLK_50MHz 		:		in  STD_LOGIC; 
			RGB   		: 		in  STD_LOGIC_VECTOR(2 downto 0); 
			VGA_R 		: 		out STD_LOGIC; 
			VGA_G 		:		out STD_LOGIC; 
			VGA_B 		: 		out STD_LOGIC; 
			VGA_HS    	:		out STD_LOGIC; 
			VGA_VS    	:		out STD_LOGIC; 
			PIX_X  		:		out STD_LOGIC_VECTOR(9 downto 0); 
			PIX_Y		:		out STD_LOGIC_VECTOR(8 downto 0) ); 
end vga_driver; 

architecture Behavioral of vga_driver is
	 signal clk_25 : std_logic;
    signal xcounter : integer range 0 to 799;
    signal ycounter : integer range 0 to 520;

begin
	
	clk_div : process(CLK_50MHz) 
	begin
		if rising_edge(CLK_50MHz) then
			clk_25 <= not clk_25;
		end if;
	end process;
	
	counters : process(clk_25)
	begin
		if rising_edge(clk_25) then
			if xcounter = 799 then
				xcounter <= 0;
				if ycounter = 520 then
					ycounter <= 0;
				else
					ycounter <= ycounter + 1;
				end if;
         else
            xcounter <= xcounter + 1;
         end if;
      end if;

	end process;
	
	h_sync : process(xcounter) 
	begin
		if xcounter >= 16 and xcounter < 112 then
			VGA_HS <= '0'; 
		else 
			VGA_HS <= '1';
		end if;
	end process;
	
	v_sync : process(ycounter)
	begin
		if ycounter >= 10 and ycounter < 12 then
			VGA_VS <= '0'; 
		else 
			VGA_VS <= '1';
		end if;
	end process;
	
	color_pixel : process(xcounter, ycounter, RGB) 
	begin
		if xcounter < 160 or ycounter < 41 then
            VGA_R <= '0';
            VGA_G <= '0';
            VGA_B <= '0';
        else
            VGA_R <= RGB(2);
            VGA_G <= RGB(1);
            VGA_B <= RGB(0);
        end if;
		if xcounter >= 160 then
            PIX_X <= std_logic_vector(to_unsigned(xcounter - 160, PIX_X'length));
        else
            PIX_X <= std_logic_vector(to_unsigned(640, PIX_X'length));
        end if;
		if ycounter >= 41 then
            PIX_Y <= std_logic_vector(to_unsigned(ycounter - 41, PIX_Y'length));
        else
            PIX_Y <= std_logic_vector(to_unsigned(480, PIX_Y'length));
        end if;

	end process;

end Behavioral;

