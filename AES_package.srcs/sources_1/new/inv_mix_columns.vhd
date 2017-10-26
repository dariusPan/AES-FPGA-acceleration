----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2017 17:33:51
-- Design Name: 
-- Module Name: inv_mix_columns - Behavioral
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

entity inv_mix_columns is
    Port ( input : in STD_LOGIC_VECTOR (127 downto 0);
           output : out STD_LOGIC_VECTOR (127 downto 0)
           );
end inv_mix_columns;

architecture Behavioral of inv_mix_columns is
    type temp_array is array (0 to 63) of std_logic_vector(7 downto 0);  
    signal temp : temp_array := ((others=> (others=>'0')));
begin

output(127 downto 120) <= temp(0) xor temp(1) xor temp(2) xor temp(3);
output(119 downto 112) <= temp(4) xor temp(5) xor temp(6) xor temp(7);
output(111 downto 104) <= temp(8) xor temp(9) xor temp(10) xor temp(11);
output(103 downto 96) <= temp(12) xor temp(13) xor temp(14) xor temp(15);

output(95 downto 88) <= temp(16) xor temp(17) xor temp(18) xor temp(19);
output(87 downto 80) <= temp(20) xor temp(21) xor temp(22) xor temp(23);
output(79 downto 72) <= temp(24) xor temp(25) xor temp(26) xor temp(27);
output(71 downto 64) <= temp(28) xor temp(29) xor temp(30) xor temp(31);

output(63 downto 56) <= temp(32) xor temp(33) xor temp(34) xor temp(35);
output(55 downto 48) <= temp(36) xor temp(37) xor temp(38) xor temp(39);
output(47 downto 40) <= temp(40) xor temp(41) xor temp(42) xor temp(43);
output(39 downto 32) <= temp(44) xor temp(45) xor temp(46) xor temp(47);

output(31 downto 24) <= temp(48) xor temp(49) xor temp(50) xor temp(51);
output(23 downto 16) <= temp(52) xor temp(53) xor temp(54) xor temp(55);
output(15 downto 8) <= temp(56) xor temp(57) xor temp(58) xor temp(59);
output(7 downto 0) <= temp(60) xor temp(61) xor temp(62) xor temp(63);

r1_mult_9_4 :entity work.mult_9 (behavioral)port map(input => input(103 downto 96),output => temp(3));
r1_mult_b_2 :entity work.mult_b (behavioral)port map(input => input(119 downto 112),output => temp(1));
r1_mult_d_3 :entity work.mult_d (behavioral)port map(input => input(111 downto 104),output => temp(2));
r1_mult_e_1 :entity work.mult_e (behavioral)port map(input => input(127 downto 120),output => temp(0));

r1_mult_9_1 :entity work.mult_9 (behavioral)port map(input => input(127 downto 120),output => temp(4));
r1_mult_b_3 :entity work.mult_b (behavioral)port map(input => input(111 downto 104),output => temp(6));
r1_mult_d_4 :entity work.mult_d (behavioral)port map(input => input(103 downto 96),output => temp(7));
r1_mult_e_2 :entity work.mult_e (behavioral)port map(input => input(119 downto 112),output => temp(5));

r1_mult_9_2 :entity work.mult_9 (behavioral)port map(input => input(119 downto 112),output => temp(9));
r1_mult_b_4 :entity work.mult_b (behavioral)port map(input => input(103 downto 96),output => temp(11));
r1_mult_d_1 :entity work.mult_d (behavioral)port map(input => input(127 downto 120),output => temp(8));
r1_mult_e_3 :entity work.mult_e (behavioral)port map(input => input(111 downto 104),output => temp(10));

r1_mult_9_3 :entity work.mult_9 (behavioral)port map(input => input(111 downto 104),output => temp(14));
r1_mult_b_1 :entity work.mult_b (behavioral)port map(input => input(127 downto 120),output => temp(12));
r1_mult_d_2 :entity work.mult_d (behavioral)port map(input => input(119 downto 112),output => temp(13));
r1_mult_e_4 :entity work.mult_e (behavioral)port map(input => input(103 downto 96),output => temp(15));

r2_mult_9_4 :entity work.mult_9 (behavioral)port map(input => input(71 downto 64),output => temp(19));
r2_mult_b_2 :entity work.mult_b (behavioral)port map(input => input(87 downto 80),output => temp(17));
r2_mult_d_3 :entity work.mult_d (behavioral)port map(input => input(79 downto 72),output => temp(18));
r2_mult_e_1 :entity work.mult_e (behavioral)port map(input => input(95 downto 88),output => temp(16));

r2_mult_9_1 :entity work.mult_9 (behavioral)port map(input => input(95 downto 88),output => temp(20));
r2_mult_b_3 :entity work.mult_b (behavioral)port map(input => input(79 downto 72),output => temp(22));
r2_mult_d_4 :entity work.mult_d (behavioral)port map(input => input(71 downto 64),output => temp(23));
r2_mult_e_2 :entity work.mult_e (behavioral)port map(input => input(87 downto 80),output => temp(21));

