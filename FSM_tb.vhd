library ieee;
use ieee.std_logic_1164.all;
library work;
use work.all;

entity FSM_tb is
end FSM_tb;

architecture behave of FSM_tb is
  signal clock_in : std_logic := '0';
  signal reset_in : std_logic := '0';
  signal p_in     : std_logic := '0';
  signal r_out    : std_logic := '0';
  
  begin
    
    FSM_INST: entity work.simpleFSM
      port map (
        clock => clock_in,
        reset => Reset_in,
        P => P_in,
        R => R_out
        );
        
    process is
      begin 
        --This should go A, B, C, D, A.
      P_in <= '1';
      Reset_in <= '0';
      wait for 100 ns;
      P_in <= '1';
      Reset_in <= '0';
      wait for 100 ns;
      P_in <= '1';
      Reset_in <= '0';
      wait for 100 ns;
      P_in <= '0';
      Reset_in <= '0';
      wait for 100 ns;
      
      -- This should go A, B, C, D, B
      P_in <= '1';
      Reset_in <= '0';
      wait for 100 ns;
      P_in <= '1';
      Reset_in <= '0';
      wait for 100 ns;
      P_in <= '1';
      Reset_in <= '0';
      wait for 100 ns;
      P_in <= '1';
      Reset_in <= '0';
      wait for 100 ns;
      
      --Resets after A, B, C, Then should go back to A.
      P_in <= '1';
      Reset_in <= '0';
      wait for 100 ns;
      P_in <= '1';
      Reset_in <= '0';
      wait for 100 ns;
      P_in <= '1';
      Reset_in <= '1';
      wait for 100 ns;
  end process;
end behave;