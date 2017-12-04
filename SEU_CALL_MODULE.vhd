----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:01:44 10/22/2017 
-- Design Name: 
-- Module Name:    SEU_CALL_MODULE - Behavioral 
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

entity SEU_CALL_MODULE is
    Port ( DISP30 : in  STD_LOGIC_VECTOR (29 downto 0);
           SDISP30 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_CALL_MODULE;

ARCHITECTURE SEU OF SEU_CALL_MODULE IS

BEGIN
	PROCESS(DISP30)
	BEGIN
		CASE DISP30(29) IS
			WHEN '0' => SDISP30 <= STD_LOGIC_VECTOR("00000000000000000000000000000000"+DISP30);
			WHEN OTHERS => SDISP30 <= STD_LOGIC_VECTOR("11000000000000000000000000000000"+DISP30);
		END CASE;
	END PROCESS;
END SEU;

