----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:39:02 10/22/2017 
-- Design Name: 
-- Module Name:    REGISTER_FILE_MODULE - Behavioral 
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
use ieee.NUMERIC_STD.all;

entity REGITER_FILE_MODULE is
    Port ( NRS1 : in  STD_LOGIC_VECTOR (5 downto 0);
           NRS2 : in  STD_LOGIC_VECTOR (5 downto 0);
           NRD : in  STD_LOGIC_VECTOR (5 downto 0);
           RST : in  STD_LOGIC;
			  WE : IN STD_LOGIC;
           DATATOREG : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
			  CRD : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0));
end REGITER_FILE_MODULE;

architecture Behavioral of REGITER_FILE_MODULE is

type RAM_TYPE is array (0 to 39) of std_logic_vector (31 downto 0); 
signal RAM: RAM_TYPE := (	"00000000000000000000000000000000",
									"00000000000000000000000000001111",
									"00000000000000000000000000000011",
					  others => "00000000000000000000000000000000");	 
begin
	
	PROCESS(RST,NRS1,NRS2,NRD,WE,DATATOREG,RAM)
	BEGIN
		IF RST = '1' then
			RAM <= (others => "00000000000000000000000000000000");
			CRS1 <= (others =>'0');
			CRS2 <= (others =>'0');
			CRD <=(OTHERS => '0');
		ELSE
			CRS1 <= RAM(TO_INTEGER(UNSIGNED(NRS1)));
			CRS2 <= RAM(TO_INTEGER(UNSIGNED(NRS2)));
			CRD <= RAM(TO_INTEGER(UNSIGNED(NRD)));
			IF NRD /= "000000" AND WE = '1' THEN
				RAM(TO_INTEGER(UNSIGNED(NRD))) <= DATATOREG;
			END IF;
		END IF;
	END PROCESS;
end Behavioral;