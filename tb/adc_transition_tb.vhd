library ieee;
use std.textio.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use IEEE.std_logic_textio.all;  -- use -fsynopsys or --std=08 
library work;
use work.common.all;

--  Defines a testbench (without any ports)
entity adc_trans_tb is
end adc_trans_tb;

architecture behaviour of adc_trans_tb is
  component adc_trans is
    port (
      ACLK           : in  std_logic;

      ADC_DATA_I     : in  std_logic_vector(ADC_DATA_WIDTH downto 0);
      CONFIG_I       : in  std_logic_vector(C_RB_DATA_WIDTH-1 downto 0);

      ADC_DATA_O     : out std_logic_vector(ADC_DATA_WIDTH downto 0);
      LOOK_O     : out std_logic_vector(C_RB_DATA_WIDTH-1 downto 0)
    );
  end component;
  signal count     : integer := 0;
  signal aclk      : std_logic;
  signal config    : std_logic_vector(C_RB_DATA_WIDTH-1 downto 0) := (others => '0');
  signal look      : std_logic_vector(C_RB_DATA_WIDTH-1 downto 0);

  signal do        : std_logic_vector(ADC_DATA_WIDTH downto 0);
  signal di        : std_logic_vector(ADC_DATA_WIDTH-1 downto 0) := (others => '0');
  signal diof      : std_logic := '0';
  signal data_i    : std_logic_vector(ADC_DATA_WIDTH downto 0);
begin
  uut: adc_trans port map (
    ACLK         => aclk,      
    ADC_DATA_I   => data_i,
    CONFIG_I     => config,
    ADC_DATA_O   => do,
    LOOK_O       => look
  );

  data_i(11 downto 0) <= di;
  data_i(12)          <= diof;

  
  aclk_process : process
  begin
    count <= count + 1;    
    aclk <= '1';
    wait for 5 ns;
    aclk <= '0';
    wait for 5 ns;
  end process;

  config_in : process
  begin
    wait for 18 ns;
    config <= x"00000004";
    wait for 70 ns;
    config <= x"00000000";
    wait;
  end process;

  data_in : process
  begin
    di     <= x"000";
    diof   <= '0';
    wait for 22 ns;
    di     <= x"111";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"222";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"333";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"444";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"555";
    diof   <= '0';  
    wait for 10 ns;
    di     <= x"666";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"777";
    diof   <= '0';   
    wait for 10 ns;
    di     <= x"888";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"999";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"AAA";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"BBB";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"CCC";
    diof   <= '1';  
    wait for 10 ns;
    di     <= x"DDD";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"EEE";
    diof   <= '0';  
    wait for 10 ns;
    di     <= x"FFF";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"001";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"112";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"223";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"334";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"445";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"556";
    diof   <= '0';  
    wait for 10 ns;
    di     <= x"667";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"778";
    diof   <= '0';   
    wait for 10 ns;
    di     <= x"889";
    diof   <= '1';
    wait for 10 ns;
    di     <= x"99A";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"AAB";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"BBC";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"CCD";
    diof   <= '0';  
    wait for 10 ns;
    di     <= x"DDE";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"EEF";
    diof   <= '0';  
    wait for 10 ns;
    di     <= x"FF0";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"ACE";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"222";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"333";
    diof   <= '0';
    wait for 10 ns;
    di     <= x"444";
    diof   <= '1';
    wait for 10 ns;
    di     <= x"555";
    diof   <= '0';  
    wait for 10 ns;
    di     <= x"666";
    diof   <= '0';
    wait;
  end process;

  
end behaviour;
