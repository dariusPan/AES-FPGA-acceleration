library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity s_box_invert is
  Port (
    input: in std_logic_vector(7 downto 0);
    output: out std_logic_vector(7 downto 0)
    );
end s_box_invert;

architecture Behavioral of s_box_invert is
begin

process (input)
    variable invert_value : std_logic_vector(7 downto 0) := (others => '0');
begin
    case input is
        when x"00" => invert_value := x"52"; when x"01" => invert_value := x"09"; 
        when x"02" => invert_value := x"6a"; when x"03" => invert_value := x"d5"; 
        when x"04" => invert_value := x"30"; when x"05" => invert_value := x"36"; 
        when x"06" => invert_value := x"a5"; when x"07" => invert_value := x"38"; 
        when x"08" => invert_value := x"bf"; when x"09" => invert_value := x"40"; 
        when x"0a" => invert_value := x"a3"; when x"0b" => invert_value := x"9e"; 
        when x"0c" => invert_value := x"81"; when x"0d" => invert_value := x"f3"; 
        when x"0e" => invert_value := x"d7"; when x"0f" => invert_value := x"fb"; 
        when x"10" => invert_value := x"7c"; when x"11" => invert_value := x"e3"; 
        when x"12" => invert_value := x"39"; when x"13" => invert_value := x"82"; 
        when x"14" => invert_value := x"9b"; when x"15" => invert_value := x"2f";
        when x"16" => invert_value := x"ff"; when x"17" => invert_value := x"87"; 
        when x"18" => invert_value := x"34"; when x"19" => invert_value := x"8e"; 
        when x"1a" => invert_value := x"43"; when x"1b" => invert_value := x"44"; 
        when x"1c" => invert_value := x"c4"; when x"1d" => invert_value := x"de"; 
        when x"1e" => invert_value := x"e9"; when x"1f" => invert_value := x"cb";
        when x"20" => invert_value := x"54"; when x"21" => invert_value := x"7b"; 
        when x"22" => invert_value := x"94"; when x"23" => invert_value := x"32"; 
        when x"24" => invert_value := x"a6"; when x"25" => invert_value := x"c2"; 
        when x"26" => invert_value := x"23"; when x"27" => invert_value := x"3d"; 
        when x"28" => invert_value := x"ee"; when x"29" => invert_value := x"4c"; 
        when x"2a" => invert_value := x"95"; when x"2b" => invert_value := x"0b"; 
        when x"2c" => invert_value := x"42"; when x"2d" => invert_value := x"fa"; 
        when x"2e" => invert_value := x"c3"; when x"2f" => invert_value := x"4e";
        when x"30" => invert_value := x"08"; when x"31" => invert_value := x"2e"; 
        when x"32" => invert_value := x"a1"; when x"33" => invert_value := x"66"; 
        when x"34" => invert_value := x"28"; when x"35" => invert_value := x"d9"; 
        when x"36" => invert_value := x"24"; when x"37" => invert_value := x"b2"; 
        when x"38" => invert_value := x"76"; when x"39" => invert_value := x"5b"; 
        when x"3a" => invert_value := x"a2"; when x"3b" => invert_value := x"49"; 
        when x"3c" => invert_value := x"6d"; when x"3d" => invert_value := x"8b"; 
        when x"3e" => invert_value := x"d1"; when x"3f" => invert_value := x"25";
        when x"40" => invert_value := x"72"; when x"41" => invert_value := x"f8"; 
        when x"42" => invert_value := x"f6"; when x"43" => invert_value := x"64"; 
        when x"44" => invert_value := x"86"; when x"45" => invert_value := x"68"; 
        when x"46" => invert_value := x"98"; when x"47" => invert_value := x"16"; 
        when x"48" => invert_value := x"d4"; when x"49" => invert_value := x"a4"; 
        when x"4a" => invert_value := x"5c"; when x"4b" => invert_value := x"cc"; 
        when x"4c" => invert_value := x"5d"; when x"4d" => invert_value := x"65"; 
        when x"4e" => invert_value := x"b6"; when x"4f" => invert_value := x"92"; 
        when x"50" => invert_value := x"6c"; when x"51" => invert_value := x"70"; 
        when x"52" => invert_value := x"48"; when x"53" => invert_value := x"50";
        when x"54" => invert_value := x"fd"; when x"55" => invert_value := x"ed"; 
        when x"56" => invert_value := x"b9"; when x"57" => invert_value := x"da"; 
        when x"58" => invert_value := x"5e"; when x"59" => invert_value := x"15"; 
        when x"5a" => invert_value := x"46"; when x"5b" => invert_value := x"57"; 
        when x"5c" => invert_value := x"a7"; when x"5d" => invert_value := x"8d"; 
        when x"5e" => invert_value := x"9d"; when x"5f" => invert_value := x"84";
        when x"60" => invert_value := x"90"; when x"61" => invert_value := x"d8"; 
        when x"62" => invert_value := x"ab"; when x"63" => invert_value := x"00"; 
        when x"64" => invert_value := x"8c"; when x"65" => invert_value := x"bc"; 
        when x"66" => invert_value := x"d3"; when x"67" => invert_value := x"0a"; 
        when x"68" => invert_value := x"f7"; when x"69" => invert_value := x"e4"; 
        when x"6a" => invert_value := x"58"; when x"6b" => invert_value := x"05"; 
        when x"6c" => invert_value := x"b8"; when x"6d" => invert_value := x"b3"; 
        when x"6e" => invert_value := x"45"; when x"6f" => invert_value := x"06"; 
        when x"70" => invert_value := x"d0"; when x"71" => invert_value := x"2c"; 
        when x"72" => invert_value := x"1e"; when x"73" => invert_value := x"8f"; 
        when x"74" => invert_value := x"ca"; when x"75" => invert_value := x"3f"; 
        when x"76" => invert_value := x"0f"; when x"77" => invert_value := x"02"; 
        when x"78" => invert_value := x"c1"; when x"79" => invert_value := x"af"; 
        when x"7a" => invert_value := x"bd"; when x"7b" => invert_value := x"03"; 
        when x"7c" => invert_value := x"01"; when x"7d" => invert_value := x"13"; 
        when x"7e" => invert_value := x"8a"; when x"7f" => invert_value := x"6b";
        when x"80" => invert_value := x"3a"; when x"81" => invert_value := x"91"; 
        when x"82" => invert_value := x"11"; when x"83" => invert_value := x"41"; 
        when x"84" => invert_value := x"4f"; when x"85" => invert_value := x"67"; 
        when x"86" => invert_value := x"dc"; when x"87" => invert_value := x"ea"; 
        when x"88" => invert_value := x"97"; when x"89" => invert_value := x"f2"; 
        when x"8a" => invert_value := x"cf"; when x"8b" => invert_value := x"ce"; 
        when x"8c" => invert_value := x"f0"; when x"8d" => invert_value := x"b4"; 
        when x"8e" => invert_value := x"e6"; when x"8f" => invert_value := x"73"; 
        when x"90" => invert_value := x"96"; when x"91" => invert_value := x"ac"; 
        when x"92" => invert_value := x"74"; when x"93" => invert_value := x"22"; 
        when x"94" => invert_value := x"e7"; when x"95" => invert_value := x"ad"; 
        when x"96" => invert_value := x"35"; when x"97" => invert_value := x"85"; 
        when x"98" => invert_value := x"e2"; when x"99" => invert_value := x"f9"; 
        when x"9a" => invert_value := x"37"; when x"9b" => invert_value := x"e8"; 
        when x"9c" => invert_value := x"1c"; when x"9d" => invert_value := x"75"; 
        when x"9e" => invert_value := x"df"; when x"9f" => invert_value := x"6e";
        when x"a0" => invert_value := x"47"; when x"a1" => invert_value := x"f1"; 
        when x"a2" => invert_value := x"1a"; when x"a3" => invert_value := x"71"; 
        when x"a4" => invert_value := x"1d"; when x"a5" => invert_value := x"29"; 
        when x"a6" => invert_value := x"c5"; when x"a7" => invert_value := x"89"; 
        when x"a8" => invert_value := x"6f"; when x"a9" => invert_value := x"b7"; 
        when x"aa" => invert_value := x"62"; when x"ab" => invert_value := x"0e"; 
        when x"ac" => invert_value := x"aa"; when x"ad" => invert_value := x"18"; 
        when x"ae" => invert_value := x"be"; when x"af" => invert_value := x"1b"; 
        when x"b0" => invert_value := x"fc"; when x"b1" => invert_value := x"56"; 
        when x"b2" => invert_value := x"3e"; when x"b3" => invert_value := x"4b"; 
        when x"b4" => invert_value := x"c6"; when x"b5" => invert_value := x"d2"; 
        when x"b6" => invert_value := x"79"; when x"b7" => invert_value := x"20"; 
        when x"b8" => invert_value := x"9a"; when x"b9" => invert_value := x"db"; 
        when x"ba" => invert_value := x"c0"; when x"bb" => invert_value := x"fe"; 
        when x"bc" => invert_value := x"78"; when x"bd" => invert_value := x"cd"; 
        when x"be" => invert_value := x"5a"; when x"bf" => invert_value := x"f4";
        when x"c0" => invert_value := x"1f"; when x"c1" => invert_value := x"dd"; 
        when x"c2" => invert_value := x"a8"; when x"c3" => invert_value := x"33"; 
        when x"c4" => invert_value := x"88"; when x"c5" => invert_value := x"07"; 
        when x"c6" => invert_value := x"c7"; when x"c7" => invert_value := x"31"; 
        when x"c8" => invert_value := x"b1"; when x"c9" => invert_value := x"12"; 
        when x"ca" => invert_value := x"10"; when x"cb" => invert_value := x"59"; 
        when x"cc" => invert_value := x"27"; when x"cd" => invert_value := x"80"; 
        when x"ce" => invert_value := x"ec"; when x"cf" => invert_value := x"5f";
        when x"d0" => invert_value := x"60"; when x"d1" => invert_value := x"51"; 
        when x"d2" => invert_value := x"7f"; when x"d3" => invert_value := x"a9"; 
        when x"d4" => invert_value := x"19"; when x"d5" => invert_value := x"b5"; 
        when x"d6" => invert_value := x"4a"; when x"d7" => invert_value := x"0d"; 
        when x"d8" => invert_value := x"2d"; when x"d9" => invert_value := x"e5"; 
        when x"da" => invert_value := x"7a"; when x"db" => invert_value := x"9f"; 
        when x"dc" => invert_value := x"93"; when x"dd" => invert_value := x"c9"; 
        when x"de" => invert_value := x"9c"; when x"df" => invert_value := x"ef";
        when x"e0" => invert_value := x"a0"; when x"e1" => invert_value := x"e0"; 
        when x"e2" => invert_value := x"3b"; when x"e3" => invert_value := x"4d"; 
        when x"e4" => invert_value := x"ae"; when x"e5" => invert_value := x"2a"; 
        when x"e6" => invert_value := x"f5"; when x"e7" => invert_value := x"b0"; 
        when x"e8" => invert_value := x"c8"; when x"e9" => invert_value := x"eb"; 
        when x"ea" => invert_value := x"bb"; when x"eb" => invert_value := x"3c"; 
        when x"ec" => invert_value := x"83"; when x"ed" => invert_value := x"53"; 
        when x"ee" => invert_value := x"99"; when x"ef" => invert_value := x"61";
        when x"f0" => invert_value := x"17"; when x"f1" => invert_value := x"2b"; 
        when x"f2" => invert_value := x"04"; when x"f3" => invert_value := x"7e"; 
        when x"f4" => invert_value := x"ba"; when x"f5" => invert_value := x"77"; 
        when x"f6" => invert_value := x"d6"; when x"f7" => invert_value := x"26"; 
        when x"f8" => invert_value := x"e1"; when x"f9" => invert_value := x"69"; 
        when x"fa" => invert_value := x"14"; when x"fb" => invert_value := x"63"; 
        when x"fc" => invert_value := x"55"; when x"fd" => invert_value := x"21"; 
        when x"fe" => invert_value := x"0c"; when x"ff" => invert_value := x"7d";
        when others => invert_value := x"00";
      end case;
      output <= invert_value;
end process;

end Behavioral;
