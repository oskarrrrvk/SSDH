----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2023 11:07:49
-- Design Name: 
-- Module Name: Sistema - Behavioral
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

entity Sistema is
    generic(N: integer := 30);
    Port (e_movimiento,clk,e_ventana,e_PIR,enable: in std_logic;
          H: out std_logic);
end Sistema;

architecture sis of Sistema is
    component MOVSENSOR 
             port(
             entrada,clk: in STD_LOGIC;
             sal: out STD_LOGIC);
    end component;
    signal s_mov,e_mov: STD_LOGIC;
    

begin
e_mov <= e_movimiento;
mov: MOVSENSOR port map(e_mov,clk, s_mov);

H <= (s_mov or not e_ventana or e_PIR) and enable;

end sis;
