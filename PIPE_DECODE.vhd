----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:49 12/03/2017 
-- Design Name: 
-- Module Name:    PIPE_DECODE - Behavioral 
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

entity PIPE_DECODE is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PC_IN : in  STD_LOGIC_VECTOR (31 downto 0);
			  PCSOURCE_IN : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			  ALUOP_IN : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			  WRDENMEM_IN : IN STD_LOGIC;
			  RFSOURCE_IN : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			  RFDEST_IN : IN STD_LOGIC;
			  WE_IN : IN STD_LOGIC;
			  CRS1_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			  CRD_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			  OP2_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			  NCWP_IN : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
           PC_OUT : OUT  STD_LOGIC_VECTOR (31 downto 0);
			  PCSOURCE_OUT : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			  ALUOP_OUT : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
			  WRDENMEM_OUT : OUT STD_LOGIC;
			  RFSOURCE_OUT : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			  RFDEST_OUT : OUT STD_LOGIC;
			  WE_OUT : OUT STD_LOGIC;
			  CRS1_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			  CRD_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			  OP2_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			  NCWP_OUT : OUT STD_LOGIC_VECTOR (0 DOWNTO 0)
			  );
end PIPE_DECODE;

architecture Behavioral of PIPE_DECODE is

begin
PROCESS(CLK,RST)
	BEGIN
		IF RST = '1' THEN
			PC_OUT <= X"00000000";
			PCSOURCE_OUT <= "10";
			ALUOP_OUT <= "000000";
			WRDENMEM_OUT <= '0';
			RFSOURCE_OUT <= "00";
			RFDEST_OUT <= '0';
			WE_OUT <= '0';
			CRS1_OUT <= X"00000000";
			CRD_OUT <= X"00000000";
			OP2_OUT <= X"00000000";
			NCWP_OUT <= "0";
		ELSIF (CLK'EVENT AND CLK='1') THEN
			PC_OUT <= PC_IN;
			PCSOURCE_OUT <= PCSOURCE_IN;
			ALUOP_OUT <= ALUOP_IN;
			WRDENMEM_OUT <= WRDENMEM_IN;
			RFSOURCE_OUT <= RFSOURCE_IN;
			RFDEST_OUT <= RFDEST_IN;
			WE_OUT <= WE_IN;
			CRS1_OUT <= CRS1_IN;
			CRD_OUT <= CRD_IN;
			OP2_OUT <= OP2_IN;
			NCWP_OUT <= NCWP_IN;
		END IF;
END PROCESS;

end Behavioral;

