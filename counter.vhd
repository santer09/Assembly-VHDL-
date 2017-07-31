--Erick Santos
--Team 11

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
	port(R, Clk, U: in std_logic;
	     Q: out std_logic_vector(3 downto 0));
end entity;

architecture behavior of counter is 
begin

	process(R, Clk, U) is
	variable Q_val: std_logic_vector(3 downto 0):= x"0";

begin
	if R='1' then Q_val:=x"0";
	elsif U='1' and rising_edge(Clk) then Q_val:= Q_val+1;
	elsif U='0' and rising_edge(Clk) then Q_val:= Q_val-1;
end if;
	Q <= Q_val;
end process;
end architecture;
--force -repeat 20 Clk 0 0, 1 5, 0 10, 1 15 
--force U 0 0
