----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.05.2023 11:36:25
-- Design Name: 
-- Module Name: MOVSENSOR - sensor
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

entity MOVSENSOR is
   generic(N: integer := 30);
    port(entrada,clk: in STD_LOGIC;
         sal: out STD_LOGIC);
end MOVSENSOR;

architecture sensor of MOVSENSOR is
    component RegistroSerie 
        Port (entrada,clock: IN STD_LOGIC;
              salida: OUT STD_LOGIC_VECTOR (N downto 0));
    end component;
signal s_reg: STD_LOGIC_VECTOR(N downto 0);
signal htemp: STD_LOGIC;
begin
process(s_reg)
    variable temp : std_logic;
    begin
    temp := '0';
    for i in 0 to N loop
        temp := temp or s_reg(i);
    end loop;
    htemp <= temp;
end process;
    reg: RegistroSerie port map(entrada,clk,s_reg);
     sal <= htemp;
end sensor;
