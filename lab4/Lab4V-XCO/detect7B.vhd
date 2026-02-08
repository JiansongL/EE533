--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1
--  \   \         Application : sch2vhdl
--  /   /         Filename : detect7B.vhf
-- /___/   /\     Timestamp : 01/31/2026 18:40:20
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family spartan3a -flat -suppress -w C:/labs/Lab3Attempt5/detect7B.sch detect7B.vhf
--Design Name: detect7B
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

entity detect7B is
   port ( ce       : in    std_logic; 
          clk      : in    std_logic; 
          hwregA   : in    std_logic_vector (63 downto 0); 
          match_en : in    std_logic; 
          mrst     : in    std_logic; 
          pipe1    : in    std_logic_vector (71 downto 0); 
          match    : out   std_logic; 
          XLXN_31  : out   std_logic);
end detect7B;

architecture BEHAVIORAL of detect7B is
   attribute INIT       : string ;
   attribute BOX_TYPE   : string ;
   signal pipe0         : std_logic_vector (71 downto 0);
   signal XLXN_21       : std_logic;
   signal XLXN_36       : std_logic;
   signal XLXN_43       : std_logic_vector (111 downto 0);
   signal XLXN_31_DUMMY : std_logic;
   signal match_DUMMY   : std_logic;
   component wordmatch
      port ( datain   : in    std_logic_vector (111 downto 0); 
             datacomp : in    std_logic_vector (55 downto 0); 
             wildcard : in    std_logic_vector (6 downto 0); 
             match    : out   std_logic);
   end component;
   
   component FD
      -- synopsys translate_off
      generic( INIT : bit :=  '0');
      -- synopsys translate_on
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute INIT of FD : component is "0";
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component FDCE
      -- synopsys translate_off
      generic( INIT : bit :=  '0');
      -- synopsys translate_on
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute INIT of FDCE : component is "0";
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component busmerge
      port ( da : in    std_logic_vector (47 downto 0); 
             db : in    std_logic_vector (63 downto 0); 
             q  : out   std_logic_vector (111 downto 0));
   end component;
   
   component reg9B
      port ( d   : in    std_logic_vector (71 downto 0); 
             clr : in    std_logic; 
             clk : in    std_logic; 
             ce  : in    std_logic; 
             q   : out   std_logic_vector (71 downto 0));
   end component;
   
begin
   match <= match_DUMMY;
   XLXN_31 <= XLXN_31_DUMMY;
   XLXI_4 : wordmatch
      port map (datacomp(55 downto 0)=>hwregA(55 downto 0),
                datain(111 downto 0)=>XLXN_43(111 downto 0),
                wildcard(6 downto 0)=>hwregA(62 downto 56),
                match=>XLXN_31_DUMMY);
   
   XLXI_5 : FD
      port map (C=>clk,
                D=>mrst,
                Q=>XLXN_36);
   
   XLXI_6 : FDCE
      port map (C=>clk,
                CE=>XLXN_21,
                CLR=>XLXN_36,
                D=>XLXN_21,
                Q=>match_DUMMY);
   
   XLXI_8 : AND3B1
      port map (I0=>match_DUMMY,
                I1=>match_en,
                I2=>XLXN_31_DUMMY,
                O=>XLXN_21);
   
   XLXI_9 : busmerge
      port map (da(47 downto 0)=>pipe0(47 downto 0),
                db(63 downto 0)=>pipe1(63 downto 0),
                q(111 downto 0)=>XLXN_43(111 downto 0));
   
   XLXI_10 : reg9B
      port map (ce=>ce,
                clk=>clk,
                clr=>XLXN_36,
                d(71 downto 0)=>pipe1(71 downto 0),
                q(71 downto 0)=>pipe0(71 downto 0));
   
end BEHAVIORAL;


