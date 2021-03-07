library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topFSM is
	port (
		clock : in std_logic;
		button : in std_logic_vector(1 downto 0);
		mode : out std_logic_vector(1 downto 0);
		clockGeneration : out std_logic
	);
end topFSM;

architecture behavior of topFSM is
type Sreg_type is (a0, a1, a2, a3);
signal Sreg: Sreg_type:=a0;
signal clockSig : std_logic:='0';

begin

process(clock)
	begin
		if(rising_edge(clock)) then
			case Sreg is
				when a0 => 
						mode <= "00";
						if(button(1) = '1') then
							Sreg <= a1;
						else
							Sreg <= a0;
						end if;
						if(button(0) = '1') then
						    clockSig <= not clockSig;
						end if;
						   
				when a1 => 
						mode <= "01";
						if(button(1) = '1') then
							Sreg <= a2;
						else
							Sreg <= a1;
						end if;
						if(button(0) = '1') then
						    clockSig <= not clockSig;
						end if;
				when a2 => 
						mode <= "10";
						if(button(1) = '1') then
							Sreg <= a3;
						else
							Sreg <= a2;
						end if;
						if(button(0) = '1') then
						    clockSig <= not clockSig;
						end if;
				when a3 => 
						mode <= "11";
						if(button(1) = '1') then
							Sreg <= a3;
						else
							Sreg <= a0;
						end if;						
						if(button(0) = '1') then
						    clockSig <= not clockSig;
						end if;
			end case;
		  clockGeneration <= clockSig;
		end if;	
	end process;
end behavior;
