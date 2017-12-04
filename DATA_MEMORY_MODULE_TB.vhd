--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:43:12 10/21/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/DATA_MEMORY_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DATA_MEMORY_MODULE
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
 
ENTITY DATA_MEMORY_MODULE_TB IS
END DATA_MEMORY_MODULE_TB;
 
ARCHITECTURE behavior OF DATA_MEMORY_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DATA_MEMORY_MODULE
    PORT(
         RST : IN  std_logic;
         ALU_RESULT : IN  std_logic_vector(4 downto 0);
         cRD : IN  std_logic_vector(31 downto 0);
         WRDENMEM : IN  std_logic;
         DATATOMEM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal ALU_RESULT : std_logic_vector(4 downto 0) := (others => '0');
   signal cRD : std_logic_vector(31 downto 0) := (others => '0');
   signal WRDENMEM : std_logic := '0';

 	--Outputs
   signal DATATOMEM : std_logic_vector(31 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DATA_MEMORY_MODULE PORT MAP (
          RST => RST,
          ALU_RESULT => ALU_RESULT,
          cRD => cRD,
          WRDENMEM => WRDENMEM,
          DATATOMEM => DATATOMEM
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;
		RST<='0';		
		WRDENMEM <= '0';
		ALU_RESULT <= "00000";
		CRD <=X"00000001";
		wait for 40 ns;
		RST<='0';		
		WRDENMEM <= '1';
		ALU_RESULT <= "00001";
		CRD <=X"11010111";
		wait for 20 ns;
		RST<='0';		
		WRDENMEM <= '0';
		ALU_RESULT <= "00001";
		CRD <=X"11001011";
		wait for 20 ns;
		RST<='0';		
		WRDENMEM <= '1';
		ALU_RESULT <= "00010";
		CRD <=X"10110101";
		wait for 20 ns;
		RST<='0';		
		WRDENMEM <= '0';
		ALU_RESULT <= "00010";
		CRD <=X"01010101";
		wait for 20 ns;
		RST<='0';		
		WRDENMEM <= '1';
		ALU_RESULT <= "00011";
		CRD <=X"01010011";
		wait for 20 ns;
		RST<='0';		
		WRDENMEM <= '0';
		ALU_RESULT <= "00011";
		CRD <=X"11000001";
		wait for 20 ns;
		RST<='0';		
		WRDENMEM <= '1';
		ALU_RESULT <= "00100";
		CRD <=X"10001111";
		wait for 20 ns;
		RST<='1';		
		WRDENMEM <= '0';
		ALU_RESULT <= "00100";
		CRD <=X"10101010";
		wait;
   end process;

END;
