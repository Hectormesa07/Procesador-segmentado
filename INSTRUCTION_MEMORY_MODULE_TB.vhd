--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:19:38 10/22/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/INSTRUCTION_MEMORY_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: INSTRUCTION_MEMORY_MODULE
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
 
ENTITY INSTRUCTION_MEMORY_MODULE_TB IS
END INSTRUCTION_MEMORY_MODULE_TB;
 
ARCHITECTURE behavior OF INSTRUCTION_MEMORY_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT INSTRUCTION_MEMORY_MODULE
    PORT(
         PC : IN  std_logic_vector(5 downto 0);
         RST : IN  std_logic;
         INSTRUCTION : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC : std_logic_vector(5 downto 0) := (others => '0');
   signal RST : std_logic := '0';

 	--Outputs
   signal INSTRUCTION : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: INSTRUCTION_MEMORY_MODULE PORT MAP (
          PC => PC,
          RST => RST,
          INSTRUCTION => INSTRUCTION
        );
 
   -- Stimulus process
   stim_proc: process
   begin	
		
		PC<="000000";
      wait for 10 ns;
		PC<="000001";
      wait for 10 ns;
		PC<="000010";
      wait for 10 ns;
		PC<="000011";
      wait for 10 ns;
		PC<="000100";
      wait for 10 ns;
		RST<='1';

      -- insert stimulus here 

      wait;
   end process;

END;