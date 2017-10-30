----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2017 15:48:45
-- Design Name: 
-- Module Name: key_expansion - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity key_expansion is
Port (
      clk : in	std_logic;
      input : in std_logic_vector(127 downto 0);
      output : out std_logic_vector(1407 downto 0);
      enable : in std_logic;
      valid : out std_logic
      );
end key_expansion;

architecture Behavioral of key_expansion is
    signal temp : std_logic_vector(31 downto 0) := (others => '0');
    signal temp_round : std_logic_vector(31 downto 0) := (others => '0');
    signal temp_new : std_logic_vector(31 downto 0) := (others => '0');
    signal temp_output : std_logic_vector(1407 downto 0) := (others => '0');
    signal temp_mem : std_logic_vector(127 downto 0) := (others => '0');
    signal temp_mem_new : std_logic_vector(127 downto 0) := (others => '0');
    type STATE_TYPE is (Read_Inputs, Rounding, Computing, Write_Outputs);
    signal state : STATE_TYPE := Read_Inputs;
    signal nr_of_computes : natural range 0 to 4;
    signal nr_of_rounds : natural range 0 to 11;
    signal temp_valid: std_logic := '0';
    
begin
valid <= temp_valid;
output <= temp_output;
    process (clk)
	begin
        if rising_edge(clk) then
            case state is        
              when Read_Inputs =>
                if enable = '1' then
                    state <= Rounding;
                    nr_of_rounds <= 11;
                    temp_round <= input(31 downto 0);
                    temp_output(127 downto 0) <= input;
                    temp_mem <= input;
                end if;
                
              when Rounding =>
                if nr_of_rounds = 1 then
                    state <= Write_Outputs;
                else
                    if nr_of_rounds = 11 then
                        temp(31 downto 24) <= (temp_new(31 downto 24) xor "00000001");
                    elsif nr_of_rounds = 10 then
                        temp(31 downto 24) <= (temp_new(31 downto 24) xor "00000010");
                    elsif nr_of_rounds = 9 then
                        temp(31 downto 24) <= (temp_new(31 downto 24) xor "00000100");
                    elsif nr_of_rounds = 8 then
                        temp(31 downto 24) <= (temp_new(31 downto 24) xor "00001000");
                    elsif nr_of_rounds = 7 then
                        temp(31 downto 24) <= (temp_new(31 downto 24) xor "00010000");
                    elsif nr_of_rounds = 6 then
                        temp(31 downto 24) <= (temp_new(31 downto 24) xor "00100000");
                    elsif nr_of_rounds = 5 then
                        temp(31 downto 24) <= (temp_new(31 downto 24) xor "01000000");
                    elsif nr_of_rounds = 4 then
                        temp(31 downto 24) <= (temp_new(31 downto 24) xor "10000000");
                    elsif nr_of_rounds = 3 then
                        temp(31 downto 24) <= (temp_new(31 downto 24) xor "00011011");
                    elsif nr_of_rounds = 2 then
                        temp(31 downto 24) <= (temp_new(31 downto 24) xor "00110110");    
                    end if;
                    state <= Computing;
                    nr_of_computes <= 4;
                end if;
                temp(23 downto 0) <= temp_new(23 downto 0);
              
              when Computing =>
                if nr_of_computes = 0 then
                    state <= Rounding;
                    temp_round <= temp_mem_new(31 downto 0);
                    nr_of_rounds <= nr_of_rounds - 1;
                    temp_mem <= temp_mem_new;
                    temp_output(127 downto 0) <= temp_mem_new;
                else
                    if nr_of_computes = 4 then
                        temp_mem_new(127 downto 96) <= temp xor temp_mem(127 downto 96);
                        temp_output <= std_logic_vector(shift_left(unsigned(temp_output), 128));
                    elsif nr_of_computes = 3 then
                        temp_mem_new(95 downto 64) <= temp_mem_new(127 downto 96) xor temp_mem(95 downto 64);
                    elsif nr_of_computes = 2 then
                        temp_mem_new(63 downto 32) <= temp_mem_new(95 downto 64) xor temp_mem(63 downto 32);
                    elsif nr_of_computes = 1 then
                        temp_mem_new(31 downto 0) <= temp_mem_new(63 downto 32) xor temp_mem(31 downto 0);
                    end if;
                    nr_of_computes <= nr_of_computes - 1;
                end if;
                
              when Write_Outputs =>
                state <= Read_Inputs;
                temp_valid <= '1';
	       end case;
	   end if;
	end process;

sbox1 :entity work.s_box (behavioral)port map(input => temp_round(31 downto 24),output => temp_new(7 downto 0));
sbox2 :entity work.s_box (behavioral)port map(input => temp_round(23 downto 16),output => temp_new(31 downto 24));
sbox3 :entity work.s_box (behavioral)port map(input => temp_round(15 downto 8),output => temp_new(23 downto 16));
sbox4 :entity work.s_box (behavioral)port map(input => temp_round(7 downto 0),output => temp_new(15 downto 8));
    
end Behavioral;
