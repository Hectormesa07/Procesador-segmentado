--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:23:49 10/22/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/WINDOWS_MANAGER_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WINDOWS_MANAGER_MODULE
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
 
ENTITY WINDOWS_MANAGER_MODULE_TB IS
END WINDOWS_MANAGER_MODULE_TB;
 
ARCHITECTURE behavior OF WINDOWS_MANAGER_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WINDOWS_MANAGER_MODULE
    PORT(
         RS1 : IN  std_logic_vector(4 downto 0);
         RS2 : IN  std_logic_vector(4 downto 0);
         RD : IN  std_logic_vector(4 downto 0);
         CWP : IN  std_logic_vector(0 downto 0);
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         NCWP : OUT  std_logic_vector(0 downto 0);
         nRS1 : OUT  std_logic_vector(5 downto 0);
         nRS2 : OUT  std_logic_vector(5 downto 0);
         nRD : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RS1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RS2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RD : std_logic_vector(4 downto 0) := (others => '0');
   signal CWP : std_logic_vector(0 downto 0) := (others => '0');
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal NCWP : std_logic_vector(0 downto 0);
   signal nRS1 : std_logic_vector(5 downto 0);
   signal nRS2 : std_logic_vector(5 downto 0);
   signal nRD : std_logic_vector(5 downto 0);
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WINDOWS_MANAGER_MODULE PORT MAP (
          RS1 => RS1,
          RS2 => RS2,
          RD => RD,
          CWP => CWP,
          OP => OP,
          OP3 => OP3,
          NCWP => NCWP,
          nRS1 => nRS1,
          nRS2 => nRS2,
          nRD => nRD
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		RS1<="00001";
		RS2<="00010";
		CWP<="0";
		OP<="00";
		OP3<="000000";
		wait for 10 ns;
		
		RS1<="11000";
		RS2<="11111";
		CWP<="1";
		OP<="00";
		OP3<="000100";
		wait for 10 ns;
		
		RS1<="11000";
		RS2<="11111";
		CWP<="1";
		OP<="10";
		OP3<="111100";
		wait for 10 ns;
		
		RS1<="11000";
		RS2<="11111";
		CWP<="1";
		OP<="00";
		OP3<="111101";
		wait for 10 ns; 

      wait;
   end process;

END;