----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2017 14:41:39
-- Design Name: 
-- Module Name: InvCipher - Behavioral
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

entity InvCipher is
    Port ( keys : in STD_LOGIC_VECTOR (1407 downto 0);
           input : in STD_LOGIC_VECTOR (127 downto 0);
           output : out STD_LOGIC_VECTOR (127 downto 0);
           clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           valid : out STD_LOGIC);
end InvCipher;

architecture Behavioral of InvCipher is
    signal temp : std_logic_vector(31 downto 0) := (others => '0');
    signal temp_round : std_logic_vector(31 downto 0) := (others => '0');
    signal temp_new : std_logic_vector(31 downto 0) := (others => '0');
    signal temp_key : std_logic_vector(1407 downto 0) := (others => '0');
    signal temp_value : std_logic_vector(127 downto 0) := (others => '0');
    signal temp_value_new : std_logic_vector(127 downto 0) := (others => '0');
    signal temp_before_key : std_logic_vector(127 downto 0) := (others => '0');
    signal temp_add : std_logic_vector(127 downto 0) := (others => '0');
    signal end_round : std_logic_vector(127 downto 0) := (others => '0');
    type STATE_TYPE is (First, Rounding, Computing, Last);
    signal state : STATE_TYPE := First;
    signal nr_of_rounds : natural range 0 to 9;
    
begin

valid <= '1' when state = Last else '0';

process (clk)
	begin
        if rising_edge(clk) then
            case state is        
                  when First =>
                    if enable = '1' then
                        state <= Rounding;
                        nr_of_rounds <= 9;
                        temp_value <= input xor keys(127 downto 0);
                        temp_key <= keys;
                    end if;
                    
                  when Rounding =>
                    if nr_of_rounds = 9 then
                        temp_add <= temp_before_key xor keys(255 downto 128);
                        state <= Computing;
                    elsif nr_of_rounds = 8 then
                        temp_add <= temp_before_key xor keys(383 downto 256);
                        state <= Computing;
                    elsif nr_of_rounds = 7 then
                        temp_add <= temp_before_key xor keys(511 downto 384);
                        state <= Computing;
                    elsif nr_of_rounds = 6 then
                        temp_add <= temp_before_key xor keys(639 downto 512);
                        state <= Computing;
                    elsif nr_of_rounds = 5 then
                        temp_add <= temp_before_key xor keys(767 downto 640);
                        state <= Computing;
                    elsif nr_of_rounds = 4 then
                        temp_add <= temp_before_key xor keys(895 downto 768);
                        state <= Computing;
                    elsif nr_of_rounds = 3 then
                        temp_add <= temp_before_key xor keys(1023 downto 896);
                        state <= Computing;
                    elsif nr_of_rounds = 2 then
                        temp_add <= temp_before_key xor keys(1151 downto 1024);
                        state <= Computing;
                    elsif nr_of_rounds = 1 then
                        temp_add <= temp_before_key xor keys(1279 downto 1152);
                        state <= Computing;
                    elsif nr_of_rounds = 0 then
                        temp_value <= end_round;
                        state <= Last;
                    end if;
                    temp(23 downto 0) <= temp_new(23 downto 0);
                  
                  when Computing =>
                    temp_value <= end_round;
                    state <= Rounding;
                    nr_of_rounds <= nr_of_rounds - 1;

                  when Last =>
                  	output <= temp_before_key xor keys(1407 downto 1280);
                  	state <= First;
	       end case;
	   end if;
	end process;

shift : entity work.shift_rows(Behavioral)
       port map(
           input => temp_value,
           output => temp_value_new
           );
           
    invert :entity work.InvSub (behavioral)
        port map(
           input => temp_value_new,
           output => temp_before_key
           );
    
    mix : entity work.inv_mix_columns(Behavioral)
        port map(
            input => temp_add,
            output => end_round
            );
end Behavioral;
