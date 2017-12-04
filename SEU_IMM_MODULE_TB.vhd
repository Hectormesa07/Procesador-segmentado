--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:52:30 10/21/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/SEU_IMM_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SEU_IMM_MODULE
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
 
ENTITY SEU_IMM_MODULE_TB IS
END SEU_IMM_MODULE_TB;
 
ARCHITECTURE behavior OF SEU_IMM_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU_IMM_MODULE
    PORT(
         IMM : IN  std_logic_vector(12 downto 0);
         SIMM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IMM : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal SIMM : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU_IMM_MODULE PORT MAP (
          IMM => IMM,
          SIMM => SIMM
        );

   -- Stimulus process
   stim_proc: process
   begin		
		IMM <="1100000000000";
		WAIT FOR 10 NS;
		IMM <="0000010100000";
      wait;
   end process;

END;
