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
use IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity snake is
    Port ( rst : in std_logic;
			  clk : in std_logic;
           key_input : in  std_logic_vector (3 downto 0);
           input_ready : in  std_logic;
           VGA_X : in  std_logic_vector (9 downto 0);
           VGA_Y : in  std_logic_vector (8 downto 0);
           VGA_RGB : out  std_logic_vector(2 downto 0));
end snake;

architecture Behavioral of snake is

   -- Basic snake array:
type int_arr is array (integer range <>, integer range <>) of integer;
signal snake_arr : int_arr (0 to 20, 0 to 1);
signal snake_len : integer;

signal h_pos : integer;
signal v_pos : integer;

signal direction : integer;
signal draw_rgb : std_logic_vector(2 downto 0);

signal time_count : integer;
signal move_rdy : std_logic;

signal x : integer := 50;
signal y : integer := 50;
signal apple_rdy : std_logic := '0';


begin

-- Should move the snake each half a sec 
time_counter:process(clk, rst, time_count)
begin
	if rst = '1' then
		time_count <= 0;
		move_rdy <= '0';
   elsif rising_edge(clk) then
      if time_count = 5000000 then
			time_count <= 0;
         move_rdy <= '1';
      else 
         move_rdy <= '0';
			time_count <= time_count + 1; 
      end if;
   end if;
end process;

--random_gen:process(clk, apple_rdy)
--  variable seed1: positive;
--  variable seed2: positive;               -- seed values for random generator
--variable rand: real := 100.0;   -- random real-number value in range 0 to 1.0  
--begin
--   if rising_edge(clk) AND apple_rdy = '1' then
--      --uniform(seed1, seed2, rand);   -- generate random number
--      x <= integer(rand*620.0);  -- rescale to 0..1000, convert integer part
--      y <= integer(10.0 + rand*460.0);
--      apple_rdy <= '0';
--      end if;
--end process;


change_direction:process(clk, rst, input_ready, key_input)
variable dir : integer;
begin
	if rst = '1' then
		direction <= 4;
   elsif rising_edge(clk) and input_ready = '1' then
      dir := direction;
      if key_input /= "0000" then
         if (dir = 1 and key_input /= "0010") 
         or (dir = 2 and key_input /= "0001") 
         or (dir = 4 and key_input /= "1000") 
         or (dir = 8 and key_input /= "0100") then
            direction <= to_integer(unsigned(key_input));
         end if;
      end if;
   end if;
end process;

move_snake:process(clk, rst, move_rdy, direction)
begin
	if rst = '1' then
		snake_arr <= ((400, 300), (400, 290), (400, 280), (400, 270), (400, 260), (400, 250), (400, 240), others => (others=>-1));
   elsif rising_edge(clk) and move_rdy = '1' then
		-- Shift the whole array
      shift_loop : for k in 6 downto 1 loop
         snake_arr(k,0) <= snake_arr(k-1,0);
         snake_arr(k,1) <= snake_arr(k-1,1);
      end loop shift_loop;
      if (snake_arr(0,1) = x AND snake_arr(0,0) = y) then
         apple_rdy <= '1';
         snake_len <= snake_len + 1;
      end if;
		-- Move the snake head
      if(direction = 8) then
         if snake_arr(0,1) = 10 then
            snake_arr(0,1) <= 470;
         else
            snake_arr(0,1) <= snake_arr(0,1) - 10;
         end if;
      elsif(direction = 4) then
         if snake_arr(0,1) = 470 then
            snake_arr(0,1) <= 10;
         else
            snake_arr(0,1) <= snake_arr(0,1) + 10;
         end if;
      elsif(direction = 2) then
         if snake_arr(0,0) = 10 then
            snake_arr(0,0) <= 630;
         else
            snake_arr(0,0) <= snake_arr(0,0) - 10;
         end if;
      elsif(direction = 1) then
         if snake_arr(0,0) = 630 then
            snake_arr(0,0) <= 10;
         else   
            snake_arr(0,0) <= snake_arr(0,0) + 10;
         end if;
      end if;
   end if;
end process;

draw:process(clk, rst, VGA_X, VGA_Y, snake_arr)
begin
	if rst = '1' then
		h_pos <= 0;
		v_pos <= 0;
		draw_rgb <= "000";
	elsif rising_edge(clk) then
		h_pos <= to_integer(unsigned(VGA_X));
		v_pos <= to_integer(unsigned(VGA_Y));
		
      draw_rgb <= "000";
      
      if(((h_pos >= 0 AND h_pos <= 6) OR (h_pos >= 634 AND h_pos <= 640))) then -- vertical boundaries
         draw_rgb <= "100";
		elsif((h_pos > 0 AND h_pos < 640) AND ((v_pos >= 0 AND v_pos <= 6) OR (v_pos >= 474 AND v_pos <= 480))) then -- horizontal boundaries
         draw_rgb <= "100";
      elsif((h_pos > x - 5 AND h_pos < x + 5) AND (v_pos > y - 5 AND v_pos < y + 5)) then
         draw_rgb <= "111";
      else	-- snake body
			draw_snake: for k in 0 to 6 loop
				if((h_pos > snake_arr(k,0) - 5 AND h_pos < snake_arr(k,0) + 5) AND ((v_pos > snake_arr(k,1) - 5) AND (v_pos < snake_arr(k,1) + 5))) then
               if k = 0 then
                  draw_rgb <= "010";
               else
                  draw_rgb <= "110";
               end if;
       --     else
         --      draw_rgb <= "000";
				end if;
            
			end loop draw_snake;
			
		end if;
	end if;
end process;

VGA_RGB <= draw_rgb;

end Behavioral;

