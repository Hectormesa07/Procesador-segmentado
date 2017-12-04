--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:08:10 10/22/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/SEU_CALL_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SEU_CALL_MODULE
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
 
ENTITY SEU_CALL_MODULE_TB IS
END SEU_CALL_MODULE_TB;
 
ARCHITECTURE behavior OF SEU_CALL_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU_CALL_MODULE
    PORT(
         DISP30 : IN  std_logic_vector(29 downto 0);
         SDISP30 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DISP30 : std_logic_vector(29 downto 0) := (others => '0');

 	--Outputs
   signal SDISP30 : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU_CALL_MODULE PORT MAP (
          DISP30 => DISP30,
          SDISP30 => SDISP30
        );
   -- Stimulus process
   stim_proc: process
   begin		
		DISP30<="010000000000001000100010000000";
		WAIT FOR 10 NS;
		DISP30<="110000000000001000100010000000";
      wait;
   end process;

END;
