----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:38:47 10/22/2017 
-- Design Name: 
-- Module Name:    PC_MODULE - Behavioral 
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

entity PC_MODULE is
    Port ( PC : out  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           INSTR : in  STD_LOGIC_VECTOR (31 downto 0));
end PC_MODULE;

architecture Behavioral of PC_MODULE is

begin
	PROCESS(CLK,RST,INSTR)
	BEGIN
		IF RST = '1' THEN
			PC <= X"00000000";
		ELSIF (CLK'EVENT AND CLK='1') THEN
			PC <= INSTR;
		END IF;
	END PROCESS;
end Behavioral;

