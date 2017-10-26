----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2017 21:31:24
-- Design Name: 
-- Module Name: mult_d - Behavioral
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

entity mult_d is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end mult_d;

architecture Behavioral of mult_d is

begin
process (input)
    variable temp_value : std_logic_vector(7 downto 0) := (others => '0');
begin
    case input is
        when x"00" => temp_value := x"00"; when x"01" => temp_value := x"0d"; 
        when x"02" => temp_value := x"1a"; when x"03" => temp_value := x"17"; 
        when x"04" => temp_value := x"34"; when x"05" => temp_value := x"39"; 
        when x"06" => temp_value := x"2e"; when x"07" => temp_value := x"23"; 
        when x"08" => temp_value := x"68"; when x"09" => temp_value := x"65"; 
        when x"0a" => temp_value := x"72"; when x"0b" => temp_value := x"7f"; 
        when x"0c" => temp_value := x"5c"; when x"0d" => temp_value := x"51"; 
        when x"0e" => temp_value := x"46"; when x"0f" => temp_value := x"4b"; 
        when x"10" => temp_value := x"d0"; when x"11" => temp_value := x"dd"; 
        when x"12" => temp_value := x"ca"; when x"13" => temp_value := x"c7"; 
        when x"14" => temp_value := x"e4"; when x"15" => temp_value := x"e9";
        when x"16" => temp_value := x"fe"; when x"17" => temp_value := x"f3"; 
        when x"18" => temp_value := x"b8"; when x"19" => temp_value := x"b5"; 
        when x"1a" => temp_value := x"a2"; when x"1b" => temp_value := x"af"; 
        when x"1c" => temp_value := x"8c"; when x"1d" => temp_value := x"81"; 
        when x"1e" => temp_value := x"96"; when x"1f" => temp_value := x"9b";
        when x"20" => temp_value := x"bb"; when x"21" => temp_value := x"b6"; 
        when x"22" => temp_value := x"a1"; when x"23" => temp_value := x"ac"; 
        when x"24" => temp_value := x"8f"; when x"25" => temp_value := x"82"; 
        when x"26" => temp_value := x"95"; when x"27" => temp_value := x"98"; 
        when x"28" => temp_value := x"d3"; when x"29" => temp_value := x"de"; 
        when x"2a" => temp_value := x"c9"; when x"2b" => temp_value := x"c4"; 
        when x"2c" => temp_value := x"e7"; when x"2d" => temp_value := x"ea"; 
        when x"2e" => temp_value := x"fd"; when x"2f" => temp_value := x"f0";
        when x"30" => temp_value := x"6b"; when x"31" => temp_value := x"66"; 
        when x"32" => temp_value := x"71"; when x"33" => temp_value := x"7c"; 
        when x"34" => temp_value := x"5f"; when x"35" => temp_value := x"52"; 
        when x"36" => temp_value := x"45"; when x"37" => temp_value := x"48"; 
        when x"38" => temp_value := x"03"; when x"39" => temp_value := x"0e"; 
        when x"3a" => temp_value := x"19"; when x"3b" => temp_value := x"14"; 
        when x"3c" => temp_value := x"37"; when x"3d" => temp_value := x"3a"; 
        when x"3e" => temp_value := x"2d"; when x"3f" => temp_value := x"20";
        when x"40" => temp_value := x"6d"; when x"41" => temp_value := x"60"; 
        when x"42" => temp_value := x"77"; when x"43" => temp_value := x"7a"; 
        when x"44" => temp_value := x"59"; when x"45" => temp_value := x"54"; 
        when x"46" => temp_value := x"43"; when x"47" => temp_value := x"4e"; 
        when x"48" => temp_value := x"05"; when x"49" => temp_value := x"08"; 
        when x"4a" => temp_value := x"1f"; when x"4b" => temp_value := x"12"; 
        when x"4c" => temp_value := x"31"; when x"4d" => temp_value := x"3c"; 
        when x"4e" => temp_value := x"2b"; when x"4f" => temp_value := x"26";
        when x"50" => temp_value := x"bd"; when x"51" => temp_value := x"b0"; 
        when x"52" => temp_value := x"a7"; when x"53" => temp_value := x"aa";
        when x"54" => temp_value := x"89"; when x"55" => temp_value := x"84"; 
        when x"56" => temp_value := x"93"; when x"57" => temp_value := x"9e"; 
        when x"58" => temp_value := x"d5"; when x"59" => temp_value := x"d8"; 
        when x"5a" => temp_value := x"cf"; when x"5b" => temp_value := x"c2"; 
        when x"5c" => temp_value := x"e1"; when x"5d" => temp_value := x"ec"; 
        when x"5e" => temp_value := x"fb"; when x"5f" => temp_value := x"f6";
        when x"60" => temp_value := x"d6"; when x"61" => temp_value := x"db"; 
        when x"62" => temp_value := x"cc"; when x"63" => temp_value := x"c1"; 
        when x"64" => temp_value := x"e2"; when x"65" => temp_value := x"ef"; 
        when x"66" => temp_value := x"f8"; when x"67" => temp_value := x"f5"; 
        when x"68" => temp_value := x"be"; when x"69" => temp_value := x"b3"; 
        when x"6a" => temp_value := x"a4"; when x"6b" => temp_value := x"a9"; 
        when x"6c" => temp_value := x"8a"; when x"6d" => temp_value := x"87"; 
        when x"6e" => temp_value := x"90"; when x"6f" => temp_value := x"9d";
        when x"70" => temp_value := x"06"; when x"71" => temp_value := x"0b"; 
        when x"72" => temp_value := x"1c"; when x"73" => temp_value := x"11"; 
        when x"74" => temp_value := x"32"; when x"75" => temp_value := x"3f"; 
        when x"76" => temp_value := x"28"; when x"77" => temp_value := x"25"; 
        when x"78" => temp_value := x"6e"; when x"79" => temp_value := x"63"; 
        when x"7a" => temp_value := x"74"; when x"7b" => temp_value := x"79"; 
        when x"7c" => temp_value := x"5a"; when x"7d" => temp_value := x"57"; 
        when x"7e" => temp_value := x"40"; when x"7f" => temp_value := x"4d";
        when x"80" => temp_value := x"da"; when x"81" => temp_value := x"d7"; 
        when x"82" => temp_value := x"c0"; when x"83" => temp_value := x"cd"; 
        when x"84" => temp_value := x"ee"; when x"85" => temp_value := x"e3"; 
        when x"86" => temp_value := x"f4"; when x"87" => temp_value := x"f9"; 
        when x"88" => temp_value := x"b2"; when x"89" => temp_value := x"bf"; 
        when x"8a" => temp_value := x"a8"; when x"8b" => temp_value := x"a5"; 
        when x"8c" => temp_value := x"86"; when x"8d" => temp_value := x"8b"; 
        when x"8e" => temp_value := x"9c"; when x"8f" => temp_value := x"91";
        when x"90" => temp_value := x"0a"; when x"91" => temp_value := x"07"; 
        when x"92" => temp_value := x"10"; when x"93" => temp_value := x"1d"; 
        when x"94" => temp_value := x"3e"; when x"95" => temp_value := x"33"; 
        when x"96" => temp_value := x"24"; when x"97" => temp_value := x"29"; 
        when x"98" => temp_value := x"62"; when x"99" => temp_value := x"6f"; 
        when x"9a" => temp_value := x"78"; when x"9b" => temp_value := x"75"; 
        when x"9c" => temp_value := x"56"; when x"9d" => temp_value := x"5b"; 
        when x"9e" => temp_value := x"4c"; when x"9f" => temp_value := x"41";
        when x"a0" => temp_value := x"61"; when x"a1" => temp_value := x"6c"; 
        when x"a2" => temp_value := x"7b"; when x"a3" => temp_value := x"76"; 
        when x"a4" => temp_value := x"55"; when x"a5" => temp_value := x"58"; 
        when x"a6" => temp_value := x"4f"; when x"a7" => temp_value := x"42"; 
        when x"a8" => temp_value := x"09"; when x"a9" => temp_value := x"04"; 
        when x"aa" => temp_value := x"13"; when x"ab" => temp_value := x"1e"; 
        when x"ac" => temp_value := x"3d"; when x"ad" => temp_value := x"30"; 
        when x"ae" => temp_value := x"27"; when x"af" => temp_value := x"2a";
        when x"b0" => temp_value := x"b1"; when x"b1" => temp_value := x"bc"; 
        when x"b2" => temp_value := x"ab"; when x"b3" => temp_value := x"a6"; 
        when x"b4" => temp_value := x"85"; when x"b5" => temp_value := x"88"; 
        when x"b6" => temp_value := x"9f"; when x"b7" => temp_value := x"92"; 
        when x"b8" => temp_value := x"d9"; when x"b9" => temp_value := x"d4"; 
        when x"ba" => temp_value := x"c3"; when x"bb" => temp_value := x"ce"; 
        when x"bc" => temp_value := x"ed"; when x"bd" => temp_value := x"e0"; 
        when x"be" => temp_value := x"f7"; when x"bf" => temp_value := x"fa";
        when x"c0" => temp_value := x"b7"; when x"c1" => temp_value := x"ba"; 
        when x"c2" => temp_value := x"ad"; when x"c3" => temp_value := x"a0"; 
        when x"c4" => temp_value := x"83"; when x"c5" => temp_value := x"8e"; 
        when x"c6" => temp_value := x"99"; when x"c7" => temp_value := x"94"; 
        when x"c8" => temp_value := x"df"; when x"c9" => temp_value := x"d2"; 
        when x"ca" => temp_value := x"c5"; when x"cb" => temp_value := x"c8"; 
        when x"cc" => temp_value := x"eb"; when x"cd" => temp_value := x"e6"; 
        when x"ce" => temp_value := x"f1"; when x"cf" => temp_value := x"fc";
        when x"d0" => temp_value := x"67"; when x"d1" => temp_value := x"6a"; 
        when x"d2" => temp_value := x"7d"; when x"d3" => temp_value := x"70"; 
        when x"d4" => temp_value := x"53"; when x"d5" => temp_value := x"5e"; 
        when x"d6" => temp_value := x"49"; when x"d7" => temp_value := x"44"; 
        when x"d8" => temp_value := x"0f"; when x"d9" => temp_value := x"02"; 
        when x"da" => temp_value := x"15"; when x"db" => temp_value := x"18"; 
        when x"dc" => temp_value := x"3b"; when x"dd" => temp_value := x"36"; 
        when x"de" => temp_value := x"21"; when x"df" => temp_value := x"2c";
        when x"e0" => temp_value := x"0c"; when x"e1" => temp_value := x"01"; 
        when x"e2" => temp_value := x"16"; when x"e3" => temp_value := x"1b"; 
        when x"e4" => temp_value := x"38"; when x"e5" => temp_value := x"35"; 
        when x"e6" => temp_value := x"22"; when x"e7" => temp_value := x"2f"; 
        when x"e8" => temp_value := x"64"; when x"e9" => temp_value := x"69"; 
        when x"ea" => temp_value := x"7e"; when x"eb" => temp_value := x"73"; 
        when x"ec" => temp_value := x"50"; when x"ed" => temp_value := x"5d"; 
        when x"ee" => temp_value := x"4a"; when x"ef" => temp_value := x"47";
        when x"f0" => temp_value := x"dc"; when x"f1" => temp_value := x"d1"; 
        when x"f2" => temp_value := x"c6"; when x"f3" => temp_value := x"cb"; 
        when x"f4" => temp_value := x"e8"; when x"f5" => temp_value := x"e5"; 
        when x"f6" => temp_value := x"f2"; when x"f7" => temp_value := x"ff"; 
        when x"f8" => temp_value := x"b4"; when x"f9" => temp_value := x"b9"; 
        when x"fa" => temp_value := x"ae"; when x"fb" => temp_value := x"a3"; 
        when x"fc" => temp_value := x"80"; when x"fd" => temp_value := x"8d"; 
        when x"fe" => temp_value := x"9a"; when x"ff" => temp_value := x"97";
        when others => temp_value := x"00";
      end case;
      output <= temp_value;
end process;

end Behavioral;
