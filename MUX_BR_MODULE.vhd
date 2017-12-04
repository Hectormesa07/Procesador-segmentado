----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:45:28 10/21/2017 
-- Design Name: 
-- Module Name:    MUX_BR_MODULE - Behavioral 
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

ENTITY MUX_BR_MODULE IS
	PORT(	PCSOURCE : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			CALL : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			BRANCHS : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			PC : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			ALU_RESULT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			DATATONPC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END MUX_BR_MODULE;

ARCHITECTURE MUX OF MUX_BR_MODULE IS

BEGIN
	PROCESS (PCSOURCE,CALL,BRANCHS,ALU_RESULT,PC)
	BEGIN
		CASE PCSOURCE IS
			WHEN "00" => DATATONPC <= CALL;
			WHEN "01" => DATATONPC <= BRANCHS;
			WHEN "10" => DATATONPC <= PC;
			WHEN "11" => DATATONPC <= ALU_RESULT;
			WHEN OTHERS => DATATONPC <= ALU_RESULT;
		END CASE;
	END PROCESS;
END MUX;
