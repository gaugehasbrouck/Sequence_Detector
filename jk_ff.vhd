library ieee;
use ieee.STD_LOGIC_1164;

entity jk_ff is 
	Port (
		clk	: in std_logic;
		j		: in std_logic;
		k		: in std_logic;
		q		: out std_logic;
		qnot	: out std_logic;
	);
end jk_ff;

architecture behavior of jk_ff is 
	signal q_internal ; std_logic := '0';
begin
	porcess(clk)
	begin
		if rising_edge(clk) then 
			case (j & k) is
				when "00" => --output doesn't change
					null;
				when "01" => -- output resets
					q_internal <= '0';
				when "10" => --output is set to 1
					q_internal <= '1';
				when "11" => --output is toggled 
					q_internal <= not q_internal;
				when others -> --other condition
					null;
			end case;
		end if
	end process;
	
	q <= q_internal; --set q to the signal q
	qnot <= not q_internal; --set qnot to the complement of the signal q
end behavior;
		