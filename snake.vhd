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
-- use IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

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

-- Kolory:
constant COLOR_BLACK 	: std_logic_vector(2 downto 0) := "000";
constant COLOR_BLUE 		: std_logic_vector(2 downto 0) := "001";
constant COLOR_GREEN 	: std_logic_vector(2 downto 0) := "010";
constant COLOR_CYAN 		: std_logic_vector(2 downto 0) := "011";
constant COLOR_RED 		: std_logic_vector(2 downto 0) := "100";
constant COLOR_MAGENTA 	: std_logic_vector(2 downto 0) := "101";
constant COLOR_YELLOW 	: std_logic_vector(2 downto 0) := "110";
constant COLOR_WHITE 	: std_logic_vector(2 downto 0) := "111";

-- Kierunki:
constant DIR_RIGHT		: std_logic_vector(3 downto 0) := "0001";
constant DIR_LEFT			: std_logic_vector(3 downto 0) := "0010";
constant DIR_DOWN			: std_logic_vector(3 downto 0) := "0100";
constant DIR_UP			: std_logic_vector(3 downto 0) := "1000";

-- Tablica do przechowywania polozenia segmentow weza
type int_arr is array (integer range <>, integer range <>) of integer range 0 to 640;
signal snake_arr : int_arr (0 to 6, 0 to 1);

-- Aktualna pozycja w poziomie ( X )
signal h_pos : integer range 0 to 639;

-- Aktualna pozycja w pionie ( Y )
signal v_pos : integer range 0 to 479;

-- Aktualny kierunek w ktorym podaza snake
type dir_t is (up, down, left, right); 
signal direction : dir_t;

-- Kolor jaki ma zostac wyswietlony na danym pikselu
signal draw_rgb : std_logic_vector(2 downto 0);

-- Licznik zliczajacy cykle zegara
signal time_count : integer range 0 to 4999999;

-- Sygnal odpowiadajacy za rysowanie na ekranie stanu gry
signal move_rdy : std_logic;

begin
 
time_counter:process(clk, rst, time_count)
begin
	if rst = '1' then
		time_count <= 0;
		move_rdy <= '0';
   elsif rising_edge(clk) then
      if time_count = 4999999 then
			time_count <= 0;
         move_rdy <= '1';
      else 
         move_rdy <= '0';
			time_count <= time_count + 1; 
      end if;
   end if;
end process;


change_direction:process(clk, rst, input_ready, key_input)

begin
	if rst = '1' then
		direction <= down;
   elsif rising_edge(clk) and input_ready = '1' then
      
      if key_input /= "0000" then
         
			if (direction = right and key_input /= DIR_LEFT) 
         or (direction = left and key_input /= DIR_RIGHT) 
         or (direction = down and key_input /= DIR_UP) 
         or (direction = up and key_input /= DIR_DOWN) then
            
				case key_input is
					when DIR_UP => direction <= up;
					when DIR_DOWN => direction <= down;
					when DIR_LEFT => direction <= left;
					when DIR_RIGHT => direction <= right;
					when others => direction <= up;
				end case;
         
			end if;
      end if;
   end if;
end process;

move_snake:process(clk, rst, move_rdy, direction)
begin
	if rst = '1' then
		snake_arr <= ((400, 300), (400, 290), (400, 280), (400, 270), (400, 260), (400, 250), (400, 240));
   elsif rising_edge(clk) and move_rdy = '1' then
		-- cialo weza podaza za glowa
      shift_loop : for k in 6 downto 1 loop
         snake_arr(k,0) <= snake_arr(k-1,0);
         snake_arr(k,1) <= snake_arr(k-1,1);
      end loop shift_loop;
      
		-- zmiana polozenia glowy w zaleznosci od aktualnie wybranego kierunku
      if(direction = up) then
         if snake_arr(0,1) = 10 then
            snake_arr(0,1) <= 470;
         else
            snake_arr(0,1) <= snake_arr(0,1) - 10;
         end if;
      elsif(direction = down) then
         if snake_arr(0,1) = 470 then
            snake_arr(0,1) <= 10;
         else
            snake_arr(0,1) <= snake_arr(0,1) + 10;
         end if;
      elsif(direction = left) then
         if snake_arr(0,0) = 10 then
            snake_arr(0,0) <= 630;
         else
            snake_arr(0,0) <= snake_arr(0,0) - 10;
         end if;
      elsif(direction = right) then
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
		draw_rgb <= COLOR_BLACK;
	elsif rising_edge(clk) then
		h_pos <= to_integer(unsigned(VGA_X));
		v_pos <= to_integer(unsigned(VGA_Y));
		
		-- czarny pixel jesli zaden z ponizszych warunkow nie zostanie spelniony
      draw_rgb <= COLOR_BLACK;
      
      if(((h_pos >= 0 AND h_pos < 6) OR (h_pos >= 634 AND h_pos < 640))) then 
         -- ramki pionowe
			draw_rgb <= COLOR_RED;
		elsif((h_pos > 0 AND h_pos < 640) AND ((v_pos >= 0 AND v_pos < 6) OR (v_pos >= 474 AND v_pos < 480))) then
         -- ramki poziome
			draw_rgb <= COLOR_RED;
      else
			draw_snake: for k in 0 to 6 loop
				if((h_pos > snake_arr(k,0) - 5 AND h_pos < snake_arr(k,0) + 5) AND ((v_pos > snake_arr(k,1) - 5) AND (v_pos < snake_arr(k,1) + 5))) then
               if k = 0 then
						-- glowa
                  draw_rgb <= COLOR_YELLOW;
               else
						-- ogon
                  draw_rgb <= COLOR_GREEN;
               end if;
				end if;
			end loop draw_snake;
			
		end if;
	end if;
end process;

VGA_RGB <= draw_rgb;

end Behavioral;

