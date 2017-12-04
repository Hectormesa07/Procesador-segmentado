--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:22:12 10/22/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/SEU_BR_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SEU_BR_MODULE
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
 
ENTITY SEU_BR_MODULE_TB IS
END SEU_BR_MODULE_TB;
 
ARCHITECTURE behavior OF SEU_BR_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU_BR_MODULE
    PORT(
         DISP22 : IN  std_logic_vector(21 downto 0);
         SDISP22 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DISP22 : std_logic_vector(21 downto 0) := (others => '0');

 	--Outputs
   signal SDISP22 : std_logic_vector(31 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU_BR_MODULE PORT MAP (
          DISP22 => DISP22,
          SDISP22 => SDISP22
        );

   -- Stimulus process
   stim_proc: process
   begin
		DISP22<="0100000000000100010000";
		WAIT FOR 10 NS;
		DISP22<="1000000000000100010000";
      wait;
   end process;

END;
