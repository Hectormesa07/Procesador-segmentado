--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:51:33 10/22/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/PSR_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR_MODULE
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
 
ENTITY PSR_MODULE_TB IS
END PSR_MODULE_TB;
 
ARCHITECTURE behavior OF PSR_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR_MODULE
    PORT(
         CLK : IN  std_logic;
         NZVC : IN  std_logic_vector(3 downto 0);
         RST : IN  std_logic;
         NCWP : IN  std_logic_vector(0 downto 0);
			ICC : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         CWP : OUT  std_logic_vector(0 downto 0);
         C : OUT  std_logic_vector(0 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal NZVC : std_logic_vector(3 downto 0) := (others => '0');
   signal RST : std_logic := '0';
   signal NCWP : std_logic_vector(0 downto 0) := (others => '0');

 	--Outputs
	SIGNAL ICC : STD_LOGIC_VECTOR(3 DOWNTO 0);
   signal CWP : std_logic_vector(0 downto 0);
   signal C : std_logic_vector(0 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR_MODULE PORT MAP (
          CLK => CLK,
          NZVC => NZVC,
          RST => RST,
          NCWP => NCWP,
			 ICC => ICC,
          CWP => CWP,
          C => C
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		WAIT FOR 5 NS;
		RST<='1';
		NCWP<="1";
		NZVC<="0101";
		WAIT FOR 10 NS;
      RST<='0';
		NCWP<="1";
		NZVC<="0101";
		WAIT FOR 10 NS;
		NCWP<="1";
		NZVC<="0100";
		WAIT FOR 10 NS;
		NCWP<="0";
		NZVC<="0001";
		WAIT FOR 10 NS;
		NCWP<="1";
		NZVC<="1000";
		wait;
   end process;

END;
