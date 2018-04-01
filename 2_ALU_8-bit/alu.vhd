-----------------------------------------------
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------
entity alu is 
	port( X,Y : in std_logic_vector(7 downto 0); x0,x1 : in std_logic ;
                Z : out std_logic_vector(7 downto 0));
end entity;

architecture behave of alu is 
	signal sig1,sig2,sig3,sig4 : std_logic_vector(7 downto 0);

    component EightBitAdder is
    port (x,y: in std_logic_vector(7 downto 0) ;
         sum: out std_logic_vector(7 downto 0) );
    end component EightBitAdder;

    component Substractor is
    	port (x,y: in std_logic_vector(7 downto 0) ;
         sum: out std_logic_vector(7 downto 0)     		
    	);
    end component Substractor;

    component Lshift is
    port (a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0);
       z: out std_logic_vector(7 downto 0));
    end component Lshift;

    component Rshift is
    port (a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0);
       z: out std_logic_vector(7 downto 0));
    end component Rshift;
-----------------------------------------------			
begin 
a: EightBitAdder port map(x => X, y => Y, sum => sig1);
b: Lshift port map(a => X, b => Y, z => sig4);
c: Rshift port map(a => X, b => Y, z => sig3);
d: Substractor  port map(x => X, y => Y, sum => sig2);
-----------------------------------------------

process(x0, x1,sig1, sig2, sig3, sig4)
begin
------------------------------
if (x0 = '0' and x1 = '0') then
z<= sig1;
elsif(x0 = '1') and (x1 = '0') then
z<= sig2;
elsif(x0 = '0') and (x1 = '1') then
z<= sig3;
else
z<= sig4;
end if;
------------------------------
end process;

end behave;
