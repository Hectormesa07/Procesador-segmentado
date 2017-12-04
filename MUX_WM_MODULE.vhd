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

ENTITY MUX_WM_MODULE IS
    PORT ( RFDEST : IN  STD_LOGIC;
           RD : IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
           NRD : OUT  STD_LOGIC_VECTOR (5 DOWNTO 0));
END MUX_WM_MODULE;

ARCHITECTURE MUX OF MUX_WM_MODULE IS

BEGIN
	PROCESS(RFDEST,RD)
	BEGIN
		CASE RFDEST IS
			WHEN '0' => NRD<=RD;
			WHEN OTHERS => NRD<="001111";
		END CASE;
	END PROCESS;

END MUX;