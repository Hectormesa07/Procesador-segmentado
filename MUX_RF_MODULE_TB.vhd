--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:34:42 10/21/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/MUX_RF_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_RF_MODULE
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
 
ENTITY MUX_RF_MODULE_TB IS
END MUX_RF_MODULE_TB;
 
ARCHITECTURE behavior OF MUX_RF_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_RF_MODULE
    PORT(
         I : IN  std_logic;
         CRS2 : IN  std_logic_vector(31 downto 0);
         SIMM : IN  std_logic_vector(31 downto 0);
         OP2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic := '0';
   signal CRS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal SIMM : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal OP2 : std_logic_vector(31 downto 0);
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_RF_MODULE PORT MAP (
          I => I,
          CRS2 => CRS2,
          SIMM => SIMM,
          OP2 => OP2
        );

   -- Stimulus process
   stim_proc: process
   begin		
		I <= '0';
		CRS2 <= X"FFFFFFFF";
		SIMM <= X"FFFFF111";
		WAIT FOR 10 NS;
		I <= '1';
		CRS2 <= X"FFFFFFFF";
		SIMM <= X"FFFFF111";
      wait;
   end process;

END;
