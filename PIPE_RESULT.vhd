----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:38:01 12/03/2017 
-- Design Name: 
-- Module Name:    PIPE_RESULT - Behavioral 
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

entity PIPE_RESULT is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  DATATOREG_IN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			  ICC_IN : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			  CWP_IN : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
			  WE_IN : IN STD_LOGIC;
			  RFDEST_IN : IN STD_LOGIC;
			  DATATOREG_OUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			  ICC_OUT : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			  CWP_OUT : OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
			  WE_OUT : OUT STD_LOGIC;
			  RFDEST_OUT : OUT STD_LOGIC
			  );
end PIPE_RESULT;

architecture Behavioral of PIPE_RESULT is
begin
PROCESS(CLK,RST)
	BEGIN
		IF RST = '1' THEN
			DATATOREG_OUT <= X"00000000";
			ICC_OUT <= X"0";
			CWP_OUT <= "0";
			WE_OUT <= '0' ;
			RFDEST_OUT <= '0';
		ELSIF (CLK'EVENT AND CLK='1') THEN
			DATATOREG_OUT <= DATATOREG_IN;
			ICC_OUT <= ICC_IN;
			CWP_OUT <= CWP_IN;
			WE_OUT <= WE_IN;
			RFDEST_OUT <= RFDEST_IN;
		END IF;
END PROCESS;

end Behavioral;

