----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:19:07 04/28/2019 
-- Design Name: 
-- Module Name:    snake - Behavioral 
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
use IEEE.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity snake is
    Port ( clk : in std_logic;
           key_input : in  std_logic_vector (3 downto 0);
           input_ready : in  std_logic;
           VGA_X : in  std_logic_vector (11 downto 0);
           VGA_Y : in  std_logic_vector (11 downto 0);
           VGA_RGB : out  std_logic_vector(2 downto 0));
end snake;

architecture Behavioral of snake is

   -- Basic snake array:
type int_arr is array (integer range <>, integer range <>) of integer;
signal snake_arr : int_arr (0 to 20, 0 to 1) := ((399, 299), (399, 289), (399, 279), (399, 269), (399, 259), (399, 249), others => (others=>-1));
signal snake_len : integer := 6;

signal h_pos : integer := 0;
signal v_pos : integer := 0;

signal direction : integer := 8;
signal draw_rgb : std_logic_vector(2 downto 0) := "000";

signal time_count : integer := 0;
signal move_rdy : std_logic := '0';

begin

-- Should move the snake each half a sec 
time_counter:process(clk, time_count)
begin
   if rising_edge(clk) then
      time_count <= time_count + 1;
      if time_count = 25000000 then
			time_count <= 0;
         move_rdy <= '1';
      else 
         move_rdy <= '0';
      end if;
   end if;
end process;


change_direction:process(clk, input_ready, key_input)
variable dir : integer;
begin
   if rising_edge(clk) and input_ready = '1' then
      dir := to_integer(unsigned(key_input));
      if(dir /= 0) then
         direction <= dir;
      end if;
   end if;
end process;

move_snake:process(clk, move_rdy, direction)
begin
   if rising_edge(clk) and move_rdy = '1' then
		-- Shift the whole array
      shift_loop : for k in 5 downto 1 loop
         snake_arr(k,0) <= snake_arr(k-1,0);
         snake_arr(k,1) <= snake_arr(k-1,1);
      end loop shift_loop;
		-- Move the snake head
      if(direction = 8) then
         snake_arr(0,1) <= snake_arr(0,1) - 3;
      elsif(direction = 4) then
         snake_arr(0,1) <= snake_arr(0,1) + 3;
      elsif(direction = 2) then
         snake_arr(0,0) <= snake_arr(0,0) - 3;
      elsif(direction = 1) then
         snake_arr(0,0) <= snake_arr(0,0) + 3;
      end if;
   end if;
end process;

draw:process(clk, VGA_X, VGA_Y)
begin
	if rising_edge(clk) then
		h_pos <= to_integer(unsigned(VGA_X));
		v_pos <= to_integer(unsigned(VGA_Y));
		
      if(((h_pos >= 0 AND h_pos <= 6) OR (h_pos >= 792 AND h_pos <= 798))) then -- vertical boundaries
         draw_rgb <= "111";
		elsif((h_pos > 0 AND h_pos < 799) AND ((v_pos >= 0 AND v_pos <= 6) OR (v_pos >= 593 AND v_pos <= 599))) then -- horizontal boundaries
         draw_rgb <= "111";
      else	-- snake body
			draw_snake: for k in 0 to 5 loop
				if((h_pos > snake_arr(k,0) - 5 AND h_pos < snake_arr(k,0) + 5) AND ((v_pos > snake_arr(k,1) - 5) AND (v_pos < snake_arr(k,1) + 5))) then
               draw_rgb <= "111";
            else
               draw_rgb <= "000";
				end if;
			end loop draw_snake;
			
		end if;
	end if;
end process;

VGA_RGB <= draw_rgb;

end Behavioral;

