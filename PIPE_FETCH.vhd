----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:49:11 12/03/2017 
-- Design Name: 
-- Module Name:    PIPE_FETCH - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PIPE_FETCH is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  PC_IN : IN STD_LOGIC_VECTOR (31 downto 0);
			  SDISP22_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			  SDISP30_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			  INSTRUCTION_IN : IN STD_LOGIC_VECTOR (31 downto 0);
			  RFDEST_IN: IN STD_LOGIC ;
			  WE_IN : IN STD_LOGIC;
			  CWP_IN : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
			  ICC_IN : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			  DATATOREG_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			  PC_OUT : OUT STD_LOGIC_VECTOR (31 downto 0);
			  SDISP22_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		     SDISP30_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			  INSTRUCTION_OUT : OUT STD_LOGIC_VECTOR (31 downto 0);
			  PC_PLUS_ONE_OUT : OUT STD_LOGIC_VECTOR (31 downto 0);
			  RFDEST_OUT: OUT STD_LOGIC ;
			  WE_OUT : OUT STD_LOGIC;
			  CWP_OUT : OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
			  ICC_OUT : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			  DATATOREG_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
end PIPE_FETCH;

architecture Behavioral of PIPE_FETCH is

begin
PROCESS(CLK,RST)
	BEGIN
		IF RST = '1' THEN
			PC_OUT <= X"00000000";
			SDISP22_OUT <= X"00000000";
		   SDISP30_OUT <= X"00000000";
			INSTRUCTION_OUT<=X"00000000";
			RFDEST_OUT <= '0';
		   WE_OUT <= '0';
		   CWP_OUT <= "0";
		   ICC_OUT <= "0000";
		   DATATOREG_OUT <= X"00000000";
		ELSIF (CLK'EVENT AND CLK='1') THEN
			PC_OUT <= PC_IN;
			SDISP22_OUT <= SDISP22_IN;
		   SDISP30_OUT <= SDISP30_IN;
			INSTRUCTION_OUT<=INSTRUCTION_IN;
			RFDEST_OUT <= RFDEST_IN;
		   WE_OUT <= WE_IN;
		   CWP_OUT <= CWP_IN;
		   ICC_OUT <= ICC_IN;
		   DATATOREG_OUT <= DATATOREG_IN;
		END IF;
	END PROCESS;

end Behavioral;

