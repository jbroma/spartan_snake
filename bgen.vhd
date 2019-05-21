----------------------------------------------------------------------------------

-- Baud rate generator -> generates one tick for every 163 periods
-- Baud rate: 19200
-- Oversampling: 16
-- 307,200 ticks per second

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

entity bgen is
port (
	clk: in std_logic;
	rst: in std_logic;
	tick: out std_logic
);
end bgen;

architecture Behavioral of bgen is

signal counter: integer range 0 to 162;
signal output: std_logic;

begin
	process(clk, rst)
	begin
		if rst = '1' then
			counter <= 0;
			output <= '0';
		elsif rising_edge(clk) then
			if counter = 162 then
				counter <= 0;
				output <= '1';
			else
				counter <= counter + 1;
				output <= '0';
			end if;
		end if;
	end process;

	tick <= output;
	
end Behavioral;
