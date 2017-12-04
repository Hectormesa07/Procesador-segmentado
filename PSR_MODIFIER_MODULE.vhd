----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:48 10/22/2017 
-- Design Name: 
-- Module Name:    PSR_MODIFIER_MODULE - Behavioral 
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

entity PSR_MODIFIER_MODULE is
    Port ( CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           OP2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           ALU_RESULT : in  STD_LOGIC_VECTOR (31 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0));
end PSR_MODIFIER_MODULE;

architecture Behavioral of PSR_MODIFIER_MODULE is

begin
process (ALUOP,CRS1,OP2,ALU_RESULT)

begin
   case ALUOP is
		-- LOGICAL INSTRUCTIONS	
		when "010001" =>													--ANDcc
			NZVC(3) <= ALU_RESULT(31);
			IF (ALU_RESULT=X"00000000") THEN
				NZVC(2) <= '1';
			ELSE
				NZVC(2) <= '0';
			END IF;
			NZVC(1) <= '0';
			NZVC(0) <= '0';
		when "010101" =>													--ANDNcc
			NZVC(3) <= ALU_RESULT(31);
			IF (ALU_RESULT=X"00000000") THEN
				NZVC(2) <= '1';
			ELSE
				NZVC(2) <= '0';
			END IF;
			NZVC(1) <= '0';
			NZVC(0) <= '0';
		when "010010" =>													--ORcc
			NZVC(3) <= ALU_RESULT(31);
			IF (ALU_RESULT=X"00000000") THEN
				NZVC(2) <= '1';
			ELSE
				NZVC(2) <= '0';
			END IF;
			NZVC(1) <= '0';
			NZVC(0) <= '0';
		when "010110" =>													--ORNcc
			NZVC(3) <= ALU_RESULT(31);
			IF (ALU_RESULT=X"00000000") THEN
				NZVC(2) <= '1';
			ELSE
				NZVC(2) <= '0';
			END IF;
			NZVC(1) <= '0';
			NZVC(0) <= '0';
		when "010011" => 													--XORcc
			NZVC(3) <= ALU_RESULT(31);
			IF (ALU_RESULT=X"00000000") THEN
				NZVC(2) <= '1';
			ELSE
				NZVC(2) <= '0';
			END IF;
			NZVC(1) <= '0';
			NZVC(0) <= '0';
		when "010111" => 													--XORNcc
			NZVC(3) <= ALU_RESULT(31);
			IF (ALU_RESULT=X"00000000") THEN
				NZVC(2) <= '1';
			ELSE
				NZVC(2) <= '0';
			END IF;
			NZVC(1) <= '0';
			NZVC(0) <= '0';
		-- ADD INSTRUCTIONS
		when "010000" => 													--ADDcc
			NZVC(3) <= ALU_RESULT(31);
			IF (ALU_RESULT=X"00000000") THEN
				NZVC(2) <= '1';
			ELSE
				NZVC(2) <= '0';
			END IF;
			NZVC(1) <= (CRS1(31) AND OP2(31) AND (NOT ALU_RESULT(31))) OR ((NOT CRS1(31)) AND (NOT OP2(31)) AND ALU_RESULT(31));
			NZVC(0) <= (CRS1(31) AND OP2(31)) OR ((NOT ALU_RESULT(31)) AND (CRS1(31) OR OP2(31)));
		when "011000" => 													--ADDXcc
			NZVC(3) <= ALU_RESULT(31);
			IF (ALU_RESULT=X"00000000") THEN
				NZVC(2) <= '1';
			ELSE
				NZVC(2) <= '0';
			END IF;
			NZVC(1) <= (CRS1(31) AND OP2(31) AND (NOT ALU_RESULT(31))) OR ( (NOT CRS1(31)) AND (NOT OP2(31)) AND ALU_RESULT(31));
			NZVC(0) <= (CRS1(31) AND OP2(31)) OR ((NOT ALU_RESULT(31)) AND (CRS1(31) OR OP2(31)));
		when "010100" =>													--SUBcc
			NZVC(3) <= ALU_RESULT(31);
			IF (ALU_RESULT=X"00000000") THEN
				NZVC(2) <= '1';
			ELSE
				NZVC(2) <= '0';
			END IF;
			NZVC(1) <= (CRS1(31) AND (NOT OP2(31)) AND (NOT ALU_RESULT(31))) OR ( (NOT CRS1(31)) AND OP2(31) AND ALU_RESULT(31));
			NZVC(0) <= ((NOT CRS1(31)) AND OP2(31)) OR ( ALU_RESULT(31) AND ((NOT CRS1(31)) OR OP2(31)));
		when "011100" =>													--SUBXcc
			NZVC(3) <= ALU_RESULT(31);
			IF (ALU_RESULT=X"00000000") THEN
				NZVC(2) <= '1';
			ELSE
				NZVC(2) <= '0';
			END IF;
			NZVC(1) <= (CRS1(31) AND (NOT OP2(31)) AND (NOT ALU_RESULT(31))) OR ( (NOT CRS1(31)) AND OP2(31) AND ALU_RESULT(31));
			NZVC(0) <= ((NOT CRS1(31)) AND OP2(31)) OR ( ALU_RESULT(31) AND ((NOT CRS1(31)) OR OP2(31)));
		when others => 
			NZVC(3) <= '0';
			NZVC(2) <= '0';
			NZVC(1) <= '0';
			NZVC(0) <= '0';
   end case;
end process;

end Behavioral;

