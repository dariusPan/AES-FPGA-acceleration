----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2017 16:32:10
-- Design Name: 
-- Module Name: shift_rows - Behavioral
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

entity shift_rows is
    Port ( input : in std_logic_vector(127 downto 0);
           output : out std_logic_vector(127 downto 0)
           );
end shift_rows;

architecture Behavioral of shift_rows is

begin
    
process (input)
    variable temp : std_logic_vector(127 downto 0) := (others => '0');
begin
    temp(127 downto 120) := input(127 downto 120);
    temp(119 downto 112) := input(23 downto 16);
    temp(111 downto 104) := input(47 downto 40);
    temp(103 downto 96) := input(71 downto 64);
    
    temp(95 downto 88) := input(95 downto 88);
    temp(87 downto 80) := input(119 downto 112);
    temp(79 downto 72) := input(15 downto 8);
    temp(71 downto 64) := input(39 downto 32);
    
    temp(63 downto 56) := input(63 downto 56);
    temp(55 downto 48) := input(87 downto 80);
    temp(47 downto 40) := input(111 downto 104);
    temp(39 downto 32) := input(7 downto 0);
    
    temp(31 downto 24) := input(31 downto 24);
    temp(23 downto 16) := input(55 downto 48);
    temp(15 downto 8) := input(79 downto 72);
    temp(7 downto 0) := input(103 downto 96);
        
    output <= temp;
end process;

end Behavioral;
