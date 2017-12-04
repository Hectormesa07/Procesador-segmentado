----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:11:45 10/21/2017 
-- Design Name: 
-- Module Name:    CONTROL_UNIT_MODULE - Behavioral 
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


entity CONTROL_UNIT_MODULE is
    Port ( OP : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			  OP2 : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
           OP3 : in  STD_LOGIC_VECTOR (5 DOWNTO 0);
           ICC : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			  COND : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			  PCSOURCE : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			  ALUOP : out  STD_LOGIC_VECTOR (5 DOWNTO 0);
			  WRDENMEM : OUT STD_LOGIC;
			  RFSOURCE : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			  RFDEST : OUT STD_LOGIC;
			  WE : OUT STD_LOGIC
			  );
			  
end CONTROL_UNIT_MODULE;

architecture Behavioral of CONTROL_UNIT_MODULE is

begin
process(OP,OP2,OP3,COND,ICC)
begin
	CASE OP IS
		WHEN "00" => 
			ALUOP<="111111";
			WRDENMEM<='0';
			WE<='0';
			RFDEST<='0';
			RFSOURCE<="10";
			CASE OP2 IS 
				WHEN "010" =>
				CASE COND IS
					WHEN "1000" => 					--BRANCH ALWAYS
						PCSOURCE<="01";
					WHEN "0000" =>						--BRANCH NEVER
						PCSOURCE<="10";
					WHEN "1001" =>						--BRANCH NOT EQUAL
						IF NOT(ICC(2))='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "0001" =>						--BRANCH EQUAL
						IF ICC(2)='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "1010" =>						--BRANCH GREATER
						IF NOT(ICC(2) OR (ICC(3) XOR ICC(1)))='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "0010" =>						--BRANCH LESS OR EQUAL
						IF  ((ICC(2) OR ICC(3)) XOR ICC(1))='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "1011" =>						--BRANCH GREATER EQUAL
						IF  NOT(ICC(3) XOR ICC(1))='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "0011" =>						--BRANCH LESS
						IF (ICC(3) XOR ICC(1))='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "1100" =>						--BRANCH GREATER UNSIGNED
						IF  NOT(ICC(0) OR ICC(2))='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "0100" =>						--LESS OR EQUAL UNSIGNED
						IF (ICC(0) OR ICC(2))='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "1101" =>						--BRANCH CARRY CLEAR
						IF  NOT(ICC(0))='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "0101" =>						--BRANCH CARRY SET
						IF  ICC(0)='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "1110" =>						--BRANCH POSITIVE
						IF  NOT(ICC(3))='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "0110" =>						--BRANCH NEGATIVE
						IF  ICC(3)='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "1111" =>						--BRANCH OVERFLOW CLEAR
						IF NOT(ICC(1))='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN "0111" =>						--BRANCH OVERFLOW SET
						IF ICC(1)='1' THEN
							PCSOURCE<="01";
						ELSE
							PCSOURCE<="10";
						END IF;
					WHEN OTHERS => 
						PCSOURCE<="10";
				END CASE;
				WHEN OTHERS =>
					PCSOURCE<="10";
				END CASE;
		WHEN "10" => 
			CASE OP3 IS
				WHEN "111000" =>				--JUMP AND LINK
					ALUOP <= "000000";
					PCSOURCE<="11";
					WRDENMEM<='0';
					WE<='1';
					RFDEST<='0';
					RFSOURCE<="01";
				WHEN OTHERS =>					--ARITMETICAS Y LOGICAS
					ALUOP <= OP3;
					PCSOURCE<="10";
					WRDENMEM<='0';
					WE<='1';
					RFDEST<='0';
					RFSOURCE<="01";
			END CASE;
		WHEN "01" =>							--CALL
				ALUOP <= "111111";
				PCSOURCE<="00";
				WRDENMEM<='0';
				WE<='1';
				RFDEST<='1';
				RFSOURCE<="10";
		WHEN "11" =>							--MEMORY INSTRUCTIONS 
				CASE OP3 IS
					WHEN "000000" =>
						ALUOP <= "000000";
						PCSOURCE<="10";
						WRDENMEM<='0';
						WE<='1';
						RFDEST<='0';
						RFSOURCE<="00";
					WHEN "000100" =>
						ALUOP <= "000000";
						PCSOURCE<="10";
						WRDENMEM<='1';
						WE<='0';
						RFDEST<='0';
						RFSOURCE<="10";
					WHEN OTHERS =>
						ALUOP<="111111";
				END CASE;
		WHEN OTHERS => ALUOP <= "000000";
	END CASE;

end process;

end Behavioral;
