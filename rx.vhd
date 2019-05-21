----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:49:35 04/05/2019 
-- Design Name: 
-- Module Name:    rx - Behavioral 
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

entity rx is
	generic(
		DATA_BITS: integer := 8;
		STOP_TICKS: integer := 16);
	port(
		clk: in std_logic;
		rst: in std_logic;
		rx_input_bit: in std_logic;
		s_tick: in std_logic;
		rx_input_bit_finished: out std_logic;
		data_out: out std_logic_vector(7 downto 0));
end rx;

architecture Behavioral of rx is
	type state_t is (idle, start, data, stop);
	signal state: state_t;
	signal next_state: state_t;
	
	signal tick_counter, tick_counter_next: unsigned(3 downto 0);
	signal bit_counter, bit_counter_next: unsigned(2 downto 0);
	signal shift_register, shift_register_next: std_logic_vector(7 downto 0);
   
   signal previous_bit: std_logic;
   signal stable_input: std_logic;
begin
	
	-- zmiany stanA3w i asynchroniczny reset
	process(clk,rst)
	begin
		if rst = '1' then
			state <= idle;
			tick_counter <= "0000";
			bit_counter <= "000";
			shift_register <= "00000000";
         stable_input <= '1';
         previous_bit <= '1';
		elsif clk'event and clk = '1' then
			state <= next_state;
			tick_counter <= tick_counter_next;
			bit_counter <= bit_counter_next;
			shift_register <= shift_register_next;
         stable_input <= rx_input_bit;
         previous_bit <= stable_input;
		end if;
      
	end process;
	
	-- wlasciwa logika
	process(state,tick_counter,bit_counter,shift_register,s_tick,rx_input_bit, stable_input, previous_bit)
	begin
		next_state <= state;
		tick_counter_next <= tick_counter;
		bit_counter_next <= bit_counter;
		shift_register_next <= shift_register;
		rx_input_bit_finished <= '0';
      
		case state is
			when idle =>
				if stable_input ='0' and previous_bit = '1' then
					next_state <= start;
					tick_counter_next <= "0000";
				end if;
			when start =>
				if (s_tick = '1') then
					if tick_counter = 7 then
						next_state <= data;
						tick_counter_next <= "0000";
						bit_counter_next <= "000";
					else
						tick_counter_next <= tick_counter + 1;
					end if;
				end if;
			when data =>
				if s_tick = '1' then
					if tick_counter=15 then
						tick_counter_next <= "0000";
						shift_register_next <= rx_input_bit & shift_register(7 downto 1);
						if bit_counter = DATA_BITS - 1 then
							next_state <= stop;
						else
							bit_counter_next <= bit_counter + 1;
						end if;
					else
						tick_counter_next <= tick_counter + 1;
					end if;
				end if;
			when stop =>
				if (s_tick = '1') then
					if tick_counter = STOP_TICKS - 1 then
						next_state <= idle;
						rx_input_bit_finished <= '1';
					else
						tick_counter_next <= tick_counter + 1;
					end if;
				end if;
			end case;
		end process;
		
		data_out <= shift_register;
		
end Behavioral;