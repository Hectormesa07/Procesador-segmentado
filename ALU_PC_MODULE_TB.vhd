--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:15:27 10/22/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/ALU_PC_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_PC_MODULE
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
 
ENTITY ALU_PC_MODULE_TB IS
END ALU_PC_MODULE_TB;
 
ARCHITECTURE behavior OF ALU_PC_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_PC_MODULE
    PORT(
         NPC : IN  std_logic_vector(31 downto 0);
         STATIC : IN  std_logic_vector(31 downto 0);
         PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal NPC : std_logic_vector(31 downto 0) := (others => '0');
   signal STATIC : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal PC : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_PC_MODULE PORT MAP (
          NPC => NPC,
          STATIC => STATIC,
          PC => PC
        );

   -- Stimulus process
   stim_proc: process
   begin		
      NPC <= X"0000000F";
		STATIC<= X"00000001";
		WAIT FOR 10 NS;
		NPC <= X"00000007";
		STATIC<= X"00000001";
      wait;
   end process;

END;
