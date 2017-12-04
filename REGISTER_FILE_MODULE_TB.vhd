--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:47:35 10/22/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/REGISTER_FILE_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: REGITER_FILE_MODULE
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
 
ENTITY REGISTER_FILE_MODULE_TB IS
END REGISTER_FILE_MODULE_TB;
 
ARCHITECTURE behavior OF REGISTER_FILE_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT REGITER_FILE_MODULE
    PORT(
         NRS1 : IN  std_logic_vector(5 downto 0);
         NRS2 : IN  std_logic_vector(5 downto 0);
         NRD : IN  std_logic_vector(5 downto 0);
         RST : IN  std_logic;
         WE : IN  std_logic;
         DATATOREG : IN  std_logic_vector(31 downto 0);
         CRS1 : OUT  std_logic_vector(31 downto 0);
         CRD : OUT  std_logic_vector(31 downto 0);
         CRS2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal NRS1 : std_logic_vector(5 downto 0) := (others => '0');
   signal NRS2 : std_logic_vector(5 downto 0) := (others => '0');
   signal NRD : std_logic_vector(5 downto 0) := (others => '0');
   signal RST : std_logic := '0';
   signal WE : std_logic := '0';
   signal DATATOREG : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal CRS1 : std_logic_vector(31 downto 0);
   signal CRD : std_logic_vector(31 downto 0);
   signal CRS2 : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: REGITER_FILE_MODULE PORT MAP (
          NRS1 => NRS1,
          NRS2 => NRS2,
          NRD => NRD,
          RST => RST,
          WE => WE,
          DATATOREG => DATATOREG,
          CRS1 => CRS1,
          CRD => CRD,
          CRS2 => CRS2
        );

   -- Stimulus process
   stim_proc: process
   begin		
      NRS1<="000000";
		NRS2<="000000";
		NRD<="010000";
		RST<='0';
		WE<='1';
		DATATOREG<=X"00000001";
		WAIT FOR 10 NS;
		NRS1<="000000";
		NRS2<="000000";
		NRD<="010001";
		RST<='0';
		WE<='1';
		DATATOREG<=X"00000002";
      WAIT FOR 10 NS;
		NRS1<="000000";
		NRS2<="000000";
		NRD<="010010";
		RST<='0';
		WE<='0';
		DATATOREG<=X"00000003";
		WAIT FOR 10 NS;
		NRS1<="010000";
		NRS2<="010001";
		NRD<="010000";
		RST<='0';
		WE<='0';
		DATATOREG<=X"00000001";
		WAIT FOR 10 NS;
		NRS1<="010000";
		NRS2<="010001";
		NRD<="010000";
		RST<='1';
		WE<='1';
		DATATOREG<=X"00000001";
		wait;
   end process;

END;
