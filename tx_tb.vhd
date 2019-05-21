--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:26:15 05/10/2019
-- Design Name:   
-- Module Name:   C:/Xilinx/rs_1/tx_tb.vhd
-- Project Name:  rs_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tx
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tx_tb IS
END tx_tb;
 
ARCHITECTURE behavior OF tx_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tx
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         tx_output_bit : OUT  std_logic;
         s_tick : IN  std_logic;
         tx_start : IN  std_logic;
         tx_input_bit_finished : OUT  std_logic;
         data_in : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal s_tick : std_logic := '0';
   signal tx_start : std_logic := '0';
	signal data_in : std_logic_vector(7 downto 0);

 	--Outputs
   signal tx_output_bit : std_logic;
   signal tx_input_bit_finished : std_logic;
   

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant s_tick_period: time := 3260 ns;
	constant sixteen_ticks: time := 52160 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tx PORT MAP (
          clk => clk,
          rst => rst,
          tx_output_bit => tx_output_bit,
          s_tick => s_tick,
          tx_start => tx_start,
          tx_input_bit_finished => tx_input_bit_finished,
          data_in => data_in
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
    tick_process :process
	begin
		s_tick <= '0';
		wait for s_tick_period;
		s_tick <= '1';
		wait for clk_period;
	end process;
	

   -- Stimulus process
   stim_proc: process
   begin		
		tx_start <= '1';
      rst <= '1';
      wait for 100 ns;	
		rst <= '0';
		data_in <= "00110101";
		wait for 10*sixteen_ticks;
		data_in <= "10101100";
		wait for 10*sixteen_ticks;
		data_in <= "01100101";
      wait;
   end process;

END;
