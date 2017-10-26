----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2017 14:51:20
-- Design Name: 
-- Module Name: InvSub - Behavioral
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

entity InvSub is
    Port ( input : in STD_LOGIC_VECTOR (127 downto 0);
           output : out STD_LOGIC_VECTOR (127 downto 0));
end InvSub;

architecture Behavioral of InvSub is
    signal temp : std_logic_vector(127 downto 0) := (others => '0');
begin

output <= temp;

box_1 :entity work.s_box_invert (behavioral)port map(input => input(127 downto 120),output => temp(127 downto 120));
box_2 :entity work.s_box_invert (behavioral)port map(input => input(119 downto 112),output => temp(119 downto 112));
box_3 :entity work.s_box_invert (behavioral)port map(input => input(111 downto 104),output => temp(111 downto 104));
box_4 :entity work.s_box_invert (behavioral)port map(input => input(103 downto 96),output => temp(103 downto 96));

box_5 :entity work.s_box_invert (behavioral)port map(input => input(95 downto 88),output => temp(95 downto 88));
box_6 :entity work.s_box_invert (behavioral)port map(input => input(87 downto 80),output => temp(87 downto 80));
box_7 :entity work.s_box_invert (behavioral)port map(input => input(79 downto 72),output => temp(79 downto 72));
box_8 :entity work.s_box_invert (behavioral)port map(input => input(71 downto 64),output => temp(71 downto 64));

box_9 :entity work.s_box_invert (behavioral)port map(input => input(63 downto 56),output => temp(63 downto 56)); 
box_10 :entity work.s_box_invert (behavioral)port map(input => input(55 downto 48),output => temp(55 downto 48));
box_11 :entity work.s_box_invert (behavioral)port map(input => input(47 downto 40),output => temp(47 downto 40));
box_12 :entity work.s_box_invert (behavioral)port map(input => input(39 downto 32),output => temp(39 downto 32));

box_13 :entity work.s_box_invert (behavioral)port map(input => input(31 downto 24),output => temp(31 downto 24));
box_14 :entity work.s_box_invert (behavioral)port map(input => input(23 downto 16),output => temp(23 downto 16));
box_15 :entity work.s_box_invert (behavioral)port map(input => input(15 downto 8),output => temp(15 downto 8));
box_16 :entity work.s_box_invert (behavioral)port map(input => input(7 downto 0),output => temp(7 downto 0));

end Behavioral;
