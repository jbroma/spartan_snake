--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:21:39 04/26/2019
-- Design Name:   
-- Module Name:   /home/jroma/University/UCISW2/Projekt/receiver/rx_tb.vhd
-- Project Name:  receiver
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rx
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
 
ENTITY rx_tb IS
END rx_tb;
 
ARCHITECTURE behavior OF rx_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rx
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         rx_input_bit : IN  std_logic;
         s_tick : IN  std_logic;
         rx_input_bit_finished : OUT  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal rx_input_bit : std_logic := '0';
   signal s_tick : std_logic := '0';

 	--Outputs
   signal rx_input_bit_finished : std_logic;
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant s_tick_period: time := 3260 ns;
	constant sixteen_ticks: time := 52160 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rx PORT MAP (
          clk => clk,
          rst => rst,
          rx_input_bit => rx_input_bit,
          s_tick => s_tick,
          rx_input_bit_finished => rx_input_bit_finished,
          data_out => data_out
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
      rx_input_bit <= '1'; 			-- high when idle
      rst <= '1';
      wait for 100 ns;	
		rst <= '0';
		wait for clk_period*10;
		for ii in 0 to 1 loop
         rx_input_bit <= '0';
         wait for sixteen_ticks;
         rx_input_bit <= '1';
         wait for sixteen_ticks;
         rx_input_bit <= '0';
         wait for sixteen_ticks;
         rx_input_bit <= '1';
         wait for sixteen_ticks;
         rx_input_bit <= '0';
         wait for sixteen_ticks;
         rx_input_bit <= '1';
         wait for sixteen_ticks*10;
       end loop;
		
      wait;
   end process;

END;