----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2017 17:11:29
-- Design Name: 
-- Module Name: test_top - Behavioral
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

entity test_top is
--  Port ( );
end test_top;

architecture Behavioral of test_top is
    signal ACLK	: std_logic := '0';
	signal 	ARESETN	: std_logic;
	signal 	S_AXIS_TREADY	: std_logic;
	signal 	S_AXIS_TDATA	: std_logic_vector(31 downto 0);
	signal 	S_AXIS_TLAST	: std_logic;
	signal 	S_AXIS_TVALID	: std_logic;
	signal 	M_AXIS_TVALID	: std_logic;
	signal 	M_AXIS_TDATA	: std_logic_vector(31 downto 0);
	signal 	M_AXIS_TLAST	: std_logic;
	signal 	M_AXIS_TREADY	: std_logic;
	signal 	key_enable	: std_logic;
	signal 	key_valid	: std_logic;
	signal 	input_key	: std_logic_vector(127 downto 0);
	signal  output_key  : std_logic_vector(1407 downto 0);
	signal 	input_cipher   : std_logic_vector(127 downto 0);
	signal 	output_cipher   : std_logic_vector(127 downto 0);
	signal 	cipher_enable	: std_logic;
    signal  cipher_valid    : std_logic;
    signal  cipher_key  : std_logic_vector(1407 downto 0);
	signal 	input_shift	: std_logic_vector(127 downto 0);
	signal  output_shift  : std_logic_vector(127 downto 0);
    signal  input_add  : std_logic_vector(127 downto 0);
    signal  output_add  : std_logic_vector(127 downto 0);
    signal  input_inv  : std_logic_vector(127 downto 0);
    signal  output_inv  : std_logic_vector(127 downto 0);
    signal  input  : std_logic_vector(127 downto 0);
    signal  output  : std_logic_vector(127 downto 0);
    signal i_BOX_INV : std_logic_vector(7 downto 0);
    signal o_BOX_INV : std_logic_vector(7 downto 0);
    signal i_BOX : std_logic_vector(7 downto 0);
    signal o_BOX : std_logic_vector(7 downto 0);
    signal c_KEY_ENABLE_W : std_logic;
    signal c_KEY_ENABLE_R : std_logic;
    signal c_KEY_ADDR_W : std_logic_vector(10 downto 0);
    signal c_KEY_ADDR_R : std_logic_vector(10 downto 0);
    signal r_i_KEY: std_logic_vector(127 downto 0);
    signal r_o_KEY: std_logic_vector(127 downto 0);

begin
          
    clock: process
    begin
        -- Toggle clock signal
        ACLK <= not(ACLK);
        -- Wait for half of the clock period
        wait for 5 ns;
    end process;
    
    test_components: process
    begin
--            ARESETN  <= '0';
--            S_AXIS_TLAST  <= '0';
--            S_AXIS_TVALID  <= '0';
--            M_AXIS_TREADY  <= '0';
            i_BOX <= x"00";
            wait for 50ns;
--            ARESETN <= '1';
--            S_AXIS_TDATA  <= "00000000001100000000000000000000";
            input <= x"00112233445566778899aabbccddeeff";
            input_key <= x"2b7e151628aed2a6abf7158809cf4f3c";
            input_add <= x"00112233445566778899aabbccddeeff";
            input_shift <= x"00112233445566778899aabbccddeeff";
            input_inv <= x"00112233445566778899aabbccddeeff";
            key_enable <= '1';
            wait for 20ns;
            key_enable <= '0';
            wait for 610ns;
            cipher_enable <= '1';
            input_cipher <= x"3ad77bb40d7a3660a89ecaf32466ef97";
            cipher_key <= output_key;
--            S_AXIS_TDATA  <= "00000000001100000000000000000000";
--            S_AXIS_TLAST  <= '1';
--            S_AXIS_TVALID  <= '1';
--            M_AXIS_TREADY  <= '1';
            c_KEY_ENABLE_W <= '1';
            c_KEY_ADDR_W <= "00000000001";
            r_i_KEY <= x"00112233445566778899aabbccddeeff";
            wait for 80ns;
            cipher_enable <= '0';
            wait for 200ns;            
            i_BOX_INV <= o_BOX;
            c_KEY_ENABLE_W <= '0';
--            input <= output;
--            S_AXIS_TDATA  <= "00000000000000000000011110000000";
            wait for 100ns;
--            S_AXIS_TDATA  <= "00000111000000000000000000000000";
            wait for 50ns;
            c_KEY_ENABLE_R <= '1';
            c_KEY_ADDR_R <= "00000000001";
--            S_AXIS_TDATA  <= "00000000000001111100000000000000";
            wait for 200ns;
--            S_AXIS_TDATA  <= "11111000000000000000000000000000";
            wait;
            
    end process;

--    aes: entity work.myip_v1_0(EXAMPLE)
--    port map( 
--            ACLK    => ACLK,
--            ARESETN    => ARESETN,
--            S_AXIS_TREADY  => S_AXIS_TREADY,
--            S_AXIS_TDATA  => S_AXIS_TDATA,
--            S_AXIS_TLAST   => S_AXIS_TLAST,
--            S_AXIS_TVALID  => S_AXIS_TVALID,
--            M_AXIS_TVALID  => M_AXIS_TVALID,
--            M_AXIS_TDATA   => M_AXIS_TDATA,
--            M_AXIS_TLAST  => M_AXIS_TLAST,
--            M_AXIS_TREADY  => M_AXIS_TREADY  
--         );
--    keys :entity work.bram (rtl)
--        generic map (WIDTH => 128, DEPTH => 11)
--        port map(
--        clk => ACLK,
--        enable => '1',
--        write_enable => c_KEY_ENABLE_W,
--        addr_write => c_KEY_ADDR_W,
--        data_in => r_i_KEY,
--        read_enable => c_KEY_ENABLE_R,
--        addr_read => c_KEY_ADDR_R,
--        data_out => r_o_KEY
--        );
     invcipher: entity work.InvCipher(behavioral)
        port map(
             clk => ACLK,
             input => input_cipher,
             output => output_cipher,
             keys => cipher_key,
             enable => cipher_enable,
             valid => cipher_valid
             );  
     key_expand: entity work.key_expansion(behavioral)
        port map(
            clk => ACLK,
            input => input_key,
            output => output_key,
            enable => key_enable,
            valid => key_valid
            );
     add_key: entity work.add_roundkey(Behavioral)
        port map(
            input => input_add,
            key => input_key,
            output => output_add
            );
     shift: entity work.shift_rows(Behavioral)
        port map(
            input => input_shift,
            output => output_shift
            );
     mix: entity work.inv_mix_columns(Behavioral)
        port map(
            input => input,
            output => output
            );
          
     sbox :entity work.s_box (behavioral)
         port map(
            input => i_BOX,
            output => o_BOX
            );
             
    sbox_invert :entity work.s_box_invert (behavioral)
         port map(
            input => i_BOX_INV,
            output => o_BOX_INV
            );
            
    invert :entity work.InvSub (behavioral)
     port map(
        input => input_inv,
        output => output_inv
        );
        
end Behavioral;