r2_mult_9_2 :entity work.mult_9 (behavioral)port map(input => input(87 downto 80),output => temp(25));
r2_mult_b_4 :entity work.mult_b (behavioral)port map(input => input(71 downto 64),output => temp(27));
r2_mult_d_1 :entity work.mult_d (behavioral)port map(input => input(95 downto 88),output => temp(24));
r2_mult_e_3 :entity work.mult_e (behavioral)port map(input => input(79 downto 72),output => temp(26));

r2_mult_9_3 :entity work.mult_9 (behavioral)port map(input => input(79 downto 72),output => temp(30));
r2_mult_b_1 :entity work.mult_b (behavioral)port map(input => input(95 downto 88),output => temp(28));
r2_mult_d_2 :entity work.mult_d (behavioral)port map(input => input(87 downto 80),output => temp(29));
r2_mult_e_4 :entity work.mult_e (behavioral)port map(input => input(71 downto 64),output => temp(31));

r3_mult_9_4 :entity work.mult_9 (behavioral)port map(input => input(39 downto 32),output => temp(35));
r3_mult_b_2 :entity work.mult_b (behavioral)port map(input => input(55 downto 48),output => temp(33));
r3_mult_d_3 :entity work.mult_d (behavioral)port map(input => input(47 downto 40),output => temp(34));
r3_mult_e_1 :entity work.mult_e (behavioral)port map(input => input(63 downto 56),output => temp(32));

r3_mult_9_1 :entity work.mult_9 (behavioral)port map(input => input(63 downto 56),output => temp(36));
r3_mult_b_3 :entity work.mult_b (behavioral)port map(input => input(47 downto 40),output => temp(38));
r3_mult_d_4 :entity work.mult_d (behavioral)port map(input => input(39 downto 32),output => temp(39));
r3_mult_e_2 :entity work.mult_e (behavioral)port map(input => input(55 downto 48),output => temp(37));

r3_mult_9_2 :entity work.mult_9 (behavioral)port map(input => input(55 downto 48),output => temp(41));
r3_mult_b_4 :entity work.mult_b (behavioral)port map(input => input(39 downto 32),output => temp(43));
r3_mult_d_1 :entity work.mult_d (behavioral)port map(input => input(63 downto 56),output => temp(40));
r3_mult_e_3 :entity work.mult_e (behavioral)port map(input => input(47 downto 40),output => temp(42));

r3_mult_9_3 :entity work.mult_9 (behavioral)port map(input => input(47 downto 40),output => temp(46));
r3_mult_b_1 :entity work.mult_b (behavioral)port map(input => input(63 downto 56),output => temp(44));
r3_mult_d_2 :entity work.mult_d (behavioral)port map(input => input(55 downto 48),output => temp(45));
r3_mult_e_4 :entity work.mult_e (behavioral)port map(input => input(39 downto 32),output => temp(47));

r4_mult_9_4 :entity work.mult_9 (behavioral)port map(input => input(7 downto 0),output => temp(51));
r4_mult_b_2 :entity work.mult_b (behavioral)port map(input => input(23 downto 16),output => temp(49));
r4_mult_d_3 :entity work.mult_d (behavioral)port map(input => input(15 downto 8),output => temp(50));
r4_mult_e_1 :entity work.mult_e (behavioral)port map(input => input(31 downto 24),output => temp(48));

r4_mult_9_1 :entity work.mult_9 (behavioral)port map(input => input(31 downto 24),output => temp(52));
r4_mult_b_3 :entity work.mult_b (behavioral)port map(input => input(15 downto 8),output => temp(54));
r4_mult_d_4 :entity work.mult_d (behavioral)port map(input => input(7 downto 0),output => temp(55));
r4_mult_e_2 :entity work.mult_e (behavioral)port map(input => input(23 downto 16),output => temp(53));

r4_mult_9_2 :entity work.mult_9 (behavioral)port map(input => input(23 downto 16),output => temp(57));
r4_mult_b_4 :entity work.mult_b (behavioral)port map(input => input(7 downto 0),output => temp(59));
r4_mult_d_1 :entity work.mult_d (behavioral)port map(input => input(31 downto 24),output => temp(56));
r4_mult_e_3 :entity work.mult_e (behavioral)port map(input => input(15 downto 8),output => temp(58));

r4_mult_9_3 :entity work.mult_9 (behavioral)port map(input => input(15 downto 8),output => temp(62));
r4_mult_b_1 :entity work.mult_b (behavioral)port map(input => input(31 downto 24),output => temp(60));
r4_mult_d_2 :entity work.mult_d (behavioral)port map(input => input(23 downto 16),output => temp(61));
r4_mult_e_4 :entity work.mult_e (behavioral)port map(input => input(7 downto 0),output => temp(63));

end Behavioral;
