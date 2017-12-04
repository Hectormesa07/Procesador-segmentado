----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:22:14 10/21/2017 
-- Design Name: 
-- Module Name:    DATA_MEMORY_MODULE - Behavioral 
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY DATA_MEMORY_MODULE IS
	Port ( RST : in STD_LOGIC;
			 CLK : IN STD_LOGIC;
			 ALU_RESULT : in  STD_LOGIC_VECTOR (4 downto 0);
          cRD : in  STD_LOGIC_VECTOR (31 downto 0);
          WRDENMEM : in  STD_LOGIC;
          DATATOMEM : out  STD_LOGIC_VECTOR (31 downto 0));
END DATA_MEMORY_MODULE;

ARCHITECTURE SP_DATA_MEMORY OF DATA_MEMORY_MODULE IS

TYPE RAM_TYPE IS ARRAY (31 DOWNTO 0) OF STD_LOGIC_VECTOR(31 DOWNTO 0);

SIGNAL RAM:RAM_TYPE := ( OTHERS => X"00000000");

BEGIN

PROCESS(RST,WRDENMEM,RAM,ALU_RESULT,cRD,CLK)
	BEGIN
		IF RST = '1' THEN
			RAM <= (OTHERS => X"00000000");
			DATATOMEM <= (OTHERS => '0');
		ELSE 
			IF CLK'EVENT AND CLK='0' THEN
				CASE WRDENMEM IS
					WHEN '1' => RAM(TO_INTEGER(UNSIGNED(ALU_RESULT))) <= cRD;
					WHEN OTHERS =>DATATOMEM <= RAM(TO_INTEGER(UNSIGNED(ALU_RESULT)));
				END CASE;
			END IF;
		END IF;
	END PROCESS;

END SP_DATA_MEMORY;

