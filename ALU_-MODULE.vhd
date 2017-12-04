----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:45:59 10/22/2017 
-- Design Name: 
-- Module Name:    ALU_-MODULE - Behavioral 
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
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_MODULE is
    Port ( ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           OP2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  C : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
           ALU_RESULT : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU_MODULE;

architecture ALU of ALU_MODULE is

begin
	PROCESS(ALUOP,CRS1,OP2,C)
	BEGIN
		CASE ALUOP IS
			-- LOGICAL INSTRUCTIONS
			WHEN "000001" => ALU_RESULT <= CRS1 AND OP2;				--AND
			WHEN "010001" => ALU_RESULT <= CRS1 AND OP2;				--ANDcc
			WHEN "000101" => ALU_RESULT <= CRS1 AND NOT OP2;		--ANDN
			WHEN "010101" => ALU_RESULT <= CRS1 AND NOT OP2;		--ANDNcc
			WHEN "000010" => ALU_RESULT <= CRS1 OR OP2;				--OR
			WHEN "010010" => ALU_RESULT <= CRS1 OR OP2;				--ORcc
			WHEN "000110" => ALU_RESULT <= CRS1 OR NOT OP2;			--ORN
			WHEN "010110" => ALU_RESULT <= CRS1 OR NOT OP2;		   --ORNcc
			WHEN "000011" => ALU_RESULT <= CRS1 XOR OP2; 			--XOR
			WHEN "010011" => ALU_RESULT <= CRS1 XOR OP2;		  		--XORcc
			WHEN "000111" => ALU_RESULT <= CRS1 XNOR OP2;			--XNOR
			WHEN "010111" => ALU_RESULT <= CRS1 XNOR OP2;			--XNORcc
			-- ADD INSTRUCTIONS
			WHEN "000000" => ALU_RESULT <= CRS1 + OP2;				--ADD
			WHEN "010000" => ALU_RESULT <= CRS1 + OP2;				--ADDcc
			WHEN "001000" => ALU_RESULT <= CRS1 + OP2 + C;			--ADDX
			WHEN "011000" => ALU_RESULT <= CRS1 + OP2 + C;			--ADDXcc
			-- SUB INSTRUCTIONS
			WHEN "000100" => ALU_RESULT <= CRS1 - OP2;				--SUB
			WHEN "010100" => ALU_RESULT <= CRS1 - OP2;				--SUBcc
			WHEN "001100" => ALU_RESULT <= CRS1 - OP2 - C;			--SUBX
			WHEN "011100" => ALU_RESULT <= CRS1 - OP2 - C;			--SUBXcc
			-- SHIFT INSTRUCTIONS
			WHEN "100101" => ALU_RESULT <= STD_LOGIC_VECTOR(UNSIGNED(CRS1) SLL TO_INTEGER(UNSIGNED(OP2)));				--SLL
			WHEN "100110" => ALU_RESULT <= STD_LOGIC_VECTOR(UNSIGNED(CRS1) SRL TO_INTEGER(UNSIGNED(OP2)));				--SRL
			WHEN OTHERS => ALU_RESULT <= X"00000000";
		END CASE;
	END PROCESS;

end ALU;

