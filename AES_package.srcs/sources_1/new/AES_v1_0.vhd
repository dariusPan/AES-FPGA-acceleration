------------------------------------------------------------------------------
-- hw_acc - entity/architecture pair
------------------------------------------------------------------------------
--
-- ***************************************************************************
-- ** Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.            **
-- **                                                                       **
-- ** Xilinx, Inc.                                                          **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
-- ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
-- ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
-- ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
-- ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
-- ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
-- ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
-- ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
-- ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
-- ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
-- ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
-- ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
-- ** FOR A PARTICULAR PURPOSE.                                             **
-- **                                                                       **
-- ***************************************************************************
--
------------------------------------------------------------------------------
-- Filename:          hw_acc
-- Version:           1.00.a
-- Description:       Example Axi Streaming core (VHDL).
-- Date:              Mon Sep 15 15:41:21 2014 (by Create and Import Peripheral Wizard)
-- VHDL Standard:     VHDL'93
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "rst", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   clock enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------------
--
--
-- Definition of Ports
-- ACLK              : Synchronous clock
-- ARESETN           : System reset, active low
-- S_AXIS_TREADY  : Ready to accept data in
-- S_AXIS_TDATA   :  Data in 
-- S_AXIS_TLAST   : Optional data in qualifier
-- S_AXIS_TVALID  : Data in is valid
-- M_AXIS_TVALID  :  Data out is valid
-- M_AXIS_TDATA   : Data Out
-- M_AXIS_TLAST   : Optional data out qualifier
-- M_AXIS_TREADY  : Connected slave device is ready to accept data out
--
-------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Entity Section
------------------------------------------------------------------------------

entity AES_InvCipher_v1_0 is
	port 
	(
		-- DO NOT EDIT BELOW THIS LINE ---------------------
		-- Bus protocol ports, do not add or delete. 
		ACLK	: in	std_logic;
		ARESETN	: in	std_logic;
		S_AXIS_TREADY	: out	std_logic;
		S_AXIS_TDATA	: in	std_logic_vector(31 downto 0);
		S_AXIS_TLAST	: in	std_logic;
		S_AXIS_TVALID	: in	std_logic;
		M_AXIS_TVALID	: out	std_logic;
		M_AXIS_TDATA	: out	std_logic_vector(31 downto 0);
		M_AXIS_TLAST	: out	std_logic;
		M_AXIS_TREADY	: in	std_logic
		-- DO NOT EDIT ABOVE THIS LINE ---------------------
	);

attribute SIGIS : string; 
attribute SIGIS of ACLK : signal is "Clk"; 

end AES_InvCipher_v1_0;

------------------------------------------------------------------------------
-- Architecture Section
------------------------------------------------------------------------------

-- In this section, we povide an example implementation of ENTITY hw_acc
-- that does the following:
--
-- 1. Read all inputs
-- 2. Add each input to the contents of register 'sum' which
--    acts as an accumulator
-- 3. After all the inputs have been read, write out the
--    content of 'sum' into the output stream NUMBER_OF_OUTPUT_WORDS times
--
-- You will need to modify this example or implement a new architecture for
-- ENTITY hw_acc to implement your coprocessor

architecture EXAMPLE of AES_InvCipher_v1_0 is

   -- Total number of input data.
   constant NUMBER_OF_INPUT_WORDS  : natural := 4;

   -- Total number of output data
   constant NUMBER_OF_OUTPUT_WORDS : natural := 4;

   type STATE_TYPE is (Idle, Key_Expansion, Read_Inputs, Computing, Write_Outputs, Write_Buffer);
   signal state : STATE_TYPE := Idle;

   -- Counters to store the number inputs read & outputs written
   signal nr_of_reads  : natural range 0 to NUMBER_OF_INPUT_WORDS - 1;
   signal nr_of_writes : natural range 0 to NUMBER_OF_OUTPUT_WORDS - 1;
   
  -- For key expansion
   signal key_enable: std_logic := '0';
   signal input_key: std_logic_vector(127 downto 0) := (others => '0');
   signal key_valid: std_logic := '0';
   signal output_key: std_logic_vector(1407 downto 0);
   
   -- for InvCipher
   signal cipher_valid: std_logic := '0';
   signal cipher_enable: std_logic := '0';
   signal input_cipher: std_logic_vector(127 downto 0) := (others => '0');
   signal output_cipher: std_logic_vector(127 downto 0);
   type in_array is array (0 to 3) of std_logic_vector(31 downto 0);
   signal input_mem: in_array := ((others=> (others=>'0')));

   signal key: std_logic_vector(1407 downto 0) := (others => '0');
   signal output: std_logic_vector(127 downto 0) := (others => '1');
