----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2023 12:46:04
-- Design Name: 
-- Module Name: RegistroParalelo_1b - reg
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

entity RegistroSerie is
    generic(N: integer := 30);
    Port (entrada,clock: IN STD_LOGIC;
          salida: OUT STD_LOGIC_VECTOR (N downto 0));
end RegistroSerie;

architecture reg of RegistroSerie is
    component BiestableD
        Port (D,clk: IN STD_LOGIC;
            Q,Qn: OUT STD_LOGIC);
    end component;
    signal q_temp,qn_temp: STD_LOGIC_VECTOR(N downto 0);
begin
    salida <= q_temp;
    d1: BiestableD port map (entrada,clock,q_temp(0),qn_temp(0));
    blk: for i in 1 to N-1 generate
        dn: BiestableD port map(q_temp(i-1),clock,q_temp(i),qn_temp(i));
    end generate;
end reg;
