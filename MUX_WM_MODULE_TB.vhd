--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:15:35 10/21/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/MUX_WM_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_WM_MODULE
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
 
ENTITY MUX_WM_MODULE_TB IS
END MUX_WM_MODULE_TB;
 
ARCHITECTURE behavior OF MUX_WM_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_WM_MODULE
    PORT(
         RFDEST : IN  std_logic;
         RD : IN  std_logic_vector(5 downto 0);
         NRD : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RFDEST : std_logic := '0';
   signal RD : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal NRD : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_WM_MODULE PORT MAP (
          RFDEST => RFDEST,
          RD => RD,
          NRD => NRD
        );

   -- Stimulus process
   stim_proc: process
   begin		
		RFDEST <= '0';
		RD <="011000";
		WAIT FOR 10 NS;
		RFDEST <= '1';
      wait;
   end process;

END;