begin
   -- CAUTION:
   -- The sequence in which data are read in and written out should be
   -- consistent with the sequence they are written and read in the
   -- driver's hw_acc.c file

    S_AXIS_TREADY  <= '1' when state = Read_Inputs else '0';
    M_AXIS_TVALID <= '1' when (state = Write_Outputs) else '0';
    M_AXIS_TLAST <= '1' when (state = Write_Outputs and nr_of_writes = 0) else '0';
   
    M_AXIS_TDATA <= output(127 downto 96) when (state = Write_Outputs and nr_of_writes = 3) else
                    output(95 downto 64) when (state = Write_Outputs and nr_of_writes = 2) else 
                    output(63 downto 32) when (state = Write_Outputs and nr_of_writes = 1) else
                    output(31 downto 0) when (state = Write_Outputs and nr_of_writes = 0);
                      
--    key <= x"2b7e151628aed2a6abf7158809cf4f3ca0fafe1788542cb123a339392a6c7605f2c295f27a96b9435935807a7359f67f3d80477d4716fe3e1e237e446d7a883bef44a541a8525b7fb671253bdb0bad00d4d1c6f87c839d87caf2b8bc11f915bc6d88a37a110b3efddbf98641ca0093fd4e54f70e5f5fc9f384a64fb24ea6dc4fead27321b58dbad2312bf5607f8d292fac7766f319fadc2128d12941575c006ed014f9a8c9ee2589e13f0cc8b6630ca6";
process (ACLK) is
   begin  -- process The_SW_accelerator
    if ACLK'event and ACLK = '1' then     -- Rising clock edge
      if ARESETN = '0' then               -- Synchronous reset (active low)
        -- CAUTION: make sure your reset polarity is consistent with the
        -- system reset polarity
        state        <= Idle;
        nr_of_reads  <= 0;
        nr_of_writes <= 0;
      else
        case state is
          when Idle =>            
            if (S_AXIS_TVALID = '1') then
              state       <= Read_Inputs;
              nr_of_reads <= NUMBER_OF_INPUT_WORDS - 1;
            end if;

          when Read_Inputs =>
            if (S_AXIS_TVALID = '1') then
                input_mem(nr_of_reads) <= std_logic_vector(unsigned(S_AXIS_TDATA));
                  if (nr_of_reads = 0) then
                    if key_valid = '1' then
                        input_cipher <= input_mem(3) & input_mem(2) & input_mem(1) & std_logic_vector(unsigned(S_AXIS_TDATA));
                        state        <= Computing;
                        cipher_enable <= '1';
                    else
                        input_key <= input_mem(3) & input_mem(2) & input_mem(1) & std_logic_vector(unsigned(S_AXIS_TDATA));
                        state <= Key_Expansion;
                        key_enable <= '1';                  
                    end if;
                  else
                    nr_of_reads <= nr_of_reads - 1;
                  end if;
            end if;
          
          when Key_Expansion =>
            key_enable <= '0';
            if key_valid = '1' then
                state <= Write_Outputs;
                key <= output_key;
                output <= output_key(1407 downto 1280);
                nr_of_writes <= NUMBER_OF_OUTPUT_WORDS - 1;
            end if;

          when Computing =>
            cipher_enable <= '0';
            if cipher_valid = '1' then
              state        <= Write_Buffer;
            end if;
          
          when Write_Buffer =>
            output <= output_cipher;
            state <= Write_Outputs;
            nr_of_writes <= NUMBER_OF_OUTPUT_WORDS - 1;
            
          when Write_Outputs =>
            if (M_AXIS_TREADY = '1') then
              if (nr_of_writes = 0) then
                state <= Idle;
              else
                nr_of_writes <= nr_of_writes - 1;
              end if;
            end if;
        end case;
      end if;
    end if;
   end process The_SW_accelerator;

    key_expand  : entity work.key_expansion(behavioral)
            port map(
                clk => ACLK,
                input => input_key,
                output => output_key,
                enable => key_enable,
                valid => key_valid
                );
     invcipher: entity work.InvCipher(behavioral)
           port map(
                clk => ACLK,
                input => input_cipher,
                output => output_cipher,
                keys => key,
                enable => cipher_enable,
                valid => cipher_valid
                );  
   
end architecture EXAMPLE; 