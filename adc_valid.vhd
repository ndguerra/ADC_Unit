library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.common.all;

entity adc_valid is
  port (
    ACLK               : in  std_logic;
    ARESETN            : in  std_logic;

    VALID_O            : out std_logic;
    ADC_VALID_CONFIG_I : in  std_logic_vector(C_RB_DATA_WIDTH-1 downto 0);

    RISING_EDGE_I      : in  std_logic;
    FALLING_EDGE_I     : in  std_logic
    );
end entity adc_valid;

architecture behavioral of adc_valid is
  signal clk       : std_logic;
  signal rst       : std_logic;
  signal valid     : std_logic;
  
  signal config    : std_logic_vector(C_RB_DATA_WIDTH-1 downto 0) := (others => '0');
 
begin
  clk         <= ACLK;
  rst         <= not ARESETN;
  VALID_O     <= valid;

  config      <= ADC_VALID_CONFIG_I;

  process(clk,rst)
  begin
    if (rst = '1') then
      valid  <= '0';
    elsif (rising_edge(clk)) then
      if (config = x"FFFFFFFF") then
        valid <= '0';
      else
        valid  <= '1';
      end if;
    end if;
  end process;

end behavioral;
