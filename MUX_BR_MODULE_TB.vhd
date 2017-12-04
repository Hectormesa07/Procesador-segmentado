--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:54:45 10/21/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/MUX_BR_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_BR_MODULE
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
 
ENTITY MUX_BR_MODULE_TB IS
END MUX_BR_MODULE_TB;
 
ARCHITECTURE behavior OF MUX_BR_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_BR_MODULE
    PORT(
         PCSOURCE : IN  std_logic_vector(1 downto 0);
         CALL : IN  std_logic_vector(31 downto 0);
         BRANCHS : IN  std_logic_vector(31 downto 0);
         PC : IN  std_logic_vector(31 downto 0);
         ALU_RESULT : IN  std_logic_vector(31 downto 0);
         DATATONPC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PCSOURCE : std_logic_vector(1 downto 0) := (others => '0');
   signal CALL : std_logic_vector(31 downto 0) := (others => '0');
   signal BRANCHS : std_logic_vector(31 downto 0) := (others => '0');
   signal PC : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_RESULT : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DATATONPC : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_BR_MODULE PORT MAP (
          PCSOURCE => PCSOURCE,
          CALL => CALL,
          BRANCHS => BRANCHS,
          PC => PC,
          ALU_RESULT => ALU_RESULT,
          DATATONPC => DATATONPC
        );

   -- Stimulus process
   STIM_PROC: PROCESS
   BEGIN		
			PCSOURCE<="00";
			CALL <= X"FFFF0000";
			BRANCHS<=X"77777777";
         ALU_RESULT <= X"11111111";
         PC <= X"0000000F";
      wait for 10 ns;
			PCSOURCE<="01";
			CALL <= X"FFFF0000";
			BRANCHS<=X"77777777";
         ALU_RESULT <= X"11111111";
         PC <= X"0000000F";
      wait for 10 ns;
			PCSOURCE<="10";
			CALL <= X"FFFF0000";
			BRANCHS<=X"77777777";
         ALU_RESULT <= X"11111111";
         PC <= X"0000000F";
		wait for 10 ns;
			PCSOURCE<="11";
			CALL <= X"FFFF0000";
			BRANCHS<=X"77777777";
         ALU_RESULT <= X"11111111";
         PC <= X"0000000F";
     wait;
   END PROCESS;

END;
