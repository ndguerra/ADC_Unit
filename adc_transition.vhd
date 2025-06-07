library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.common.all;

entity adc_trans is
  port(
    ACLK           : in  std_logic;

    -- Data
    ADC_DATA_I     : in  std_logic_vector(ADC_DATA_WIDTH downto 0);
    ADC_DATA_O     : out std_logic_vector(ADC_DATA_WIDTH downto 0) := (others => '0');
    LOOK_O         : out std_logic_vector(C_RB_DATA_WIDTH-1 downto 0) := (others => '0');

    CONFIG_I       : in  std_logic_vector(C_RB_DATA_WIDTH-1 downto 0)
    );
end entity adc_trans;

architecture behavioral of adc_trans is
  signal clk       : std_logic;
  signal adc_data  : std_logic_vector(ADC_DATA_WIDTH downto 0) := (others => '0');
  signal mode      : std_logic := '0';
begin
  clk  <= ACLK;
  mode <= CONFIG_I(2);

  process(clk)
    variable count : unsigned(ADC_DATA_WIDTH downto 0) := (others => '0');
  begin
    if (falling_edge(clk)) then
      adc_data <= ADC_DATA_I;
    elsif (rising_edge(clk)) then
      LOOK_O(ADC_DATA_WIDTH downto 0) <= adc_data;
      count := count + 1;
      if (mode = '1') then
        ADC_DATA_O <= adc_data;
      else
        ADC_DATA_O <= std_logic_vector(count);
      end if;
    end if;
  end process;

end behavioral;
