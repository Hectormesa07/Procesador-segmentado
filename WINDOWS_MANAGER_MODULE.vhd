----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:41:31 10/22/2017 
-- Design Name: 
-- Module Name:    WINDOWS_MANAGER_MODULE - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity WINDOWS_MANAGER_MODULE is
    Port ( CWP : in  STD_LOGIC_VECTOR(0 DOWNTO 0);
				OP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			  OP3 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			  RS1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			  RS2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			  RD : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
           NCWP : out  STD_LOGIC_VECTOR(0 DOWNTO 0);
           NRS1 : out  STD_LOGIC_VECTOR (5 downto 0);
           NRS2 : out  STD_LOGIC_VECTOR (5 downto 0);
           NRD : out  STD_LOGIC_VECTOR (5 downto 0));
end WINDOWS_MANAGER_MODULE;

architecture Behavioral of WINDOWS_MANAGER_MODULE is

begin
	PROCESS(OP,OP3,RS1,RS2,RD,CWP)
	BEGIN
		CASE OP IS
			WHEN "00"=>
				NCWP <= CWP;
				NRS1 <= "000000";
				NRS2 <= "000000";
				NRD <= "000000";
			WHEN "01" =>
				NCWP <= CWP;
				NRS1 <= "000000";
				NRS2 <= "000000";
				NRD <= "000000";
			WHEN OTHERS =>
				CASE OP3 IS
					-- SAVE
					WHEN "111100" =>
						IF RS1>="11000" and RS1<="11111" then -- REGS i
							nRS1<= RS1-(CWP*"10000");
						END IF;
						IF (RS1>="10000" and RS1<="10111")or(RS1>="01000" and RS1<="01111") then -- REGS o AND REGS l
							nRS1 <= RS1+(CWP*"10000");
						END IF;
						IF RS1 >= "00000" and  RS1 <= "00111" then -- REGS g
							nRS1 <= '0' & RS1;
						END IF;
						IF RS2>="11000" and RS2<="11111" then -- REGS i
							nRS2<=RS2-(CWP*"10000");
						END IF;
						IF (RS2>="10000" and RS2<="10111")or(RS2>="01000" and RS2<="01111") then -- REGS o AND REGS l
							nRS2 <= RS2+(CWP*"10000");
						END IF;
						IF RS2>="00000" and  RS2 <= "00111" then -- REGS g
							nRS2 <= '0' & RS2;
						END IF;
						IF RD>="11000" and RD<="11111" then -- REGS i
							nRD<=RD-((CWP-1)*"10000");
						END IF;
						IF (RD>="10000" and RD<="10111")or(RD>="01000" and RD<="01111") then -- REGS o AND REGS l
							nRD <= RD+((CWP-1)*"10000");
						END IF;
						IF RD>="00000" and  RD <= "00111" then -- REGS g
							nRD <= '0' & RD;
						END IF;
						NCWP <= (CWP-1);
					-- RESTORE 
					WHEN "111101" =>
						IF RS1>="11000" and RS1<="11111" then -- REGS i
							nRS1<= RS1-(CWP*"10000");
						END IF;
						IF (RS1>="10000" and RS1<="10111")or(RS1>="01000" and RS1<="01111") then -- REGS o AND REGS l
							nRS1 <= RS1+(CWP*"10000");
						END IF;
						IF RS1 >= "00000" and  RS1 <= "00111" then -- REGS g
							nRS1 <= '0' & RS1;
						END IF;
						IF RS2>="11000" and RS2<="11111" then -- REGS i
							nRS2<=RS2-(CWP*"10000");
						END IF;
						IF (RS2>="10000" and RS2<="10111")or(RS2>="01000" and RS2<="01111") then -- REGS o AND REGS l
							nRS2 <= RS2+(CWP*"10000");
						END IF;
						IF RS2>="00000" and  RS2 <= "00111" then -- REGS g
							nRS2 <= '0' & RS2;
						END IF;
						IF RD>="11000" and RD<="11111" then -- REGS i
							nRD<=RD-((CWP+1)*"10000");
						END IF;
						IF (RD>="10000" and RD<="10111")or(RD>="01000" and RD<="01111") then -- REGS o AND REGS l
							nRD <= RD+((CWP+1)*"10000");
						END IF;
						IF RD>="00000" and  RD <= "00111" then -- REGS g
							nRD <= '0' & RD;
						END IF;
						NCWP <= (CWP+1);
					WHEN OTHERS=>
						IF RS1>="11000" and RS1<="11111" then -- REGS i
							nRS1<= RS1-(CWP*"10000");
						END IF;
						IF (RS1>="10000" and RS1<="10111")or(RS1>="01000" and RS1<="01111") then -- REGS o AND REGS l
							nRS1 <= RS1+(CWP*"10000");
						END IF;
						IF RS1 >= "00000" and  RS1 <= "00111" then -- REGS g
							nRS1 <= '0' & RS1;
						END IF;
						IF RS2>="11000" and RS2<="11111" then -- REGS i
							nRS2<=RS2-(CWP*"10000");
						END IF;
						IF (RS2>="10000" and RS2<="10111")or(RS2>="01000" and RS2<="01111") then -- REGS o AND REGS l
							nRS2 <= RS2+(CWP*"10000");
						END IF;
						IF RS2>="00000" and  RS2 <= "00111" then -- REGS g
							nRS2 <= '0' & RS2;
						END IF;
						IF RD>="11000" and RD<="11111" then -- REGS i
							nRD<=RD-(CWP*"10000");
						END IF;
						IF (RD>="10000" and RD<="10111")or(RD>="01000" and RD<="01111") then -- REGS o AND REGS l
							nRD <= RD+(CWP*"10000");
						END IF;
						IF RD>="00000" and  RD <= "00111" then -- REGS g
							nRD <= '0' & RD;
						END IF;
						NCWP <= CWP;
				END CASE;
		END CASE;
	END PROCESS;
end Behavioral;

