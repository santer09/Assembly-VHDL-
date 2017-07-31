-- use of the unsigned package allows us to perfrom
-- unsigned arithmetic operations ('+', '-' etc).
-- Another useful package is the 
-- IEEE.std_logic_arith.all
--Erick Santos
--Team 11

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity lightController is
    port(Clk, Input, R: in std_logic;
        Output: out std_logic_vector (1 downto 0));
end lightController;

architecture stateBehavior of lightController is
    type statetype is (S0, S1, S2);
    signal state, next_state: statetype:= S0;-- intitial state is S0
begin
	processOne_Nextstate_and_Output: process (state, Input, R) is
	begin
	if R = '1' then
		Output <= "00";
		next_state <= S0;
	else
		case state is 
			when S0 => 
			if Input = '0' then 
				Output <= "10";
				next_state <= S1; 
			else Output<= "00";
				next_state <= S2; 
			end if;

			when S1 => 
			if Input= '0' then
				Output <= "01";
				next_state <= S0; 
			else Output<= "00"; 
				next_state <= S2;
			end if;
		 
			when S2 => 
			if Input= '0' then
				Output<= "01";
				next_state <= S0; 
			else Output <= "00";
				next_state <= S2;
			end if;
		end case;
	end if;
end process processOne_Nextstate_and_Output;

	processTwo_Clock_process: process is
	begin
	wait until(clk'event and clk='1'); -- Wait until rising edge
		state<=next_state;
	end process processTwo_Clock_process;
	
end architecture stateBehavior;







