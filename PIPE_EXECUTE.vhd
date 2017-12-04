----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:24:28 12/03/2017 
-- Design Name: 
-- Module Name:    PIPE_EXECUTE - Behavioral 
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

entity PIPE_EXECUTE is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  ALURESULT_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			  ICC_IN : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			  CWP_IN : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
			  WRDENMEM_IN : IN STD_LOGIC;
			  RFDEST_IN : IN STD_LOGIC;
			  WE_IN : IN STD_LOGIC;
			  RFSOURCE_IN : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			  PC_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			  CRD_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			  ALURESULT_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			  ICC_OUT : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			  CWP_OUT : OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
			  WRDENMEM_OUT : OUT STD_LOGIC;
			  RFDEST_OUT : OUT STD_LOGIC;
			  WE_OUT : OUT STD_LOGIC;
			  RFSOURCE_OUT : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			  PC_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			  CRD_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
			  );
end PIPE_EXECUTE;

architecture Behavioral of PIPE_EXECUTE is

begin
PROCESS(CLK,RST)
	BEGIN
		IF RST = '1' THEN
			ALURESULT_OUT <= X"00000000";
			ICC_OUT <= X"0";
			CWP_OUT <= "0";
			WRDENMEM_OUT <= '0';
			RFDEST_OUT <= '0';
			WE_OUT <= '0';
			RFSOURCE_OUT <= "00";
			PC_OUT <= X"00000000";
			CRD_OUT <= X"00000000";
		ELSIF (CLK'EVENT AND CLK='1') THEN
			ALURESULT_OUT <= ALURESULT_IN;
			ICC_OUT <= ICC_IN;
			CWP_OUT <= CWP_IN;
			WRDENMEM_OUT <= WRDENMEM_IN;
			RFDEST_OUT <= RFDEST_IN;
			WE_OUT <= WE_IN;
			RFSOURCE_OUT <= RFSOURCE_IN;
			PC_OUT <= PC_IN;
			CRD_OUT <= CRD_IN;
		END IF;
END PROCESS;

end Behavioral;

