----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2023 12:36:17
-- Design Name: 
-- Module Name: BiestableD - Behavioral
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

entity BiestableD is
    Port (D,clk: IN STD_LOGIC;
          Q,Qn: OUT STD_LOGIC);
end BiestableD;

architecture Behavioral of BiestableD is

begin
    process (clk)
    begin
        if(rising_edge(clk))then
            Q <= D; 
            Qn <= not D;
         end if;
    end process;

end Behavioral;
