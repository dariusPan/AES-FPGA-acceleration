----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2017 10:05:16
-- Design Name: 
-- Module Name: add_roundkey - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add_roundkey is
  Port ( input : in std_logic_vector(127 downto 0);
         key : in std_logic_vector(127 downto 0);
         output : out std_logic_vector(127 downto 0)
         );
end add_roundkey;

architecture Behavioral of add_roundkey is

begin

output <= input xor key;


end Behavioral;
