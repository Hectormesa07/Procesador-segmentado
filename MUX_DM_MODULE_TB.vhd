--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:34:03 10/21/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/MUX_DM_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_DM_MODULE
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
 
ENTITY MUX_DM_MODULE_TB IS
END MUX_DM_MODULE_TB;
 
ARCHITECTURE behavior OF MUX_DM_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_DM_MODULE
    PORT(
         RFSOURCE : IN  std_logic_vector(1 downto 0);
         DATATOMEM : IN  std_logic_vector(31 downto 0);
         ALU_RESULT : IN  std_logic_vector(31 downto 0);
         PC : IN  std_logic_vector(31 downto 0);
         DATATOREG : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RFSOURCE : std_logic_vector(1 downto 0) := (others => '0');
   signal DATATOMEM : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_RESULT : std_logic_vector(31 downto 0) := (others => '0');
   signal PC : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DATATOREG : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_DM_MODULE PORT MAP (
          RFSOURCE => RFSOURCE,
          DATATOMEM => DATATOMEM,
          ALU_RESULT => ALU_RESULT,
          PC => PC,
          DATATOREG => DATATOREG
        );

   -- Stimulus process
   STIM_PROC: PROCESS
   BEGIN		
			RFSOURCE<="00";
			DATATOMEM <= X"FFFF0000";
         ALU_RESULT <= X"11111111";
         PC <= X"0000000F";
      wait for 10 ns;
			RFSOURCE<="01";
			DATATOMEM <= X"FFFF0000";
         ALU_RESULT <= X"11111111";
         PC <= X"0000000F";
      wait for 10 ns;
			RFSOURCE<="10";
			DATATOMEM <= X"FFFF0000";
         ALU_RESULT <= X"11111111";
         PC <= X"0000000F";
      wait;
   END PROCESS;

END;
