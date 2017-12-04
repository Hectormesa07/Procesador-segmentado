----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:11:27 10/22/2017 
-- Design Name: 
-- Module Name:    PSR_MODULE - Behavioral 
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

entity PSR_MODULE is
    Port ( CLK : in  STD_LOGIC;
           NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
           RST : in  STD_LOGIC;
           NCWP : in  STD_LOGIC_VECTOR (0 downto 0);
			  ICC : OUT STD_LOGIC_VECTOR	(3 DOWNTO 0);
           CWP : out  STD_LOGIC_VECTOR (0 downto 0);
           C : out  STD_LOGIC_VECTOR (0 downto 0));
end PSR_MODULE;

architecture Behavioral of PSR_MODULE is

SIGNAL PSREGISTER: std_logic_vector(4 downto 0):= (others =>'0') ;

BEGIN

	C(0) <= PSREGISTER(1);
	CWP(0) <= PSREGISTER(0);
	ICC <= PSREGISTER(4 DOWNTO 1);
	process(CLK,RST,NCWP,NZVC)
	BEGIN
		IF RST = '1' THEN
				PSREGISTER <= (others => '0');
		ELSE
			IF (rising_edge(CLK)) THEN
				PSREGISTER(0) <= ncwp(0);
				PSREGISTER(4 DOWNTO 1) <= NZVC;
			END IF;
		END IF;
	END PROCESS;
	
END Behavioral;

