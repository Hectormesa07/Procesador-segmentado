----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:23:43 10/21/2017 
-- Design Name: 
-- Module Name:    MUX_DM_MODULE - Behavioral 
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

ENTITY MUX_DM_MODULE IS
	PORT(	RFSOURCE : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			DATATOMEM : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			ALU_RESULT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			PC : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			DATATOREG : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END MUX_DM_MODULE;

ARCHITECTURE MUX OF MUX_DM_MODULE IS

BEGIN
	PROCESS (RFSOURCE,DATATOMEM,ALU_RESULT,PC)
	BEGIN
		CASE RFSOURCE IS
			WHEN "00" => DATATOREG <= DATATOMEM;
			WHEN "01" => DATATOREG <= ALU_RESULT;
			WHEN "10" => DATATOREG <= PC;
			WHEN OTHERS => DATATOREG <= ALU_RESULT;
		END CASE;
	END PROCESS;
END MUX;

