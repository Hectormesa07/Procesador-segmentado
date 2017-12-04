--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:51:53 10/24/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR/ALU_MODULE_TB.vhd
-- Project Name:  PROCESADOR
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_MODULE
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
 
ENTITY ALU_MODULE_TB IS
END ALU_MODULE_TB;
 
ARCHITECTURE behavior OF ALU_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_MODULE
    PORT(
         ALUOP : IN  std_logic_vector(5 downto 0);
         CRS1 : IN  std_logic_vector(31 downto 0);
         OP2 : IN  std_logic_vector(31 downto 0);
         C : IN  std_logic_vector(0 downto 0);
         ALU_RESULT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALUOP : std_logic_vector(5 downto 0) := (others => '0');
   signal CRS1 : std_logic_vector(31 downto 0) := (others => '0');
   signal OP2 : std_logic_vector(31 downto 0) := (others => '0');
   signal C : std_logic_vector(0 downto 0) := (others => '0');

 	--Outputs
   signal ALU_RESULT : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_MODULE PORT MAP (
          ALUOP => ALUOP,
          CRS1 => CRS1,
          OP2 => OP2,
          C => C,
          ALU_RESULT => ALU_RESULT
        );

   -- Stimulus process
   stim_proc: process
   begin		
      ALUOP <= "000100";
		CRS1 <= X"00000001";
		OP2  <= X"00000001";
		C	  <="0";
      wait;
   end process;

END;
