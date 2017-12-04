----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:15:25 10/22/2017 
-- Design Name: 
-- Module Name:    SEU_BR_MODULE - Behavioral 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEU_BR_MODULE is
    Port ( DISP22 : in  STD_LOGIC_VECTOR (21 downto 0);
           SDISP22 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_BR_MODULE;

ARCHITECTURE SEU OF SEU_BR_MODULE IS

BEGIN
	PROCESS(DISP22)
	BEGIN
		CASE DISP22(21) IS 
			WHEN '0' => SDISP22 <= STD_LOGIC_VECTOR("00000000000000000000000000000000" + DISP22);
			WHEN OTHERS => SDISP22 <= STD_LOGIC_VECTOR("11111111110000000000000000000000" + DISP22);
		END CASE;
	END PROCESS;
END SEU;

