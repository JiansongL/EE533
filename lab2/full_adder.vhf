--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1
--  \   \         Application : sch2vhdl
--  /   /         Filename : full_adder.vhf
-- /___/   /\     Timestamp : 01/26/2026 21:49:37
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family aspartan2e -flat -suppress -w Z:/lab3/lab2/full_adder.sch full_adder.vhf
--Design Name: full_adder
--Device: aspartan2e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity full_adder is
   port ( a     : in    std_logic; 
          b     : in    std_logic; 
          c_in  : in    std_logic; 
          c_out : out   std_logic; 
          s     : out   std_logic);
end full_adder;

architecture BEHAVIORAL of full_adder is
   attribute BOX_TYPE   : string ;
   signal XLXN_1 : std_logic;
   signal XLXN_5 : std_logic;
   signal XLXN_6 : std_logic;
   signal XLXN_7 : std_logic;
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : XOR2
      port map (I0=>b,
                I1=>a,
                O=>XLXN_1);
   
   XLXI_2 : XOR2
      port map (I0=>c_in,
                I1=>XLXN_1,
                O=>s);
   
   XLXI_3 : OR3
      port map (I0=>XLXN_7,
                I1=>XLXN_6,
                I2=>XLXN_5,
                O=>c_out);
   
   XLXI_4 : AND2
      port map (I0=>b,
                I1=>a,
                O=>XLXN_5);
   
   XLXI_6 : AND2
      port map (I0=>b,
                I1=>c_in,
                O=>XLXN_7);
   
   XLXI_7 : AND2
      port map (I0=>c_in,
                I1=>a,
                O=>XLXN_6);
   
end BEHAVIORAL;


