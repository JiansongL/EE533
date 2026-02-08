--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1
--  \   \         Application : sch2vhdl
--  /   /         Filename : comparator.vhf
-- /___/   /\     Timestamp : 01/31/2026 18:40:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family spartan3a -flat -suppress -w C:/labs/Lab3Attempt5/comparator.sch comparator.vhf
--Design Name: comparator
--Device: spartan3a
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--
----- CELL AND7_HXILINX_comparator -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AND7_HXILINX_comparator is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic;
    I6  : in std_logic
  );
end AND7_HXILINX_comparator;

architecture AND7_HXILINX_comparator_V of AND7_HXILINX_comparator is
begin
  O <= I0 and I1 and I2 and I3 and I4 and I5 and I6;
end AND7_HXILINX_comparator_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity comp8_MUSER_comparator is
   port ( A  : in    std_logic_vector (7 downto 0); 
          B  : in    std_logic_vector (7 downto 0); 
          EQ : out   std_logic);
end comp8_MUSER_comparator;

architecture BEHAVIORAL of comp8_MUSER_comparator is
   attribute BOX_TYPE   : string ;
   signal AB0  : std_logic;
   signal AB1  : std_logic;
   signal AB2  : std_logic;
   signal AB3  : std_logic;
   signal AB4  : std_logic;
   signal AB5  : std_logic;
   signal AB6  : std_logic;
   signal AB7  : std_logic;
   signal AB03 : std_logic;
   signal AB47 : std_logic;
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
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   I_36_32 : AND4
      port map (I0=>AB7,
                I1=>AB6,
                I2=>AB5,
                I3=>AB4,
                O=>AB47);
   
   I_36_33 : XNOR2
      port map (I0=>B(6),
                I1=>A(6),
                O=>AB6);
   
   I_36_34 : XNOR2
      port map (I0=>B(7),
                I1=>A(7),
                O=>AB7);
   
   I_36_35 : XNOR2
      port map (I0=>B(5),
                I1=>A(5),
                O=>AB5);
   
   I_36_36 : XNOR2
      port map (I0=>B(4),
                I1=>A(4),
                O=>AB4);
   
   I_36_41 : AND4
      port map (I0=>AB3,
                I1=>AB2,
                I2=>AB1,
                I3=>AB0,
                O=>AB03);
   
   I_36_42 : XNOR2
      port map (I0=>B(2),
                I1=>A(2),
                O=>AB2);
   
   I_36_43 : XNOR2
      port map (I0=>B(3),
                I1=>A(3),
                O=>AB3);
   
   I_36_44 : XNOR2
      port map (I0=>B(1),
                I1=>A(1),
                O=>AB1);
   
   I_36_45 : XNOR2
      port map (I0=>B(0),
                I1=>A(0),
                O=>AB0);
   
   I_36_50 : AND2
      port map (I0=>AB47,
                I1=>AB03,
                O=>EQ);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity comparator is
   port ( A     : in    std_logic_vector (55 downto 0); 
          amask : in    std_logic_vector (6 downto 0); 
          B     : in    std_logic_vector (55 downto 0); 
          match : out   std_logic);
end comparator;

architecture BEHAVIORAL of comparator is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_112 : std_logic;
   signal XLXN_113 : std_logic;
   signal XLXN_114 : std_logic;
   signal XLXN_115 : std_logic;
   signal XLXN_116 : std_logic;
   signal XLXN_117 : std_logic;
   signal XLXN_118 : std_logic;
   signal XLXN_119 : std_logic;
   signal XLXN_120 : std_logic;
   signal XLXN_121 : std_logic;
   signal XLXN_122 : std_logic;
   signal XLXN_123 : std_logic;
   signal XLXN_124 : std_logic;
   signal XLXN_125 : std_logic;
   component comp8_MUSER_comparator
      port ( B  : in    std_logic_vector (7 downto 0); 
             A  : in    std_logic_vector (7 downto 0); 
             EQ : out   std_logic);
   end component;
   
   component OR2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2B1 : component is "BLACK_BOX";
   
   component AND7_HXILINX_comparator
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             I6 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_37 : label is "XLXI_37_0";
begin
   XLXI_2 : comp8_MUSER_comparator
      port map (A(7 downto 0)=>A(55 downto 48),
                B(7 downto 0)=>B(55 downto 48),
                EQ=>XLXN_112);
   
   XLXI_3 : comp8_MUSER_comparator
      port map (A(7 downto 0)=>A(47 downto 40),
                B(7 downto 0)=>B(47 downto 40),
                EQ=>XLXN_113);
   
   XLXI_4 : comp8_MUSER_comparator
      port map (A(7 downto 0)=>A(39 downto 32),
                B(7 downto 0)=>B(39 downto 32),
                EQ=>XLXN_114);
   
   XLXI_5 : comp8_MUSER_comparator
      port map (A(7 downto 0)=>A(31 downto 24),
                B(7 downto 0)=>B(31 downto 24),
                EQ=>XLXN_115);
   
   XLXI_6 : comp8_MUSER_comparator
      port map (A(7 downto 0)=>A(23 downto 16),
                B(7 downto 0)=>B(23 downto 16),
                EQ=>XLXN_116);
   
   XLXI_7 : comp8_MUSER_comparator
      port map (A(7 downto 0)=>A(15 downto 8),
                B(7 downto 0)=>B(15 downto 8),
                EQ=>XLXN_117);
   
   XLXI_8 : comp8_MUSER_comparator
      port map (A(7 downto 0)=>A(7 downto 0),
                B(7 downto 0)=>B(7 downto 0),
                EQ=>XLXN_118);
   
   XLXI_24 : OR2B1
      port map (I0=>amask(6),
                I1=>XLXN_112,
                O=>XLXN_119);
   
   XLXI_25 : OR2B1
      port map (I0=>amask(5),
                I1=>XLXN_113,
                O=>XLXN_120);
   
   XLXI_26 : OR2B1
      port map (I0=>amask(4),
                I1=>XLXN_114,
                O=>XLXN_121);
   
   XLXI_27 : OR2B1
      port map (I0=>amask(3),
                I1=>XLXN_115,
                O=>XLXN_122);
   
   XLXI_28 : OR2B1
      port map (I0=>amask(0),
                I1=>XLXN_118,
                O=>XLXN_125);
   
   XLXI_29 : OR2B1
      port map (I0=>amask(1),
                I1=>XLXN_117,
                O=>XLXN_124);
   
   XLXI_30 : OR2B1
      port map (I0=>amask(2),
                I1=>XLXN_116,
                O=>XLXN_123);
   
   XLXI_37 : AND7_HXILINX_comparator
      port map (I0=>XLXN_125,
                I1=>XLXN_124,
                I2=>XLXN_123,
                I3=>XLXN_122,
                I4=>XLXN_121,
                I5=>XLXN_120,
                I6=>XLXN_119,
                O=>match);
   
end BEHAVIORAL;


