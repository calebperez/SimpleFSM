library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity definition for the FSM
Entity SimpleFSM is

Port (
  clock: IN STD_LOGIC;
  reset: IN STD_LOGIC;
  P: IN STD_LOGIC;
  
  R: OUT STD_LOGIC);
  
END SimpleFSM;

--architecture definition for the fsm
Architecture RTL of SimpleFSM is
  TYPE State_type IS (A, B, C, D); --define the states.
  SIGNAL State:State_Type; -- create a signal that uses the different states.
  
BEGIN
  PROCESS(clock, reset)
  BEGIN
    If (reset = '1') THEN --Update reset, set the state to A.
      State <= A;
      
  ELSIF rising_edge(clock) THEN -- if there is a rising edge of the clock, do the stuff below.
    
    --The case statement checks the value of the state variable.
    --and base on the value and any other control signal changes to a new state!
    
    CASE State IS
      
      --if the current state is A and P is set to 1, then the next state is B.
      WHEN A =>
        IF P = '1' THEN
          State <= B;
        END IF;
        
      --When current state is B and p is 1 then set to state c
      WHEN B =>
        IF P = '1' THEN
          State <= C;
        END IF;
        
      --When current state is C and p is 1 then set to state d
      WHEN C =>
        IF P = '1' THEN
          State <= D;
        END IF;
        
      --When current state is D and p is 1 then set to state B.
      --if p is 0 then set to state A.
      WHEN D =>
        IF P = '1' THEN
          State <= B;
        ELSE
          State <= A;
        END IF;
        
      WHEN others =>
        State <= A;
        
    END CASE;
    
  END IF;

END PROCESS;

--Decode the state to create the output. ABC output 0 and D outputs 1.
R <= '1' WHEN State = D ELSE '0';

END rtl;