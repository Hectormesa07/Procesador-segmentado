--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:31:49 10/21/2017
-- Design Name:   
-- Module Name:   C:/Users/Stiven/Desktop/ARQUITECTURA/PROCESADOR_III/CONTROL_UNIT_MODULE_TB.vhd
-- Project Name:  PROCESADOR_III
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CONTROL_UNIT_MODULE
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
 
ENTITY CONTROL_UNIT_MODULE_TB IS
END CONTROL_UNIT_MODULE_TB;
 
ARCHITECTURE behavior OF CONTROL_UNIT_MODULE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONTROL_UNIT_MODULE
    PORT(
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         ICC : IN  std_logic_vector(3 downto 0);
         COND : IN  std_logic_vector(3 downto 0);
         PCSOURCE : OUT  std_logic_vector(1 downto 0);
         ALUOP : OUT  std_logic_vector(5 downto 0);
         WRDENMEM : OUT  std_logic;
         RFSOURCE : OUT  std_logic_vector(1 downto 0);
         RFDEST : OUT  std_logic;
         WE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');
   signal ICC : std_logic_vector(3 downto 0) := (others => '0');
   signal COND : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal PCSOURCE : std_logic_vector(1 downto 0);
   signal ALUOP : std_logic_vector(5 downto 0);
   signal WRDENMEM : std_logic;
   signal RFSOURCE : std_logic_vector(1 downto 0);
   signal RFDEST : std_logic;
   signal WE : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROL_UNIT_MODULE PORT MAP (
          OP => OP,
          OP3 => OP3,
          ICC => ICC,
          COND => COND,
          PCSOURCE => PCSOURCE,
          ALUOP => ALUOP,
          WRDENMEM => WRDENMEM,
          RFSOURCE => RFSOURCE,
          RFDEST => RFDEST,
          WE => WE
        );
 
   -- Stimulus process
   stim_proc: process
   begin			
--			OP<="00";
--			COND<="1000";				--BRANCH ALWAYS
--			ICC<="0000";				--NZVC
--      wait for 10 ns;	
--			OP<="00";
--			COND<="0000";				--BRANCH NEVER
--			ICC<="0000";				--NZVC
--      wait for 10 ns;	
--			OP<="00";
--			COND<="1001";				--BRANCH NOT EQUAL
--			ICC<="0100";				--NZVC
--      wait for 10 ns;	
--			OP<="00";
--			COND<="1001";				--BRANCH NOT EQUAL
--			ICC<="0000";				--NZVC
--      wait for 10 ns;	
--			OP<="00";
--			COND<="0001";				--BRANCH EQUAL
--			ICC<="0100";				--NZVC
--      wait for 10 ns;	
--			OP<="00";
--			COND<="0001";				--BRANCH EQUAL
--			ICC<="0000";				--NZVC
--      wait for 10 ns;	
--			OP<="00";
--			COND<="1010";				--BRANCH GREATER
--			ICC<="0000";				--NZVC
--      wait for 10 ns;	
--			OP<="00";
--			COND<="1010";				--BRANCH GREATER
--			ICC<="0100";				--NZVC
--      wait for 10 ns;	
--			OP<="00";
--			COND<="0010";				--BRANCH LESS OR EQUAL
--			ICC<="1000";				--NZVC
--      wait for 10 ns;	
--			OP<="00";
--			COND<="0010";				--BRANCH LESS OR EQUAL
--			ICC<="1010";				--NZVC
--      wait for 10 ns;	
--			OP<="00";
--			COND<="1011";				--BRANCH GREATER OR EQUAL
--			ICC<="1010";				--NZVC
--      wait for 10 ns;	
--			OP<="00";
--			COND<="1011";				--BRANCH GREATER OR EQUAL
--			ICC<="1000";				--NZVC
		WAIT FOR 10 NS;
			OP<="10";
			OP3<="111000";				--JUMP AND LINK
		WAIT FOR 10 NS;
			OP<="10";
			OP3<="000000";				--ARITH LOGIC INSTRUCTION
		WAIT FOR 10 NS;
			OP<="11";					--LOAD
			OP3<="000000";
		WAIT FOR 10 NS;				
			OP<="11";					--STORE
			OP3<="000100";
		WAIT FOR 10 NS;				
			OP<="01";					--CALL
			OP3<="000100";
      wait;
   end process;

END;
