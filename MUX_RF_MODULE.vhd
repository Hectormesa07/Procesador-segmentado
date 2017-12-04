----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:25:08 10/21/2017 
-- Design Name: 
-- Module Name:    MUX_RF_MODULE - Behavioral 
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

entity MUX_RF_MODULE is
    Port ( I : in  STD_LOGIC;
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           SIMM : in  STD_LOGIC_VECTOR (31 downto 0);
           OP2 : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_RF_MODULE;

ARCHITECTURE MUX of MUX_RF_MODULE is

BEGIN
	PROCESS(I,CRS2,SIMM)
	BEGIN
		CASE I IS
			WHEN '0' =>	OP2 <= CRS2;
			WHEN OTHERS => OP2 <= SIMM;
		END CASE;
	END PROCESS;
END MUX;

