--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1
--  \   \         Application : sch2vhdl
--  /   /         Filename : comp8.vhf
-- /___/   /\     Timestamp : 01/31/2026 18:40:17
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family spartan3a -flat -suppress -w C:/labs/Lab3Attempt5/comp8.sch comp8.vhf
--Design Name: comp8
--Device: spartan3a
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity comp8 is
   port ( A  : in    std_logic_vector (7 downto 0); 
          B  : in    std_logic_vector (7 downto 0); 
          EQ : out   std_logic);
end comp8;

architecture BEHAVIORAL of comp8 is
   attribute BOX_TYPE   : string ;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_23 : std_logic;
   signal XLXN_24 : std_logic;
   signal XLXN_25 : std_logic;
   signal XLXN_26 : std_logic;
   signal XLXN_27 : std_logic;
   signal XLXN_28 : std_logic;
   signal XLXN_29 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component XNOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XNOR2 : component is "BLACK_BOX";
   
begin
   XLXI_9 : AND2
      port map (I0=>XLXN_29,
                I1=>XLXN_28,
                O=>EQ);
   
   XLXI_10 : AND4
      port map (I0=>XLXN_18,
                I1=>XLXN_22,
                I2=>XLXN_26,
                I3=>XLXN_27,
                O=>XLXN_28);
   
   XLXI_11 : AND4
      port map (I0=>XLXN_25,
                I1=>XLXN_24,
                I2=>XLXN_23,
                I3=>XLXN_19,
                O=>XLXN_29);
   
   XLXI_20 : XNOR2
      port map (I0=>B(7),
                I1=>A(7),
                O=>XLXN_27);
   
   XLXI_21 : XNOR2
      port map (I0=>B(6),
                I1=>A(6),
                O=>XLXN_26);
   
   XLXI_22 : XNOR2
      port map (I0=>B(5),
                I1=>A(5),
                O=>XLXN_22);
   
   XLXI_23 : XNOR2
      port map (I0=>B(4),
                I1=>A(4),
                O=>XLXN_18);
   
   XLXI_24 : XNOR2
      port map (I0=>B(3),
                I1=>A(3),
                O=>XLXN_19);
   
   XLXI_25 : XNOR2
      port map (I0=>B(2),
                I1=>A(2),
                O=>XLXN_23);
   
   XLXI_26 : XNOR2
      port map (I0=>B(1),
                I1=>A(1),
                O=>XLXN_24);
   
   XLXI_27 : XNOR2
      port map (I0=>B(0),
                I1=>A(0),
                O=>XLXN_25);
   
end BEHAVIORAL;


