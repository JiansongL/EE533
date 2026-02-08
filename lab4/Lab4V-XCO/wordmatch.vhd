--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1
--  \   \         Application : sch2vhdl
--  /   /         Filename : wordmatch.vhf
-- /___/   /\     Timestamp : 01/31/2026 18:40:16
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family spartan3a -flat -suppress -w C:/labs/Lab3Attempt5/wordmatch.sch wordmatch.vhf
--Design Name: wordmatch
--Device: spartan3a
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--
----- CELL OR8_HXILINX_wordmatch -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR8_HXILINX_wordmatch is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic;
    I6  : in std_logic;
    I7  : in std_logic
  );
end OR8_HXILINX_wordmatch;

architecture OR8_HXILINX_wordmatch_V of OR8_HXILINX_wordmatch is
begin
  O <= (I0 or I1 or I2 or I3 or I4 or I5 or I6 or I7);
end OR8_HXILINX_wordmatch_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity wordmatch is
   port ( datacomp : in    std_logic_vector (55 downto 0); 
          datain   : in    std_logic_vector (111 downto 0); 
          wildcard : in    std_logic_vector (6 downto 0); 
          match    : out   std_logic);
end wordmatch;

architecture BEHAVIORAL of wordmatch is
   attribute HU_SET     : string ;
   signal XLXN_13  : std_logic;
   signal XLXN_14  : std_logic;
   signal XLXN_15  : std_logic;
   signal XLXN_16  : std_logic;
   signal XLXN_17  : std_logic;
   signal XLXN_18  : std_logic;
   signal XLXN_19  : std_logic;
   signal XLXN_20  : std_logic;
   component comparator
      port ( A     : in    std_logic_vector (55 downto 0); 
             B     : in    std_logic_vector (55 downto 0); 
             amask : in    std_logic_vector (6 downto 0); 
             match : out   std_logic);
   end component;
   
   component OR8_HXILINX_wordmatch
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             I6 : in    std_logic; 
             I7 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_25 : label is "XLXI_25_0";
begin
   XLXI_1 : comparator
      port map (A(55 downto 0)=>datacomp(55 downto 0),
                amask(6 downto 0)=>wildcard(6 downto 0),
                B(55 downto 0)=>datain(111 downto 56),
                match=>XLXN_20);
   
   XLXI_2 : comparator
      port map (A(55 downto 0)=>datacomp(55 downto 0),
                amask(6 downto 0)=>wildcard(6 downto 0),
                B(55 downto 0)=>datain(103 downto 48),
                match=>XLXN_19);
   
   XLXI_3 : comparator
      port map (A(55 downto 0)=>datacomp(55 downto 0),
                amask(6 downto 0)=>wildcard(6 downto 0),
                B(55 downto 0)=>datain(95 downto 40),
                match=>XLXN_15);
   
   XLXI_4 : comparator
      port map (A(55 downto 0)=>datacomp(55 downto 0),
                amask(6 downto 0)=>wildcard(6 downto 0),
                B(55 downto 0)=>datain(87 downto 32),
                match=>XLXN_14);
   
   XLXI_5 : comparator
      port map (A(55 downto 0)=>datacomp(55 downto 0),
                amask(6 downto 0)=>wildcard(6 downto 0),
                B(55 downto 0)=>datain(79 downto 24),
                match=>XLXN_13);
   
   XLXI_6 : comparator
      port map (A(55 downto 0)=>datacomp(55 downto 0),
                amask(6 downto 0)=>wildcard(6 downto 0),
                B(55 downto 0)=>datain(71 downto 16),
                match=>XLXN_16);
   
   XLXI_7 : comparator
      port map (A(55 downto 0)=>datacomp(55 downto 0),
                amask(6 downto 0)=>wildcard(6 downto 0),
                B(55 downto 0)=>datain(63 downto 8),
                match=>XLXN_17);
   
   XLXI_8 : comparator
      port map (A(55 downto 0)=>datacomp(55 downto 0),
                amask(6 downto 0)=>wildcard(6 downto 0),
                B(55 downto 0)=>datain(55 downto 0),
                match=>XLXN_18);
   
   XLXI_25 : OR8_HXILINX_wordmatch
      port map (I0=>XLXN_20,
                I1=>XLXN_19,
                I2=>XLXN_15,
                I3=>XLXN_14,
                I4=>XLXN_13,
                I5=>XLXN_16,
                I6=>XLXN_17,
                I7=>XLXN_18,
                O=>match);
   
end BEHAVIORAL;


