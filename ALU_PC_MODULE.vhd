----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:10:40 10/22/2017 
-- Design Name: 
-- Module Name:    ALU_PC_MODULE - Behavioral 
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

ENTITY ALU_PC_MODULE IS
    PORT ( NPC : IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
           STATIC : IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
           PC : OUT  STD_LOGIC_VECTOR (31 DOWNTO 0));
END ALU_PC_MODULE;

ARCHITECTURE Behavioral OF ALU_PC_MODULE IS

BEGIN

PC	<= NPC+STATIC;

END Behavioral;

